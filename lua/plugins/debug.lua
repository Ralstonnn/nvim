local function getLldbPath()
	local mason_registry = require("mason-registry")
	local path = mason_registry.get_package("codelldb"):get_install_path() .. "/codelldb"
	return path
end
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = {
					"mfussenegger/nvim-dap",
					"nvim-neotest/nvim-nio",
				},
			},
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			vim.keymap.set("n", "<F5>", function()
				require("dap").continue()
			end, { desc = "Debug Continue" })
			vim.keymap.set("n", "<F10>", function()
				require("dap").step_over()
			end, { desc = "Debug Step Over" })
			vim.keymap.set("n", "<F11>", function()
				require("dap").step_into()
			end, { desc = "Debug Step Into" })
			vim.keymap.set("n", "<F12>", function()
				require("dap").step_out()
			end, { desc = "Debug Step Out" })
			vim.keymap.set("n", "<Leader>db", function()
				require("dap").toggle_breakpoint()
			end, { desc = "Debug Toggle Breakpoint" })
			-- vim.keymap.set("n", "<Leader>B", function()
			-- 	require("dap").set_breakpoint()
			-- end)
			vim.keymap.set("n", "<Leader>dlp", function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { desc = "Debug Log Point Message" })
			vim.keymap.set("n", "<Leader>dro", function()
				require("dap").repl.open()
			end, { desc = "Debug Open" })
			vim.keymap.set("n", "<Leader>drl", function()
				require("dap").run_last()
			end, { desc = "Debug Run Last" })
			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				require("dap.ui.widgets").hover()
			end, { desc = "Debug Hover" })
			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				require("dap.ui.widgets").preview()
			end, { desc = "Debug Preview" })
			vim.keymap.set("n", "<Leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end, { desc = "Debug Widgets Frames" })
			vim.keymap.set("n", "<Leader>ds", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end, { desc = "Debug Widgets Scopes" })

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = getLldbPath(),
					args = { "--port", "${port}" },

					-- On windows you may have to uncomment this:
					-- detached = false,
				},
			}

			dap.configurations.c = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

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

			dap.set_log_level("TRACE")
		end,
	},
}
