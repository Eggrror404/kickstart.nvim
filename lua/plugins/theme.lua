return {
  {
    'catppuccin/nvim',
    priority = 1000,
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      integrations = {
        fidget = true,
        mason = true,
        notify = true,
        which_key = true,
        treesitter_context = true
      },
      custom_highlights = function(colors)
        return {
          Whitespace = { fg = colors.flamingo },
        }
      end,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
