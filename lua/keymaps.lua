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

