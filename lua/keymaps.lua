local set = vim.keymap.set

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Clearing search highlight
set('n', '<Esc>', '<cmd>nohl<cr>', { silent = true })

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
set('n', '<leader>dm', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Window navigation
set('n', "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
set('n', "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to below split" })
set('n', "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to above split" })
set('n', "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right split" })
set('n', "<C-Up>", require("smart-splits").resize_up, { desc = "Resize split up" })
set('n', "<C-Down>", require("smart-splits").resize_down, { desc = "Resize split down" })
set('n', "<C-Left>", require("smart-splits").resize_left, { desc = "Resize split left" })
set('n', "<C-Right>", require("smart-splits").resize_right, { desc = "Resize split right" })

-- Oil.nvim file explorer
set('n', '<leader>e', require('oil').toggle_float, { desc = 'Oil file explorer' })

-- Comment.nvim
set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Toggle comment line" })
set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = "Toggle comment for selection" })

-- Terminal
set('n', '<leader>tf', '<cmd>ToggleTerm<cr>', { desc = 'Floating terminal session' })
set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', { desc = 'Vertical terminal session' })
set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Horizontal terminal session' })

set('t', "<C-h>", "<cmd>wincmd h<cr>", { desc = "Move to left split" })
set('t', "<C-j>", "<cmd>wincmd j<cr>", { desc = "Move to below split" })
set('t', "<C-k>", "<cmd>wincmd k<cr>", { desc = "Move to above split" })
set('t', "<C-l>", "<cmd>wincmd l<cr>", { desc = "Move to right split" })
set('t', "<C-w>", [[<C-\><C-n><C-w>]], { desc = "Wincmd" })
set('t', "<C-n>", [[<C-\><C-n>]], { desc = "Normal mode" })

-- Telescope
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles,
  { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers,
  { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = 'Search Git Files' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics,
  { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = 'Search Resume' })
vim.keymap.set('n', '<leader>fp', require('telescope').extensions.projects.projects, { desc = 'Recent projects' })
