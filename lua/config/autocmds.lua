-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Remove `>` comments for Svelte files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*.svelte" },
  callback = function()
    vim.cmd("setlocal comments-=n:>")
  end,
  group = vim.api.nvim_create_augroup("svelte_comment", { clear = true }),
})
