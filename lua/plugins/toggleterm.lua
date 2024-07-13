-- variable storing the `lazygit` terminal
local lazygit

return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  keys = {
    { "<C-/>", desc = "Open Terminal" },
    {
      "<leader>t",
      function()
        require("toggleterm").toggle()
      end,
      desc = "Open Terminal",
    },
    {
      "<leader>g",
      function()
        if not lazygit then
          lazygit = require("toggleterm.terminal").Terminal:new {
            cmd = "lazygit",
            display_name = "Lazygit",
            direction = "float",
            hidden = true,
          }
        end

        lazygit:toggle()
      end,
      desc = "Lazygit",
    },
  },
  opts = {
    open_mapping = "<C-/>",
    direction = "float",
    float_opts = {
      border = "rounded",
    },
  },
}
