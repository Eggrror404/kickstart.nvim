local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>,", false },
    { "<leader>/", false },
    { "<leader><space>", false },
    { "<leader>fc", false },
    {
      "<leader>fN",
      "<cmd>Telescope notify<cr>",
      desc = "Notification History",
    },

    -- default search
    { '<leader>f"', "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>fa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    {
      "<leader>fB",
      "<cmd>Telescope current_buffer_fuzzy_find<cr>",
      desc = "Buffer",
    },
    {
      "<leader>fd",
      "<cmd>Telescope diagnostics bufnr=0<cr>",
      desc = "Document diagnostics",
    },
    {
      "<leader>fD",
      "<cmd>Telescope diagnostics<cr>",
      desc = "Workspace diagnostics",
    },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    { "<leader>fR", "<cmd>Telescope resume<cr>", desc = "Resume" },
    { "<leader>fw", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    {
      "<leader>fW",
      Util.telescope("grep_string", { word_match = "-w" }),
      desc = "Word (root dir)",
    },
    {
      "<leader>fw",
      Util.telescope("grep_string"),
      mode = "v",
      desc = "Selection (root dir)",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = require("lazyvim.config").get_kind_filter(),
        })
      end,
      desc = "Goto Symbol",
    },
    {
      "<leader>fS",
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols({
          symbols = require("lazyvim.config").get_kind_filter(),
        })
      end,
      desc = "Goto Symbol (Workspace)",
    },
    { '<leader>s"', false },
    { "<leader>sa", false },
    { "<leader>sb", false },
    { "<leader>sc", false },
    { "<leader>sC", false },
    { "<leader>sd", false },
    { "<leader>sD", false },
    { "<leader>sg", false },
    { "<leader>sG", false },
    { "<leader>sh", false },
    { "<leader>sH", false },
    { "<leader>sk", false },
    { "<leader>sM", false },
    { "<leader>sm", false },
    { "<leader>so", false },
    { "<leader>sR", false },
    { "<leader>sw", false },
    { "<leader>sW", false },
    { "<leader>sw", false },
    { "<leader>sW", false },
    { "<leader>ss", false },
    { "<leader>sS", false },
  },
}
