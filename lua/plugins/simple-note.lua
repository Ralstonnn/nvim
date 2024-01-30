return {
	{
		"rguruprakash/simple-note.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local sn = require("simple-note")

			vim.keymap.set("n", "<leader>snl", "<cmd>SimpleNoteList<CR>")
			vim.keymap.set("n", "<leader>snc", "<cmd>SimpleNoteCreate<CR>")

			sn.setup({
				-- configuration defaults
				notes_dir = "~/.nvim-notes/",
				telescope_new = "<C-n>",
				telescope_delete = "<C-x>",
				telescope_rename = "<C-r>",
			})
		end,
	},
}
