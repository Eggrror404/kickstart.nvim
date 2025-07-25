-- extra config for language support
return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    branch = "regexp",
    cmd = "VenvSelect",
    ft = "python",
    opts = {
      parents = 5,
      name = { "venv", ".venv" },
    },
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>lv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" },
    },
  },

  -- add svelte & astro typescript plugin here
  -- it requires Svelte LSP & Astro LSP to be installed first,
  -- so we set this in a function so it's called after Mason loaded
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if not opts.vtsls then
        return
      end
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
      vim.tbl_extend("keep", opts.vtsls.settings.vtsls, {
        tsserver = {
          globalPlugins = {
            {
              name = "@astrojs/ts-plugin",
              location = require("utils").get_pkg_path("astro-language-server", "/node_modules/@astrojs/ts-plugin"),
              enableForWorkspaceTypeScriptVersions = true,
            },
          },
        },
      })
    end,
  },
}
