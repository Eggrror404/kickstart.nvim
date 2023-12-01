return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = "BufEnter",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      "HiPhish/rainbow-delimiters.nvim",
      'windwp/nvim-ts-autotag',
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = { max_lines = 2 }
      }
    },
    build = ':TSUpdate',
  }
}
