return {
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader><F5>", function()
				vim.cmd.UndotreeToggle()
				vim.cmd.UndotreeFocus()
			end)
		end,
	},
}
