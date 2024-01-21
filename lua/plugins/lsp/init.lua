return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "plugins.lsp.prettierd" },
  { import = "plugins.lsp.python" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "diff",
        "html",
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {},
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      for _, k in ipairs(keys) do
        -- replace all <leader>c keymaps into <leader>l
        k[1] = k[1]:gsub("<leader>c", "<leader>l")
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>cm", false },
      { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = function(opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {})
    end,
  },
}
