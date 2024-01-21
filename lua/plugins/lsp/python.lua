return {
  { import = "lazyvim.plugins.extras.lang.python" },
  {
    "linux-cultist/venv-selector.nvim",
    keys = {
      { "<leader>cv", false },
      { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
  },
}
