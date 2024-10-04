return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ninja", "rst" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      basedpyright = {},
      ruff_lsp = {},
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    branch = "regexp",
    cmd = "VenvSelect",
    ft = "python",
    opts = {
      parents = 5,
      name = { "venv", ".venv" },
    },
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>lv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" },
    },
  },
}
