-- LazyFile event for file open
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/plugin.lua#L72
local Event = require("lazy.core.handler.event")
Event.mappings.LazyFile =
  { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
Event.mappings["User LazyFile"] = Event.mappings.LazyFile

-- Setup Lazy.nvim
require("lazy").setup("plugins", {
  defaults = {
    lazy = true,
  },
  install = { colorscheme = { "catppuccin" } },
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
})
