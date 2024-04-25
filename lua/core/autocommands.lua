-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- WARNING: Works incorrectly
-- vim.api.nvim_create_autocmd("BufRead", {
-- 	desc = "Close all unnamed buffers when new buffer in opened",
-- 	group = vim.api.nvim_create_augroup("clear-unnamed-buffers", { clear = true }),
-- 	command = "bufdo if empty(expand('%:p')) | bd | endif",
-- })

