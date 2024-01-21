return {
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function ()
			local bufferline = require('bufferline')

			vim.keymap.set('n', '<leader>bn', ':BufferLineCycleNext<CR>', {})
			vim.keymap.set('n', '<leader>bp', ':BufferLineCyclePrev<CR>', {})
			vim.keymap.set('n', '<leader>bk', ':BufferLinePick<CR>', {})
			vim.keymap.set('n', '<leader>bcc', ':BufferLinePickClose<CR>', {})
			vim.keymap.set('n', '<leader>bcl', ':BufferLineCloseLeft<CR>', {})
			vim.keymap.set('n', '<leader>bcr', ':BufferLineCloseRight<CR>', {})
			vim.keymap.set('n', '<leader>bco', ':BufferLineCloseOthers<CR>', {})

			bufferline.setup()
		end
	}
}
