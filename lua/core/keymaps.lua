local keymap = vim.keymap

keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
keymap.set("i", "jj", "<esc>")
keymap.set("n", "<c-d>", "<c-d>zz")
keymap.set("n", "<c-u>", "<c-u>zz")

-- diagnostic keymaps
keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "go to previous [d]iagnostic message" })
keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "go to next [d]iagnostic message" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "show diagnostic [e]rror messages" })
-- keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "open diagnostic [q]uickfix list" })

-- exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. otherwise, you normally need to press <c-\><c-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: this won't work in all terminal emulators/tmux/etc. try your own mapping
-- or just use <c-\><c-n> to exit terminal mode
-- NOTE: Commented out because it interferes with lazygit
-- keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "exit terminal mode" })

-- keybinds to make split navigation easier.
--  use ctrl+<hjkl> to switch between windows
--
--  see `:help wincmd` for a list of all window commands
--  NOTE: Now using TmuxNavigate plugin
--	  If removed uncomment this keymaps to switch windows with vim keys
-- keymap.set("n", "<c-h>", "<c-w><c-h>", { desc = "move focus to the left window" })
-- keymap.set("n", "<c-l>", "<c-w><c-l>", { desc = "move focus to the right window" })
-- keymap.set("n", "<c-j>", "<c-w><c-j>", { desc = "move focus to the lower window" })
-- keymap.set("n", "<c-k>", "<c-w><c-k>", { desc = "move focus to the upper window" })
-- Resize panes
-- keymap.set("n", "<c-left>", "<cmd>vertical resize -5<CR>", { desc = "decrease pane width" })
-- keymap.set("n", "<c-right>", "<cmd>vertical resize +5<CR>", { desc = "increase pane width" })
-- keymap.set("n", "<c-down>", "<cmd>resize -5<CR>", { desc = "decrease pane height" })
-- keymap.set("n", "<c-up>", "<cmd>resize +5<CR>", { desc = "increase pane height" })
-- Resize panes backup
keymap.set('n', '<c-a-h>', '<cmd>vertical resize -5<CR>', {desc = "decrease pane width"})
keymap.set('n', '<c-a-l>', '<cmd>vertical resize +5<CR>', {desc = "increase pane width"})
keymap.set('n', '<c-a-j>', '<cmd>resize -5<CR>', {desc = "decrease pane height"})
keymap.set('n', '<c-a-k>', '<cmd>resize +5<CR>', {desc = "increase pane height"})

-- tabs
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
-- keymap.set("n", "<leader>td", "<cmd>tabonly<CR>", { desc = "Close all tabs except current" })
--
-- Works with bufferline
-- keymap.set("n", "<leader>tss", "<cmd>BufferLinePick<CR>", { desc = "Pick a tab" })
-- keymap.set("n", "<leader>tsc", "<cmd>BufferLinePickClose<CR>", { desc = "Pick a tab to close" })

-- close buffers
-- Delete every listed buffer except the current one. Unsaved buffers are
-- skipped (never force-discarded) and reported instead.
local function closeAllBuffersButCurrent()
  local current = vim.api.nvim_get_current_buf()
  local closed, failed = 0, 0

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.bo[buf].buflisted then
      if pcall(vim.api.nvim_buf_delete, buf, { force = false }) then
        closed = closed + 1
      else
        failed = failed + 1
      end
    end
  end

  if failed > 0 then
    vim.notify(
      ("Closed %d buffer(s); %d skipped (unsaved changes)"):format(closed, failed),
      vim.log.levels.WARN
    )
  end
end
keymap.set("n", "<leader>bca", closeAllBuffersButCurrent, { desc = "Buffers close all" })
keymap.set("n", "<leader>br", "<cmd>edit<CR>", { desc = "Buffer reload" })

keymap.set("n", "<leader>Vr", "<cmd>restart<CR>", { desc = "Restart nvim" })
