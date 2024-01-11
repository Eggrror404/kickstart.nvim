---@type LazySpec
return {
  {
    "NMAC427/guess-indent.nvim",
    event = "LazyFile",
  },

  {
    "ahmedkhalf/project.nvim",
    event = "LazyFile",
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },

  -- Useful plugin to show you pending keybinds.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("which-key").setup(opts)

      -- document existing key chains
      require("which-key").register({
        ["<leader>f"] = { name = "Telescope Find" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>l"] = { name = "LSP" },
        ["<leader>t"] = { name = "Terminal" },
      })
    end,
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opt = {
      input = { insert_only = false },
    },
  },

  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      {
        "<leader>e",
        function()
          require("oil").toggle_float()
        end,
        desc = "Oil file explorer",
      },
    },
    opts = {
      keymaps = {
        ["q"] = "actions.close",
      },
      float = {
        max_with = 80,
        max_height = 50,
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    cmd = "Notifications",
    opts = {
      background_colour = "#000000",
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require("notify")
    end,
  },

  {
    -- Set lualine as statusline
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = "catppuccin",
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = "ibl",
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  {
    "numToStr/Comment.nvim",
    event = "LazyFile",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    keys = {
      {
        "<leader>tf",
        "<cmd>ToggleTerm<cr>",
        desc = "Floating terminal session",
      },
      {
        "<leader>tv",
        "<cmd>ToggleTerm direction=vertical<cr>",
        desc = "Vertical terminal session",
      },
      {
        "<leader>th",
        "<cmd>ToggleTerm direction=horizontal<cr>",
        desc = "Horizontal terminal session",
      },
    },
    opts = {
      open_mapping = [[<F7>]],
      direction = "float",
      float_opts = {
        border = "rounded",
      },
    },
  },

  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
    opts = {
      ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
      ignored_buftypes = { "nofile" },
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    opts = {
      check_ts = true,
      ts_config = { java = false },
      fast_wrap = {},
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "LazyFile",
    opts = {
      user_default_options = {
        names = false,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
      },
    },
  },

  {
    "h-hg/fcitx.nvim",
    event = "InsertEnter",
  },

  {
    "folke/todo-comments.nvim",
    event = "LazyFile",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo comments" },
    },
    opts = {},
  },

  {
    "echasnovski/mini.surround",
    ---@type fun(self: LazyPlugin, keys: string[]):LazyKeysSpec[]
    keys = function(plugin, keys)
      local opts = plugin.opts or {}
      local mappings = {
        {
          opts.mappings.add,
          desc = "Add surrounding",
          mode = { "n", "v" },
        },
        { opts.mappings.delete, desc = "Delete surrounding" },
        { opts.mappings.find, desc = "Find right surrounding" },
        { opts.mappings.find_left, desc = "Find left surrounding" },
        { opts.mappings.highlight, desc = "Highlight surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      -- return mappings
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      -- default mappings for mini.surround (set for setting `keys`)
      mappings = {
        add = "sa",
        delete = "sd",
        find = "sf",
        find_left = "sF",
        highlight = "sh",
        replace = "sr",
        update_n_lines = "sn",
      },
    },
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.debug',
}
