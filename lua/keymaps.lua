local set = vim.keymap.set

set("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy.nvim" })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- split
set("n", "|", "<cmd>vsplit<cr>", { desc = "Verticle split" })
set("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })

-- Remap for dealing with word wrap
set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Clearing search highlight
set("n", "<Esc>", "<cmd>nohl<cr>", { silent = true })

-- Diagnostic keymaps
set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Window navigation
set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to below split" })
set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to above split" })
set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right split" })
set("n", "<C-Up>", require("smart-splits").resize_up, { desc = "Resize split up" })
set("n", "<C-Down>", require("smart-splits").resize_down, { desc = "Resize split down" })
set("n", "<C-Left>", require("smart-splits").resize_left, { desc = "Resize split left" })
set("n", "<C-Right>", require("smart-splits").resize_right, { desc = "Resize split right" })

-- Comment.nvim
set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Toggle comment line" })
set(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = "Toggle comment for selection" }
)

-- Terminal
set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Move to left split" })
set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Move to below split" })
set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Move to above split" })
set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Move to right split" })
set("t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "Wincmd" })
set("t", "<C-n>", [[<C-\><C-n>]], { desc = "Normal mode" })

-- Custom terminal commands
local Terminal = require("toggleterm.terminal").Terminal
local terms = {
  {
    "<leader>tg",
    Terminal:new({ cmd = "gitui" }),
    { desc = "Gitui" },
  },
}
for _, v in ipairs(terms) do
  set("n", v[1], function()
    v[2]:toggle()
  end, v[3])
end
