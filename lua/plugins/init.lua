return {
  -- NOTE: First, some plugins that don't require any configuration

  {
    "tpope/vim-fugitive",
    event = "BufEnter",
    cmd = "Git",
  },

  {
    "NMAC427/guess-indent.nvim",
    event = "BufEnter",
  },

  {
    "ahmedkhalf/project.nvim",
    event = "BufEnter",
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
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    keys = {
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview git hunk" },
      { "<leader>ga", "<cmd>Gitsigns add<cr>", desc = "Add git hunk" },
    },
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ "n", "v" }, "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
        vim.keymap.set({ "n", "v" }, "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
      end,
    },
  },

  {
    "chrisgrieser/nvim-tinygit",
    ft = { "gitrebase", "gitcommit" },
    keys = function()
      local tinygit = require("tinygit")
      return {
        { "<leader>gc", tinygit.smartCommit, desc = "Smart Commit" },
        { "<leader>gp", tinygit.push, desc = "Push" },
        { "<leader>gA", tinygit.amendOnlyMsg, desc = "Amend last message" },
        { "<leader>gs", tinygit.stashPush, desc = "Stash push" },
        { "<leader>gS", tinygit.stashPop, desc = "Stash pop" },
        { "<leader>gh", tinygit.searchFileHistory, desc = "File History" },
      }
    end,
    dependencies = {
      "stevearc/dressing.nvim",
      "rcarriga/nvim-notify", -- optional, but recommended
    },
  },

  {
    "stevearc/dressing.nvim",
    event = "BufEnter",
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
    event = "BufEnter",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = "ibl",
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
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
    event = "VeryLazy",
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
    event = "BufEnter",
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
    event = "BufEnter",
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
    event = "BufEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo comments" },
    },
    opts = {},
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  require("kickstart.plugins.autoformat"),
  -- require 'kickstart.plugins.debug',
}
