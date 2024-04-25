local keymap = vim.keymap

keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
keymap.set("i", "jj", "<esc>")

-- diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "go to previous [d]iagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "go to next [d]iagnostic message" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "show diagnostic [e]rror messages" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "open diagnostic [q]uickfix list" })

-- exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. otherwise, you normally need to press <c-\><c-n>, which
-- is not what someone will guess without a bit more experience.
--
-- note: this won't work in all terminal emulators/tmux/etc. try your own mapping
-- or just use <c-\><c-n> to exit terminal mode
keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "exit terminal mode" })

-- keybinds to make split navigation easier.
--  use ctrl+<hjkl> to switch between windows
--
--  see `:help wincmd` for a list of all window commands
keymap.set("n", "<c-h>", "<c-w><c-h>", { desc = "move focus to the left window" })
keymap.set("n", "<c-l>", "<c-w><c-l>", { desc = "move focus to the right window" })
keymap.set("n", "<c-j>", "<c-w><c-j>", { desc = "move focus to the lower window" })
keymap.set("n", "<c-k>", "<c-w><c-k>", { desc = "move focus to the upper window" })

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- close buffers
local function closeAllBuffersButCurrentOne()
    local bufs = vim.api.nvim_list_bufs()
    local current_buf = vim.api.nvim_get_current_buf()
    for _, i in ipairs(bufs) do
        if i ~= current_buf then
            vim.api.nvim_buf_delete(i, {})
        end
    end
end
keymap.set("n", "<leader>bco", closeAllBuffersButCurrentOne, { desc = "Buffers close all buffers except current" })
keymap.set("n", "<leader>bca", "<cmd>bufdo bdelete<CR>", { desc = "Buffers close all" })

