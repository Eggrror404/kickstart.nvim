return {
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
        format = {
          cmdline = { conceal = false },
          search_down = { conceal = false },
          search_up = { conceal = false },
          filter = { conceal = false },
          lua = { conceal = false },
          help = { conceal = false },
        },
      },
      presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>e",
        function()
          require("oil").toggle_float()
        end,
        desc = "Oil file explorer (root dir)",
      },
    },
    opts = {
      keymaps = {
        ["q"] = "actions.close",
      },
      float = {
        max_height = 50,
      },
    },
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("oil")
          vim.cmd.lcd(require("oil").get_current_dir())
        end
      end
    end,
  },
  {
    "h-hg/fcitx.nvim",
    event = "InsertEnter",
  },
  {
    "Eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
}
