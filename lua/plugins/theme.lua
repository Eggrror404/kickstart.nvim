return {
  "rose-pine/neovim",
  name = "rose-pine",

  init = function()
    require("rose-pine").setup {
      styles = {
        transparency = true,
      },
    }

    vim.cmd.colorscheme "rose-pine"
  end,
}
