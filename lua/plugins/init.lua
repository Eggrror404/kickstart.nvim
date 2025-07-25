-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- Detect tabstop and shiftwidth automatically
    "NMAC427/guess-indent.nvim",
    event = "LazyFile",
    config = function()
      require("guess-indent").setup()
    end,
  },

  { "HiPhish/rainbow-delimiters.nvim", event = "LazyFile" },

  { "h-hg/fcitx.nvim", event = "InsertEnter" },

  { "Eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", event = "LazyFile" },

  { "windwp/nvim-ts-autotag", event = "LazyFile" },

  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "LazyFile",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      background_colour = "#000000",
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require "notify"
    end,
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
    "mrjones2014/smart-splits.nvim",
    keys = { ---@format disable
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Go to left window",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Go to lower window",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Go to upper window",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Go to right window",
      },
      {
        "<C-Left>",
        function()
          require("smart-splits").resize_left()
        end,
        desc = "Resize window leftwards",
      },
      {
        "<C-Down>",
        function()
          require("smart-splits").resize_down()
        end,
        desc = "Resize window downwards",
      },
      {
        "<C-Up>",
        function()
          require("smart-splits").resize_up()
        end,
        desc = "Resize window upwards",
      },
      {
        "<C-Right>",
        function()
          require("smart-splits").resize_right()
        end,
        desc = "Resize window rightwards",
      },
    },
    opts = {},
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "Avante" },
      completions = { lsp = { enabled = true } },

      heading = { icons = {} },
      code = { style = "normal" },
    },
    ft = { "markdown", "Avante" },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.lint',
  -- require "kickstart.plugins.autopairs",
}
