return {
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function ()
			local bufferline = require('bufferline')

			vim.keymap.set('n', 'bn', ':BufferLineCycleNext<CR>', {})
			vim.keymap.set('n', 'bp', ':BufferLineCyclePrev<CR>', {})
			vim.keymap.set('n', 'bk', ':BufferLinePick<CR>', {})
			vim.keymap.set('n', 'bck', ':BufferLinePickClose<CR>', {})
			vim.keymap.set('n', 'bcl', ':BufferLineCloseLeft<CR>', {})
			vim.keymap.set('n', 'bcr', ':BufferLineCloseRight<CR>', {})
			vim.keymap.set('n', 'bco', ':BufferLineCloseOthers<CR>', {})

			bufferline.setup()
		end
	}
}
