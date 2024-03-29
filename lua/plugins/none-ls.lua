return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			local sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.formatting.sql_formatter,
				null_ls.builtins.formatting.black,
			}

			null_ls.setup({
				sources = sources,
			})
		end,

		vim.keymap.set("n", "<space>gf", function()
			vim.lsp.buf.format({ async = true })
		end, {}),
	},
}
