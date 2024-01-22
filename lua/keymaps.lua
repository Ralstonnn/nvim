vim.keymap.set('n', '<C-q>', ':q<CR>', {})
--vim.keymap.set('n', '<C-Q>', ':q!<CR>', {})
vim.keymap.set('n', '<C-s>', ':w<CR>', {})
vim.keymap.set('n', '<C-w>', ':wq<CR>', {})
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', {})

-- Remap Ctrl-[hjkl] to swap active buffer
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', {})
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', {})
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', {})
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', {})

-- Remap Ctrl-Shift-[hjkl] to change current buffer size
vim.keymap.set('n', '<C-S-h>', ':vertical resize +5<CR>', {})
vim.keymap.set('n', '<C-S-l>', ':vertical resize -5<CR>', {})
vim.keymap.set('n', '<C-S-j>', ':resize -5<CR>', {})
vim.keymap.set('n', '<C-S-k>', ':resize +5<CR>', {})

-- Remap <Leader>-v to vertical split and <Leader-h> to horizontal split
vim.keymap.set('n', '<leader>v', ':vsp<CR>',{})
vim.keymap.set('n', '<leader>h', ':sp<CR>',{})

-- Remap <C-d> and <C-u> to center text
vim.keymap.set('n', '<C-d>', '<C-d>zz',{})
vim.keymap.set('n', '<C-u>', '<C-u>zz',{})

-- Remap default deletion 
vim.keymap.set({'n', 'v'}, 'd', '"_d', {})
vim.keymap.set({'n', 'v'}, '<S-d>', 'd',{})
vim.keymap.set('n', 'dd', '"_dd', {})
vim.keymap.set('n', '<S-d><S-d>', 'dd',{})
vim.keymap.set('n', 'p', 'pgvy', {})
vim.keymap.set('n', '<S-p>', 'p', {})

