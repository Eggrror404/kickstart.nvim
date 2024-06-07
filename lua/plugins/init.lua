-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'tpope/vim-sleuth', event = 'LazyFile' }, -- Detect tabstop and shiftwidth automatically

  { 'HiPhish/rainbow-delimiters.nvim', event = 'LazyFile' },

  { 'h-hg/fcitx.nvim', event = 'InsertEnter' },

  { 'Eandrju/cellular-automaton.nvim', cmd = 'CellularAutomaton' },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', event = 'LazyFile' },

  { 'windwp/nvim-ts-autotag', event = 'LazyFile' },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'LazyFile',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    config = function(_, opts)
      require('notify').setup(opts)
      vim.notify = require 'notify'
    end,
  },

  {
    'ActivityWatch/aw-watcher-vim',
    event = 'VeryLazy',
    config = function()
      vim.cmd 'AWStart'
    end,
  },

  {
    'ahmedkhalf/project.nvim',
    event = 'LazyFile',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function(_, opts)
      require('project_nvim').setup(opts)
      require('telescope').load_extension 'projects'
    end,
  },

  {
    'NvChad/nvim-colorizer.lua',
    event = 'LazyFile',
    opts = {
      filetypes = {
        '*',
        css = { names = true, css_fn = true },
      },
      user_default_options = {
        RGB = false, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
      },
    },
  },

  {
    'mrjones2014/smart-splits.nvim',
    keys = function()
      local splits = require 'smart-splits'
      return {
        { '<C-h>', splits.move_cursor_left, desc = 'Go to left window' },
        { '<C-j>', splits.move_cursor_down, desc = 'Go to lower window' },
        { '<C-k>', splits.move_cursor_up, desc = 'Go to upper window' },
        { '<C-l>', splits.move_cursor_right, desc = 'Go to right window' },
        { '<C-Left>', splits.resize_left, desc = 'Resize window leftwards' },
        { '<C-Down>', splits.resize_down, desc = 'Resize window downwards' },
        { '<C-Up>', splits.resize_up, desc = 'Resize window upwards' },
        {
          '<C-Right>',
          splits.resize_right,
          desc = 'Resize window rightwards',
        },
      }
    end,
    opts = {},
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'LazyFile',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
    },
    main = 'ibl',
  },

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
}
