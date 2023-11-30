return {
  {
    'catppuccin/nvim',
    priority = 1000,
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          Whitespace = { fg = colors.flamingo },
        }
      end,
    },
    config = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },
}
