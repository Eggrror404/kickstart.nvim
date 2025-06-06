return {
  {
    "yetone/avante.nvim",
    event = "LazyFile",
    version = false,
    opts = {
      provider = "ollama",
      cursor_applying_provider = "ollama",
      providers = {
        ollama = {
          endpoint = "http://127.0.0.1:11434",
          model = "gemma3",
        },
      },
      behavior = {
        enable_cursor_planning_mode = true,
      },
      hints = { enabled = false },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
      "MeanderingProgrammer/render-markdown.nvim",
    },
  },
}
