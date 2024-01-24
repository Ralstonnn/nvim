return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint_d,
				},
			})
		end,

		vim.keymap.set("n", "<space>gf", function()
			vim.lsp.buf.format({ async = true })
		end, {}),
	},
}
