return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      shfmt = {},
    },
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },
      },
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2' },
        },
      },
    },
  },
}
