return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "mocha",
    transparent_background = true,
    default_integrations = false,
    integrations = {
      cmp = true,
      fidget = true,
      gitsigns = true,
      indent_blankline = true,
      lsp_trouble = true,
      markdown = true,
      mason = true,
      mini = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      notify = true,
      rainbow_delimiters = true,
      telescope = true,
      treesitter = true,
      which_key = true,
    },
  },
  init = function(_, opts)
    vim.cmd.colorscheme "catppuccin"
    require("catppuccin").setup(opts)
  end,
}
