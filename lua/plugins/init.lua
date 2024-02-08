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
    "NvChad/nvim-colorizer.lua",
    event = "LazyFile",
    opts = {
      filetypes = {
        "*",
        css = { names = true, css_fn = true },
      },
      user_default_options = {
        RGB = false, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
      },
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
  {
    "ActivityWatch/aw-watcher-vim",
    event = "VeryLazy",
    config = function()
      vim.cmd("AWStart")
    end,
  },
}
