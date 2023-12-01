return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "debugloop/telescope-undo.nvim",
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    keys = {
      { '<leader>fo', "<cmd>Telescope oldfiles<cr>",    desc = 'Find recently opened files' },
      { '<leader>fb', "<cmd>Telescope buffers<cr>",     desc = 'Find existing buffers' },
      { '<leader>fg', "<cmd>Telescope git_files<cr>",   desc = 'Search Git Files' },
      { '<leader>ff', "<cmd>Telescope find_files<cr>",  desc = 'Search Files' },
      { '<leader>fh', "<cmd>Telescope help_tags<cr>",   desc = 'Search Help' },
      { '<leader>fw', "<cmd>Telescope live_grep<cr>",   desc = 'Search by Grep' },
      { '<leader>fd', "<cmd>Telescope diagnostics<cr>", desc = 'Search Diagnostics' },
      { '<leader>fr', "<cmd>Telescope resume<cr>",      desc = 'Search Resume' },
      { '<leader>fp', "<cmd>Telescope projects<cr>",    desc = 'Recent projects' },
      { "<leader>fu", "<cmd>Telescope undo<cr>",        desc = "Undo history", },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension('fzf')
      require("telescope").load_extension("undo")
      require("telescope").load_extension("projects")
    end
  },
}
