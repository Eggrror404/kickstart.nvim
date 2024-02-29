return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "LazyFile",
  },
  {
    "danymat/neogen",
    cmd = "Neogen",
    keys = {
      {
        "<leader>lg",
        "<cmd>Neogen<cr>",
        desc = "Generate annotaion (Neogen)",
      },
    },
    opts = {
      snippet_engine = "luasnip",
    },
  },
  {
    "h-hg/fcitx.nvim",
    event = "InsertEnter",
  },
  {
    "michaelrommel/nvim-silicon",
    cmd = "Silicon",
    opts = {
      font = "JetBrainsMono Nerd Font;Noto Color Emoji",
      theme = "OneHalfDark",
      to_clipboard = true,
    },
  },
  {
    "Eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
  {
    "ActivityWatch/aw-watcher-vim",
    event = "VeryLazy",
    config = function()
      vim.cmd("AWStart")
    end,
  },
}
