return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local bufferline = require("bufferline")

			vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", {desc= "[B]ufferLine [N]ext"})
			vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", {desc= "[B]ufferLine [P]revoius"})
			vim.keymap.set("n", "<leader>bk", ":BufferLinePick<CR>", {desc= "[B]ufferLine Pic[k]"})
			vim.keymap.set("n", "<leader>bck", ":BufferLinePickClose<CR>", {desc= "[B]ufferLine [C]lose Pic[k]"})
			vim.keymap.set("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", {desc= "[B]ufferLine [C]lose [L]elft"})
			vim.keymap.set("n", "<leader>bcr", ":BufferLineCloseRight<CR>", {desc= "[B]ufferLine [C]lose [R]ight"})
			vim.keymap.set("n", "<leader>bco", ":BufferLineCloseOthers<CR>", {desc= "[B]ufferLine [C]lose [O]thers"})

			bufferline.setup()
		end,
	},
}
