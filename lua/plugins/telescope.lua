-- Telescope is a fuzzy finder that comes with a lot of different things that
-- it can fuzzy find! It's more than just a "file finder", it can search
-- many different aspects of Neovim, your workspace, LSP, and more!
--
-- The easiest way to use Telescope, is to start by doing something like:
--  :Telescope help_tags
--
-- After running this command, a window will open up and you're able to
-- type in the prompt window. You'll see a list of `help_tags` options and
-- a corresponding preview of the help.
--
-- Two important keymaps to use while in Telescope are:
--  - Insert mode: <c-/>
--  - Normal mode: ?
--
-- This opens a window that shows you all of the keymaps for the current
-- Telescope picker. This is really useful to discover what Telescope can
-- do as well as how to actually do it!

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "debugloop/telescope-undo.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  keys = {
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search Help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search Keymaps" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Search Files" },
    { "<leader>ss", "<cmd>Telescope builtin<cr>", desc = "Search Select Telescope" },
    { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Search Current Word" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search by Grep" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Search Diagnostics" },
    { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Search Resume" },
    { "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Search Recent Files" },
    { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Search Buffers" },
    { "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "Search Man Pages" },
    { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Search Undo Tree" },

    {
      "<leader>s/",
      function()
        require("telescope.builtin").live_grep {
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        }
      end,
      desc = "Search in Open Files",
    },
  },
  config = function(_)
    local opts = {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    }
    require("telescope").setup(opts)

    local telescope = require "telescope"

    telescope.load_extension "fzf"
    telescope.load_extension "ui-select"
    telescope.load_extension "undo"
  end,
}
