return {
  "mrjones2014/smart-splits.nvim",
  keys = function()
    local splits = require("smart-splits")
    return {
      { "<C-h>", splits.move_cursor_left, desc = "Go to left window" },
      { "<C-j>", splits.move_cursor_down, desc = "Go to lower window" },
      { "<C-k>", splits.move_cursor_up, desc = "Go to upper window" },
      { "<C-l>", splits.movecursor_right, desc = "Go to right window" },
      { "<C-Left>", splits.resize_left, desc = "Resize window leftwards" },
      { "<C-Down>", splits.resize_down, desc = "Resize window downwards" },
      { "<C-Up>", splits.resize_up, desc = "Resize window upwards" },
      {
        "<C-Right>",
        splits.resize_right,
        desc = "Resize window rightwards",
      },
    }
  end,
  opts = {},
}
