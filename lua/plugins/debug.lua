return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",

    -- displays variable values
    { "theHamsta/nvim-dap-virtual-text", opts = { virt_text_pos = "eol" } },

    -- provides default configurations
    "jay-babu/mason-nvim-dap.nvim",
    "mason-org/mason.nvim",

    -- task runner
    { "stevearc/overseer.nvim", opts = {} },
  },
  keys = {
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "Debug: Start/Continue",
    },
    {
      "<F1>",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step Into",
    },
    {
      "<F2>",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step Over",
    },
    {
      "<F3>",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step Out",
    },
    {
      "<leader>b",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug: Toggle Breakpoint",
    },
    {
      "<leader>B",
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      desc = "Debug: Set Breakpoint",
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      "<F7>",
      function()
        require("dapui").toggle()
      end,
      desc = "Debug: See last session result.",
    },
    {
      "<leader>Ds",
      function()
        require("dapui").float_element "scopes"
      end,
      desc = "Debug: Open scopes window",
    },
    {
      "<leader>Dv",
      function()
        require("dapui").float_element "scopes"
      end,
      desc = "Debug: Open variable scopes window",
    },
    {
      "<leader>Ds",
      function()
        require("dapui").float_element "stacks"
      end,
      desc = "Debug: Open threads and stack window",
    },
    {
      "<leader>Dw",
      function()
        require("dapui").float_element "watch"
      end,
      desc = "Debug: Open watch window",
    },
    {
      "<leader>Db",
      function()
        require("dapui").float_element "breakpoints"
      end,
      desc = "Debug: Open breakpoints window",
    },
    {
      "<leader>Dr",
      function()
        require("dapui").float_element "repl"
      end,
      desc = "Debug: Open repl window",
    },
    {
      "<leader>De",
      function()
        require("dapui").eval(vim.input "Expression> ")
      end,
      desc = "Debug: Evaluate expression",
    },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    require("mason-nvim-dap").setup {
      automatic_installation = false,
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
        codelldb = function(config)
          table.insert(config.configurations, {
            type = "codelldb",
            request = "launch",
            name = "LLDB: CP Debug",
            preLaunchTask = "CP Compile",
            postDebugTask = "CP Clean",
            program = "${relativeFileDirname}/${fileBasenameNoExtension}",
            stopOnEntry = false,
            args = {},
            console = "integratedTerminal",
          })
          require("mason-nvim-dap").default_setup(config)
        end,
      },
      ensure_installed = {},
    }

    ---@diagnostic disable:missing-fields
    dapui.setup {
      controls = { element = "scopes" },
      floating = { border = "rounded" },
      layouts = {
        {
          elements = {
            {
              id = "console",
              size = 0.5,
            },
            {
              id = "scopes",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 10,
        },
      },
    }
    ---@diagnostic enable:missing-fields

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    local overseer = require "overseer"
    overseer.register_template {
      name = "CP Compile",
      builder = function()
        return {
          cmd = { "clang++" },
          args = {
            "-glldb",
            "-fstandalone-debug",
            vim.fn.expand "%:p",
            "-o",
            vim.fn.expand "%:p:h" .. "/" .. vim.fn.expand "%:t:r",
          },
        }
      end,
      condition = { filetype = { "cpp" } },
    }
    overseer.register_template {
      name = "CP Clean",
      builder = function()
        return {
          cmd = { "rm" },
          args = { vim.fn.expand "%:p:h" .. "/" .. vim.fn.expand "%:t:r" },
        }
      end,
      condition = { filetype = { "cpp" } },
    }
  end,
}
