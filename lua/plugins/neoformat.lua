return {
	{
		'sbdchd/neoformat',
		config = function ()
			vim.g.neoformat_try_node_exe = 1

			local neoformat_group = vim.api.nvim_create_augroup("neoformat_write_pre", { clear = true })

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = neoformat_group,
				command = "Neoformat"
			})

			--[[ vim.api.nvim_create_autocmd("BufWritePre", {
				group = neoformat_group,
				pattern = { "*.js", "*.jsx" ,"*.ts", "*.tsx", "*.vue" },
				callback = function()
					vim.cmd("EslintFixAll")
				end,
			}) ]]
		end
	}
}
