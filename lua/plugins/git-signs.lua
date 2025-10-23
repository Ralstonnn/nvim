return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  event = "BufEnter",
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    current_line_blame = true,
  },
  keys = {
    {"<leader>gss", "<cmd>Gitsigns<CR>", desc = "[G]it [S]signs Toggle"},
    {"<leader>gsn", "<cmd>Gitsigns next_hunk<CR>", desc = "[G]it [S]signs Next Hunk"},
    {"<leader>gsu", "<cmd>Gitsigns prev_hunk<CR>", desc = "[G]it [S]signs Previous Hunk"},
    {"<leader>gsp", "<cmd>Gitsigns preview_hunk<CR>", desc = "[G]it [S]signs [P]review Hunk"},
    {"<leader>gsd", "<cmd>Gitsigns diffthis<CR>", desc = "[G]it [S]signs [D]iff"},
    {"<leader>gb", "<cmd>Gitsigns blame<CR>", desc = "[G]it [B]lame Toggle"},
  },
  config = function()
    local customUtils = require("utils.git.custom")
    -- NOTE: Custom functions
    vim.keymap.set(
      "n",
      "<leader>gwt",
      customUtils.copyTaskName,
      { desc = "[G]it [W]ork [T]ask Name" }
    )
  end
}
