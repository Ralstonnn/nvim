return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"davidmh/cspell.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local cspell = require("cspell")

		null_ls.setup({
			sources = {
				cspell.diagnostics,
			},
		})
	end,
}
