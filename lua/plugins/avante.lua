return {
  {
    "yetone/avante.nvim",
    event = "LazyFile",
    version = false,
    opts = {
      provider = "ollama",
      cursor_applying_provider = "ollama",
      ollama = {
        api_key_name = "",
        endpoint = "http://127.0.0.1:11434",
        model = "gemma3",
        stream = true,
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
