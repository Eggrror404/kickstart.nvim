-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  { 'tpope/vim-sleuth', event = 'LazyFile' }, -- Detect tabstop and shiftwidth automatically

  { 'HiPhish/rainbow-delimiters.nvim', event = 'LazyFile' },

  { 'h-hg/fcitx.nvim', event = 'InsertEnter' },

  { 'Eandrju/cellular-automaton.nvim', cmd = 'CellularAutomaton' },

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', event = 'LazyFile' },

  { 'windwp/nvim-ts-autotag', event = 'LazyFile' },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

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
    opts = {
      background_colour = '#000000',
    },
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

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
}
