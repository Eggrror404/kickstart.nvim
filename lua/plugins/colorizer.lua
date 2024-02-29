return {
  "NvChad/nvim-colorizer.lua",
  event = "LazyFile",
  opts = {
    filetypes = {
      "*",
      css = { names = true, css_fn = true },
    },
    user_default_options = {
      RGB = false, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = false, -- "Name" codes like Blue or blue
      RRGGBBAA = true, -- #RRGGBBAA hex codes
    },
  },
}
