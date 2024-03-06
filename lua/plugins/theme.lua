return {
  'catppuccin/nvim',
  lazy = false,
  priority = 1000,
  opts = {
    flavour = 'mocha',
    transparent_background = true,
  },
  config = function(_, opts)
    vim.cmd.colorscheme 'catppuccin'
    require('catppuccin').setup(opts)
  end,
}
