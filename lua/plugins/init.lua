return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "LazyFile",
  },
  {
    "danymat/neogen",
    cmd = "Neogen",
    keys = {
      { "<leader>lg", "<cmd>Neogen<cr>" },
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
    "Eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
}
