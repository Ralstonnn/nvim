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

-- WARNING: Works incorrectly (Breaks man pages in neovim)
-- vim.api.nvim_create_autocmd("BufRead", {
-- 	desc = "Close all unnamed buffers when new buffer in opened",
-- 	group = vim.api.nvim_create_augroup("clear-unnamed-buffers", { clear = true }),
-- 	command = "bufdo if empty(expand('%:p')) | bd | endif",
-- })

-- -- Add treesitter parsers
-- vim.api.nvim_create_autocmd("FileType", {
--   callback = function(args)
--     local ft = vim.bo[args.buf].filetype
--     local lang = vim.treesitter.language.get_lang(ft)
--
--     if lang and vim.treesitter.language.add(lang) then
--       vim.treesitter.start(args.buf, lang)
--       vim.bo[args.buf].syntax = "off"
--     end
--   end,
-- })
