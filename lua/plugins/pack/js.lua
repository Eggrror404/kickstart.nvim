return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      end
      vim.list_extend(opts.ensure_installed, { "javascript", "typescript", "tsx", "jsdoc" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- let typescript-tools setup tsserver
      tsserver = function() end,
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      prettierd = {},
      ["eslint-lsp"] = {},
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    opts = {
      settings = {
        expose_as_code_action = "all",
      },
    },
  },
}
