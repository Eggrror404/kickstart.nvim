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
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.o.timeoutlen
    delay = 0,
    icons = { mappings = false },
    spec = {
      { "<leader>h", group = "Git Hunk", mode = { "n", "v" } },
      { "<leader>l", group = "LSP / Code", mode = { "n", "x" } },
      { "<leader>s", group = "Search" },
      { "<leader>u", group = "Toggle" },
    },
  },
}
