return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    --- @type snacks.Config
    opts = {
      bufdelete = { enabled = true },
      indent = {
        enabled = true,
        animate = { enabled = false },
      },
      input = {
        enabeld = true,
        icon_pos = false,
      },
      lazygit = { enabled = true, configure = false, win = { border = "rounded" } },
      quickfile = { enabled = true },
      rename = { enabled = true },
      terminial = { enabled = true },

      styles = {
        input = {
          title_pos = "left",
          width = 30,
          relative = "cursor",
          row = -3,
          col = 0,
        },
      },
    },
    keys = {
      {
        "<leader>c",
        function()
          Snacks.bufdelete()
        end,
        desc = "Delete Buffer",
      },
      {
        "<C-/>",
        function()
          Snacks.terminal.toggle()
        end,
        desc = "Open a terminal",
        mode = { "n", "t" },
      },
      {
        "<leader>g",
        function()
          Snacks.lazygit()
        end,
        desc = "Open lazygit",
      },
    },
    init = function()
      -- `rename` integration into Oil.nvim
      vim.api.nvim_create_autocmd("User", {
        pattern = "OilActionsPost",
        callback = function(event)
          if event.data.actions.type == "move" then
            Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
          end
        end,
      })
    end,
  },
}
