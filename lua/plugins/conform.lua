return { -- Autoformat
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format { async = true, lsp_format = "fallback" }
      end,
      mode = "",
      desc = "Format buffer",
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
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end
    end,
    formatters_by_ft = {
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },

      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },

      c = { "clang-format" },
      cpp = { "clang-format" },

      python = { "ruff_format" },

      ["javascript"] = { "prettierd" },
      ["javascriptreact"] = { "prettierd" },
      ["typescript"] = { "prettierd" },
      ["typescriptreact"] = { "prettierd" },
      ["vue"] = { "prettierd" },
      ["css"] = { "prettierd" },
      ["scss"] = { "prettierd" },
      ["less"] = { "prettierd" },
      ["html"] = { "prettierd" },
      ["json"] = { "prettierd" },
      ["jsonc"] = { "prettierd" },
      ["yaml"] = { "prettierd" },
      ["markdown"] = { "prettierd" },
      ["markdown.mdx"] = { "prettierd" },
      ["graphql"] = { "prettierd" },
      ["handlebars"] = { "prettierd" },
      ["svelte"] = { "prettierd" },
      ["astro"] = { "prettierd" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    local notify_record = nil
    local notify_disable_state = function()
      notify_record = vim.notify(
        string.format(
          "Global format-on-save: `%s`\nBuffer format-on-save: `%s`",
          vim.g.disable_autoformat and " Disabled" or " Enabled",
          vim.b.disable_autoformat and " Disabled" or " Enabled"
        ),
        vim.log.levels.INFO,
        {
          title = "AutoFormat Toggle",
          replace = notify_record,
          on_open = function(win)
            vim.wo[win].conceallevel = 3
            vim.wo[win].concealcursor = "n"
            vim.wo[win].spell = false
            vim.treesitter.start(vim.api.nvim_win_get_buf(win), "markdown")
          end,
          on_close = function()
            notify_record = nil
          end,
        }
      )
    end

    -- Register format-on-save toggle commands
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      -- FormatDisable! will disable formatting just for this buffer
      if args.bang then
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
      notify_disable_state()
    end, { desc = "Disable format-on-save", bang = true })
    vim.api.nvim_create_user_command("FormatEnable", function(args)
      if args.bang then
        vim.b.disable_autoformat = false
      else
        vim.g.disable_autoformat = false
      end
      notify_disable_state()
    end, { desc = "Re-enable format-on-save", bang = true })
    vim.api.nvim_create_user_command("FormatToggle", function(args)
      if args.bang then
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      else
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      end
      notify_disable_state()
    end, { desc = "Toggle format-on-save", bang = true })
  end,
}
