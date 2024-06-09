return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil",
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
        max_height = 50,
      },
      win_options = {
        signcolumn = "yes:2",
      },
    },
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require "oil"
          vim.cmd.lcd(require("oil").get_current_dir())
        end
      end
    end,
    config = function(_, opts)
      require("oil").setup(opts)

      -- loads the git-status plugin. it needs oil to be loaded so we cannot list it as a dependency
      require "oil-git-status"
    end,
  },
  {
    "refractalize/oil-git-status.nvim",
    dependencies = {
      "stevearc/oil.nvim",
    },
    opts = {},
  },
}
