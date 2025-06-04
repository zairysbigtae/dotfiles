return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.4 },
              { id = "breakpoints", size = 0.3 },
              { id = "stacks", size = 0.3 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = { { id = "repl", size = 1.0 } },
            size = 10,
            position = "bottom",
          },
        },
      })

      dap.adapters.gdb = {
        type = "executable",
        command = "/usr/bin/gdb",
        name = "gdb",
      }

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "/usr/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.rust = {
        {
          name = "Launch Rust Program",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
          runInTerminal = true,
          args = {},
        },
      }

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
