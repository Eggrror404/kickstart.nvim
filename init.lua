require "options"
require "keymaps"
require "autocmd"

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require "lazyfile"

-- [[ Configure and install plugins ]]
require("lazy").setup({
  { import = "plugins" },
}, {
  defaults = {
    lazy = true,
  },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
    border = "rounded",
  },
  lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json",
  install = { colorscheme = { "catppuccin" } },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        -- 'netrwPlugin',
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
