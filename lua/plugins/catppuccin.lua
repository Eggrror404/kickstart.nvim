return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  opts = {
    flavour = 'mocha',
    transparent_background = true,
    integrations = {
      notify = true,
    },
  },
  config = function(_, opts)
    vim.cmd.colorscheme 'catppuccin'
    require('catppuccin').setup(opts)
  end,
}
