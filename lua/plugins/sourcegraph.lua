return {
	{
		"sourcegraph/sg.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local sg = require("sg")
			sg.setup()

			vim.keymap.set("n", "<leader>coo", ":CodyToggle<CR>", {})
			vim.keymap.set("v", "<leader>coo", function()
				-- Run ui prompt for input from user
				vim.ui.input({ prompt = "Question: " }, function(input)
					-- If user does not provide any input, default to "Explain this code"
					if input == "" or input == nil then
						input = "Explain this code"
					end
					-- Execute escape sequence to exit visual mode and save marks
					local key = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
					vim.api.nvim_feedkeys(key, "x", false)
					-- Feed input to CodyAsk command
					vim.cmd("'<,'>CodyAsk " .. input)
				end)
			end, {})

			vim.keymap.set("n", "<leader>coc", ":CodyChat<CR>", {})

			vim.keymap.set("v", "<leader>cot", function()
				-- Run ui prompt for input from user
				vim.ui.input({ prompt = "Provide task: " }, function(input)
					-- If user does not provide any input, default to "Explain this code"
					if input == "" or input == nil then
						return
					end
					-- Execute escape sequence to exit visual mode and save marks
					local key = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
					vim.api.nvim_feedkeys(key, "x", false)
					-- Feed input to CodyAsk command
					vim.cmd("'<,'>CodyTask " .. input)
				end)
			end, {})
			vim.keymap.set("n", "<leader>cot", function()
				-- Run ui prompt for input from user
				vim.ui.input({ prompt = "Provide task: " }, function(input)
					-- If user does not provide any input, default to "Explain this code"
					if input == "" or input == nil then
						return
					end
					-- Feed input to CodyAsk command
					vim.cmd("CodyTask " .. input)
				end)
			end, {})
		end,
	},
}
