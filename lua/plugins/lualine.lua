local Util = require("lazyvim.util")
local icons = require("lazyvim.config").icons

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        { -- from lazyvim
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
        },
      },
      lualine_c = {
        Util.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        {
          "filetype",
          icon_only = true,
          separator = "",
          padding = { left = 1, right = 0 },
        },
        { Util.lualine.pretty_path(), separator = "" },
        {
          function()
            if vim.bo.modified then
              return "[+]"
            elseif not vim.bo.modifiable or vim.bo.readonly then
              return "[-]"
            end
            return ""
          end,
        },
      },
      lualine_x = {
        {
          function()
            return require("noice").api.status.command.get()
          end,
          cond = function()
            return package.loaded["noice"]
              and require("noice").api.status.command.has()
          end,
          color = Util.ui.fg("Statement"),
        },
        {
          function()
            return require("noice").api.status.mode.get()
          end,
          cond = function()
            return package.loaded["noice"]
              and require("noice").api.status.mode.has()
          end,
          color = Util.ui.fg("Constant"),
        },
        {
          function()
            return require("dap").status()
          end,
          cond = function()
            return package.loaded["dap"] and require("dap").status() ~= ""
          end,
          icon = "  ",
          color = Util.ui.fg("Debug"),
        },
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = Util.ui.fg("Special"),
        },
      },
      lualine_y = {
        {
          function()
            local ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients({
              bufnr = vim.api.nvim_get_current_buf(),
            })

            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, ft) ~= -1 then
                return client.name
              end
            end

            return "No Active"
          end,
          icon = " ",
        },
      },
      lualine_z = {
        { "location", separator = " " },
        { "progress", padding = { left = 0, right = 1 } },
      },
    }

    return opts
  end,
}
