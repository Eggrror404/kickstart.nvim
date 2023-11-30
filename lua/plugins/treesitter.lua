return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    }
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    }
  }
}
