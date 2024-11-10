local function getCDebuggerConfig()
	local config

	config = {
		{
			name = "Launch file",
			type = "cppdbg",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopAtEntry = true,
		},
		{
			name = "Attach to gdbserver :1234",
			type = "cppdbg",
			request = "launch",
			MIMode = "gdb",
			miDebuggerServerAddress = "localhost:1234",
			miDebuggerPath = "/usr/bin/gdb",
			cwd = "${workspaceFolder}",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
		},
	}
	return config
end

return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		local masonRegistry = require("mason-registry")
		dapui.setup()

		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = masonRegistry.get_package("cpptools"):get_install_path()
				.. "/extension/debugAdapters/bin/OpenDebugAD7",
		}

		dap.configurations.cpp = getCDebuggerConfig()
		dap.configurations.c = dap.configurations.cpp

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

		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "DAP: Continue" })
		vim.keymap.set("n", "<Leader>dso", dap.step_over, { desc = "DAP: Step Over" })
		vim.keymap.set("n", "<Leader>dsi", dap.step_into, { desc = "DAP: Step Into" })
		vim.keymap.set("n", "<Leader>dsu", dap.step_out, { desc = "DAP: Step Out" })
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })

		vim.keymap.set("n", "<Leader>duc", dapui.close, { desc = "DAPUI: close" })
		vim.keymap.set("n", "<Leader>duo", dapui.open, { desc = "DAPUI: open" })
	end,
}
