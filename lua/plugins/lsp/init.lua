return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "plugins.lsp.prettierd" },
  { import = "plugins.lsp.python" },
  { import = "plugins.lsp.svelte" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "bash",
          "diff",
          "json",
          "lua",
          "luadoc",
          "vimdoc",
        })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "j-hui/fidget.nvim",
        opts = {
          notification = { window = { winblend = 0 } },
        },
      },
    },
    opts = {
      diagnostics = {
        virtual_text = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focused = false,
          style = "minimal",
          border = "rounded",
          source = "always",
        },
      },
      servers = {},
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      for _, k in ipairs(keys) do
        -- replace all <leader>c keymaps into <leader>l
        k[1] = k[1]:gsub("<leader>c", "<leader>l")

        if k[1] == "<leader>ll" then
          k[1] = "<leader>li"
        end
      end

      -- rounded border for diagnostics
      vim.diagnostic.config({
        float = { border = "rounded" },
      })

      -- rounded border for hover & documentation
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    end,
  },
  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>cm", false },
      { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = function(opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {})
    end,
  },
}
