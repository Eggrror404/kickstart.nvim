return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'ninja', 'rst' } },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      basedpyright = {},
      ruff_lsp = {
        keys = {
          {
            '<leader>co',
            require('utils').lsp.action['source.organizeimports'],
            desc = 'Organize Imports',
          },
        },
      },
    },
  },
}
