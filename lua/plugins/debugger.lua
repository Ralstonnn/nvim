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

			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebugger [T]oggle Breakpoint" })
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebugger [C]ontinue" })
			vim.keymap.set("n", "<leader>dn", vim.cmd.DapNew, { desc = "[D]ebugger [N]ew" })
			vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[D]ebugger Step [O]ver" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebugger Step [I]nto" })

			dapui.setup()
		end,
	},
}
