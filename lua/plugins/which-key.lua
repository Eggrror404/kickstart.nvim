return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show { global = false }
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  opts = {
    icons = { mappings = false },
  },
  config = function(_, opts)
    require("which-key").setup(opts)

    -- Document existing key chains
    require("which-key").add {
      { "<leader>h", group = "Git Hunk", mode = { "n", "v" } },
      { "<leader>l", group = "LSP / Code" },
      { "<leader>s", group = "Search" },
      { "<leader>u", group = "Toggle" },
    }
  end,
}
