return {
  {
    "nanozuki/tabby.nvim",
    event = "VeryLazy",
    opts = {
      preset = "tab_only",
    },
    keys = {
      { "<leader>to", "<cmd>tabnew<CR>", desc = "Open new tab" },
      { "<leader>tc", "<cmd>tabclose<CR>", desc = "Close current tab" },
      { "<leader>tn", "<cmd>tabn<CR>", desc = "Go to next tab" },
      { "<leader>tp", "<cmd>tabp<CR>", desc = "Go to previous tab" },
      { "<leader>tf", "<cmd>tabnew %<CR>", desc = "Open current buffer in new tab" },
      { "<leader>td", "<cmd>tabonly<CR>", desc = "Close all tabs except current" },
      { "<leader>tss", "<cmd>Tabby jump_to_tab<CR>", desc = "Pick a tab" },
      { "<leader>tmp", ":-tabmove<CR>", desc = "Tab move previous" },
      { "<leader>tmn", ":+tabmove<CR>", desc = "Tab move next" },
      -- { "<leader>tsc", tabPickClose, desc = "Pick a tab to close" },
    },
  },
}
