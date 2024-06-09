return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    {
      "<leader>tt",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Trouble Diagnostics",
    },
    {
      "<leader>tT",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Trouble Buffer Diagnostics",
    },
    {
      "<leader>tL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Trouble Location List",
    },
    {
      "<leader>tQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Trouble Quickfix List",
    },
    {
      "]t",
      function()
        require("trouble").next { skip_groups = true, jump = true }
      end,
      desc = "Next Trouble Item",
    },
    {
      "[t",
      function()
        require("trouble").prev { skip_groups = true, jump = true }
      end,
      desc = "Previous Trouble Item",
    },
  },
  opts = {
    use_diagnostic_signs = true,
  },
}
