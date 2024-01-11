return {
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",

      -- Useful status updates for LSP
      {
        "j-hui/fidget.nvim",
        opts = { notification = { window = { winblend = 0 } } },
      },
    },
    config = require("plugins.lsp.lspconfig"),
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      -- Additional lua configuration, makes nvim stuff amazing!
      { "folke/neodev.nvim", config = true },
    },
    opts = {
      -- [server] = {options}
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      -- html = { filetypes = { 'html', 'twig', 'hbs'} },
      --
      -- or use a setup function
      -- tsserver = function() end,
    },
    config = function(_, opts)
      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(opts),
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          local server_opt = opts[server_name] or {}

          if type(server_opt) == "function" then
            server_opt()
            return
          end

          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = function(_, bufnr)
              require("plugins.lsp.keymaps").setup(bufnr)
              require("plugins.lsp.autoformat").setup(bufnr)
            end,
            settings = server_opt,
            filetypes = server_opt.filetypes,
          })
        end,
      })
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      { "nvimtools/none-ls.nvim", config = true },
    },
    opts = {
      shfmt = { extra_args = { "-i", "2", "-ci" } },
    },
    config = function(_, opts)
      local null_ls = require("null-ls")
      local mason_null_ls = require("mason-null-ls")

      null_ls.setup()
      mason_null_ls.setup({
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
      })
    end,
  },
}
