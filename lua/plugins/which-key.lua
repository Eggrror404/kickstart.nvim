return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup()

    -- Document existing key chains
    require("which-key").register {
      ["<leader>s"] = { name = "Search", _ = "which_key_ignore" },
      ["<leader>h"] = { name = "Git Hunk", _ = "which_key_ignore" },
      ["<leader>l"] = { name = "LSP / Code", _ = "which_key_ignore" },
      ["<leader>u"] = { name = "Toggle", _ = "which_key_ignore" },
    }
    -- visual mode
    require("which-key").register({
      ["<leader>h"] = { "Git Hunk" },
    }, { mode = "v" })
  end,
}
