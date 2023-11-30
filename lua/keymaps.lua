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
set('n', "<C-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Move to left split" })
set('n', "<C-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Move to below split" })
set('n', "<C-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Move to above split" })
set('n', "<C-l>", function() require("smart-splits").move_coursor_right() end, { desc = "Move to right split" })
set('n', "<C-Up>", function() require("smart-splits").resize_up() end, { desc = "Resize split up" })
set('n', "<C-Down>", function() require("smart-splits").resize_down() end, { desc = "Resize split down" })
set('n', "<C-Left>", function() require("smart-splits").resize_left() end, { desc = "Resize split left" })
set('n', "<C-Right>", function() require("smart-splits").resize_right() end, { desc = "Resize split right" })

-- Oil.nvim file explorer
set('n', '<leader>e', function() require('oil').toggle_float() end, { desc = 'Oil file explorer' })

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
vim.keymap.set('n', '<leader>fo', function() require('telescope.builtin').oldfiles() end,
  { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end,
  { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').git_files() end, { desc = 'Search Git Files' })
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>fw', function() require('telescope.builtin').grep_string() end,
  { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>fW', function() require('telescope.builtin').live_grep() end, { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>fG', ':LiveGrepGitRoot<cr>', { desc = 'Search by Grep on Git Root' })
vim.keymap.set('n', '<leader>fd', function() require('telescope.builtin').diagnostics() end,
  { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>fr', function() require('telescope.builtin').resume() end, { desc = 'Search Resume' })
