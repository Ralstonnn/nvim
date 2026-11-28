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
    {"<leader>gss", "<cmd>Gitsigns<CR>", desc = "Git Signs Toggle"},
    {"<leader>ghj", "<cmd>Gitsigns next_hunk<CR>", desc = "Git Next Hunk"},
    {"<leader>ghk", "<cmd>Gitsigns prev_hunk<CR>", desc = "Git Previous Hunk"},
    {"<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Git Preview Hunk"},
    {"<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Git Reset Hunk"},
    {"<leader>gdt", "<cmd>Gitsigns diffthis<CR>", desc = "Git Signs Diff This"},
    {"<leader>gdd", "<cmd>Gitsigns diff<CR>", desc = "Git Signs Diff"},
    {"<leader>gb", "<cmd>Gitsigns blame<CR>", desc = "Git Blame Toggle"},
    {
      "<leader>gwt",
      function()
        require("utils.git.custom").copyTaskName()
      end,
      desc = "[G]it [W]ork [T]ask Name",
    },
  },
}
