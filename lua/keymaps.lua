-- [[ Kickstart Keymaps ]]

local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Custom Keymaps ]]

-- Toggle comment with <leader>/
-- (code from Comment.nvim help doc)
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle Commend" })
map("x", "<leader>/", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle Commend" })

-- Toggle line wrap
map("n", "<leader>uw", function()
  vim.cmd [[set wrap!]]
end, { desc = "Toggle Line Wrap" })

-- Show diagnostic popup
-- normally can be accessed with <C-w>d
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostic popup" })

-- Split
map("n", "<leader>-", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical split" })

-- Copy to & paste from system keyboard
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>p", '"+p')
