return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      end
      vim.list_extend(opts.ensure_installed, { "astro", "svelte", "css" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      astro = {},
      svelte = {},
      tailwindcss = {},
      cssls = {},
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      prettierd = {},
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "js-everts/cmp-tailwind-colors", opts = {} },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        if item.kind == "Color" then
          item = require("cmp-tailwind-colors").format(entry, item)
          if item.kind ~= "Color" then
            item.menu = "Color"
            return item
          end
        end
        return format_kinds(entry, item)
      end
    end,
  },
}
