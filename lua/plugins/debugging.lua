return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			vim.keymap.set("n", "<leader>dbc", function()
				dap.continue()
			end)
			vim.keymap.set("n", "<leader>dbso", function()
				dap.step_over()
			end)
			vim.keymap.set("n", "<leader>dbsi", function()
				dap.step_into()
			end)
			vim.keymap.set("n", "<leader>dbst", function()
				dap.step_out()
			end)
			vim.keymap.set("n", "<leader>dbb", function()
				dap.toggle_breakpoint()
			end)

			vim.keymap.set("n", "<leader>dbu", function()
				dapui.toggle()
			end)

			dapui.setup()
		end,
	},
}
