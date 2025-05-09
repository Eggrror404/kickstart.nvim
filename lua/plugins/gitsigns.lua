-- Kickstart's default config merged with additional config
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  event = "LazyFile",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      local gitsigns = require "gitsigns"

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal { "]c", bang = true }
        else
          gitsigns.nav_hunk "next"
        end
      end, { desc = "Jump to next git change" })

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal { "[c", bang = true }
        else
          gitsigns.nav_hunk "prev"
        end
      end, { desc = "Jump to previous git change" })

      -- Actions
      -- visual mode
      map("v", "<leader>hs", function()
        gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end, { desc = "Stage Git Hunk" })
      map("v", "<leader>hr", function()
        gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end, { desc = "Reset Git Hunk" })
      -- normal mode
      map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Git Stage Hunk" })
      map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Git Reset Hunk" })
      map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Git Stage Buffer" })
      map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Git Reset Buffer" })
      map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Git Preview Hunk" })
      map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Git Preview Hunk Inline" })
      map("n", "<leader>hb", gitsigns.blame_line, { desc = "Git Blame Line" })
      map("n", "<leader>hd", gitsigns.diffthis, { desc = "Git Diff against Index" })
      map("n", "<leader>hD", function()
        gitsigns.diffthis "@"
      end, { desc = "Git Diff Against Last Commit" })

      -- Toggles
      map("n", "<leader>ub", gitsigns.toggle_current_line_blame, { desc = "Toggle Git Show Blame Line" })
    end,
  },
}
