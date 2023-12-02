--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>la', vim.lsp.buf.code_action, 'Code Action')

  nmap('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')
  nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
  nmap('gI', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
  nmap('gT', require('telescope.builtin').lsp_type_definitions, 'Goto Type Definition')
  nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
  nmap('<leader>lW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<M-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')

  -- Create a command `:Format` local to the LSP buffer
  nmap('<leader>lf', '<cmd>Format<cr>', 'Format Document')
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

return {
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event = 'BufEnter',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jay-babu/mason-null-ls.nvim',

      -- Useful status updates for LSP
      {
        'j-hui/fidget.nvim',
        opts = { notification = { window = { winblend = 0 } } },
      },
    },
  },

  {
    'williamboman/mason.nvim',
    config = true,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim', config = true },
    },
    opts = {
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      -- tsserver = {},
      -- html = { filetypes = { 'html', 'twig', 'hbs'} },

      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
          -- diagnostics = { disable = { 'missing-fields' } },
        },
      },
    },
    config = function(_, opts)
      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(opts),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = opts[server_name],
            filetypes = (opts[server_name] or {}).filetypes,
          }
        end,
      }
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    dependencies = {
      { 'nvimtools/none-ls.nvim', config = true },
    },
    opts = {
      stylua = {},
      shfmt = { extra_args = { '-i', '2', '-ci' } },
    },
    config = function(_, opts)
      local null_ls = require 'null-ls'
      local mason_null_ls = require 'mason-null-ls'

      null_ls.setup()
      mason_null_ls.setup {
        ensure_installed = vim.tbl_keys(opts),
        automatic_installation = true,
        handlers = {
          -- function from mason-null-ls github
          -- https://github.com/jay-babu/mason-null-ls.nvim/blob/d1f7258f80867f718d643d88eee66959671a4bef/lua/mason-null-ls/automatic_setup.lua
          function(source_name, methods)
            if not null_ls.is_registered(source_name) then
              vim.tbl_map(function(type)
                null_ls.register(null_ls.builtins[type][source_name].with(opts[source_name]))
              end, methods)
            end
          end,
        },
      }
    end,
  },
}
