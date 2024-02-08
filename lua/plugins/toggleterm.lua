local Util = require("lazyvim.util")
local term = function()
  vim.cmd("ToggleTerm dir=" .. Util.root())
end

return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  keys = {
    { "<C-/>" },
    { "<leader>t", term, desc = "Terminal" },
  },
  opts = {
    open_mapping = "<C-/>",
    direction = "float",
    float_opts = {
      border = "rounded",
    },
  },
}
