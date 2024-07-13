-- [[ Kickstart Keymaps ]]

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto Previous Diagnostic Message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto Next Diagnostic Message" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show Diagnostic Error Messages" })
vim.keymap.set("n", "<leader>ud", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle Diagnostic Messages" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Custom Keymaps ]]

-- Toggle comment with <leader>/
-- (code from Comment.nvim help doc)
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle Commend" })
vim.keymap.set("x", "<leader>/", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle Commend" })

-- Toggle line wrap
vim.keymap.set("n", "<leader>uw", function()
  vim.cmd [[set wrap!]]
end, { desc = "Toggle Line Wrap" })
