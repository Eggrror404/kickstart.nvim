return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "javascript", "typescript", "css", "html", "svelte" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
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
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      vtsls = {
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        settings = {
          complete_function_calls = true,
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          -- typescript and javascript shares the config
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
          javascript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
        keys = {
          {
            "gD",
            function()
              local params = vim.lsp.util.make_position_params()
              require("utils").lsp.execute {
                command = "typescript.goToSourceDefinition",
                arguments = { params.textDocument.uri, params.position },
                open = true,
              }
            end,
            desc = "Goto Source Definition",
          },
          {
            "gR",
            function()
              require("utils").lsp.trouble_open {
                command = "typescript.findAllFileReferences",
                arguments = { vim.uri_from_bufnr(0) },
                open = true,
              }
            end,
            desc = "File References",
          },
          {
            "<leader>co",
            require("utils").lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
          {
            "<leader>cM",
            require("utils").lsp.action["source.addMissingImports.ts"],
            desc = "Add missing imports",
          },
          {
            "<leader>cu",
            require("utils").lsp.action["source.removeUnused.ts"],
            desc = "Remove unused imports",
          },
          {
            "<leader>cD",
            require("utils").lsp.action["source.fixAll.ts"],
            desc = "Fix all diagnostics",
          },
          {
            "<leader>cV",
            function()
              require("utils").lsp.execute { command = "typescript.selectTypeScriptVersion" }
            end,
            desc = "Select TS workspace version",
          },
        },
      },

      tailwindcss = {},

      svelte = {
        keys = {
          {
            "<leader>co",
            require("utils").lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
        },
        capabilities = {
          workspace = {
            didChangeWatchedFiles = vim.fn.has "nvim-0.10" == 0 and { dynamicRegistration = true },
          },
        },
      },

      prettierd = {},

      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" },
        },
      },
    },
  },
  -- add svelte typescript plugin here
  -- it requires Svelte LSP to be installed first,
  -- so we set this in a function so it's called after Mason loaded
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.vtsls.settings.vtsls, {
        tsserver = {
          globalPlugins = {
            {
              name = "typescript-svelte-plugin",
              location = require("utils").get_pkg_path(
                "svelte-language-server",
                "/node_modules/typescript-svelte-plugin"
              ),
              enableForWorkspaceTypeScriptVersions = true,
            },
          },
        },
      })
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    opts = {},
    config = function(_, opts)
      require("cmp").config.formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter,
      }
      require("tailwindcss-colorizer-cmp").setup(opts)
    end,
  },
}
