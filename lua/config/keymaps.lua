-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local map = vim.keymap.set
local unmap = vim.keymap.del

-- buffers
unmap("n", "<leader>`")

-- Gitui
map("n", "<leader>gg", function()
  Util.terminal(
    { "gitui" },
    { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false }
  )
end, { desc = "Gitui (root dir)" })

-- lazy
unmap("n", "<leader>l")
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

unmap("n", "<leader>xl")
unmap("n", "<leader>xq")

-- formatting
unmap({ "n", "v" }, "<leader>cf")
map({ "n", "v" }, "<leader>lf", function()
  Util.format({ force = true })
end, { desc = "Format" })

-- diagnostic
unmap("n", "<leader>cd")
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- windows
unmap("n", "<leader>ww")
unmap("n", "<leader>wd")
unmap("n", "<leader>w-")
unmap("n", "<leader>w|")
