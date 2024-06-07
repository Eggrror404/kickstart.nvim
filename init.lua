require 'options'
require 'keymaps'
require 'autocmd'

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Add support for `LazyFile` event ]]
-- taken from [LazyVim](https://github.com/LazyVim/LazyVim/blob/91126b9896bebcea9a21bce43be4e613e7607164/lua/lazyvim/util/plugin.lua#L60-L125)
local Event = require 'lazy.core.handler.event'

-- We'll handle delayed execution of events ourselves
Event.mappings.LazyFile = { id = 'LazyFile', event = 'User', pattern = 'LazyFile' }
Event.mappings['User LazyFile'] = Event.mappings.LazyFile

local events = {} ---@type {event: string, buf: number, data?: any}[]

local done = false
local function load()
  if #events == 0 or done then
    return
  end
  done = true
  vim.api.nvim_del_augroup_by_name 'lazy_file'

  ---@type table<string,string[]>
  local skips = {}
  for _, event in ipairs(events) do
    skips[event.event] = skips[event.event] or Event.get_augroups(event.event)
  end

  vim.api.nvim_exec_autocmds('User', { pattern = 'LazyFile', modeline = false })
  for _, event in ipairs(events) do
    if vim.api.nvim_buf_is_valid(event.buf) then
      Event.trigger {
        event = event.event,
        exclude = skips[event.event],
        data = event.data,
        buf = event.buf,
      }
      if vim.bo[event.buf].filetype then
        Event.trigger {
          event = 'FileType',
          buf = event.buf,
        }
      end
    end
  end
  vim.api.nvim_exec_autocmds('CursorMoved', { modeline = false })
  events = {}
end

-- schedule wrap so that nested autocmds are executed
-- and the UI can continue rendering without blocking
load = vim.schedule_wrap(load)

vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile', 'BufWritePre' }, {
  group = vim.api.nvim_create_augroup('lazy_file', { clear = true }),
  callback = function(event)
    table.insert(events, event)
    load()
  end,
})

-- [[ Configure and install plugins ]]
require('lazy').setup('plugins', {
  defaults = {
    lazy = true,
  },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
    border = 'rounded',
  },
  lockfile = vim.fn.stdpath 'data' .. '/lazy-lock.json',
  install = { colorscheme = { 'catppuccin' } },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        -- 'matchit',
        -- 'matchparen',
        -- 'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
