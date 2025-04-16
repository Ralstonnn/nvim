return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      ------------------------------------------------------------------------------------
      --- Attach dap UI to when debugger starts
      ------------------------------------------------------------------------------------
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      ------------------------------------------------------------------------------------

      -- DAP keymaps
      vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebugger [T]oggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebugger [C]ontinue" })
      vim.keymap.set("n", "<leader>dn", vim.cmd.DapNew, { desc = "[D]ebugger [N]ew" })
      vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "[D]ebugger [N]terminate" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[D]ebugger Step [O]ver" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebugger Step [I]nto" })
      vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "[D]ebugger Step O[U]t" })
      -- DAP_UI keymaps
      vim.keymap.set("n", "<leader>duo", dapui.open, { desc = "[D]ap UI [O]pen" })
      vim.keymap.set("n", "<leader>dut", dapui.toggle, { desc = "[D]ap UI [T]oggle" })
      vim.keymap.set("n", "<leader>duc", dapui.close, { desc = "[D]ap UI [C]lose" })

      dapui.setup(require("config.dap-ui"))
    end,
  },
}
