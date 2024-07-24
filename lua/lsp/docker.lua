return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      hadolint = {},
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        dockerfile = { "hadolint" },
      },
    },
  },
}
