return {
	{
		"sourcegraph/sg.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local sg = require("sg")

			vim.keymap.set("n", "<leader>cot", "<cmd>CodyToggle<cr>")

			sg.setup({})
		end,
	},
}
