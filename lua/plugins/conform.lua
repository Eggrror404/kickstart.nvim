return { -- Autoformat
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
    {
      "<leader>uf",
      "<cmd>FormatToggle<cr>",
      desc = "Toggle Format-on-Save",
    },
    {
      "<leader>uF",
      "<cmd>FormatToggle!<cr>",
      desc = "Toggle Format-on-Save for buffer",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    -- Register format-on-save toggle commands
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      -- FormatDisable! will disable formatting just for this buffer
      if args.bang then
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, { desc = "Disable format-on-save", bang = true })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, { desc = "Re-enable format-on-save" })
    vim.api.nvim_create_user_command("FormatToggle", function(args)
      if args.bang then
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      elseif vim.b.disable_autoformat or vim.g.disable_autoformat then
        vim.cmd [[FormatEnable]]
      else
        vim.cmd [[FormatDisable]]
      end
    end, { desc = "Toggle format-on-save", bang = true })
  end,
}
