return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require("gitsigns")

      gitsigns.setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        current_line_blame = true,
      })

      vim.keymap.set("n", "<leader>gss", "<cmd>Gitsigns<CR>", { desc = "[G]it [S]signs Toggle" })
      vim.keymap.set("n", "<leader>gsn", "<cmd>Gitsigns next_hunk<CR>", { desc = "[G]it [S]signs Next Hunk" })
      vim.keymap.set("n", "<leader>gsu", "<cmd>Gitsigns prev_hunk<CR>", { desc = "[G]it [S]signs Previous Hunk" })
      vim.keymap.set("n", "<leader>gsp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "[G]it [S]signs [P]review Hunk" })
      vim.keymap.set("n", "<leader>gsd", "<cmd>Gitsigns diffthis<CR>", { desc = "[G]it [S]signs [D]iff" })
      vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<CR>", { desc = "[G]it [B]lame Toggle" })
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
      vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
      vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
      vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
      vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
      vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
      vim.g.lazygit_config_file_path = "" -- custom config file path
      -- OR
      vim.g.lazygit_config_file_path = {} -- table of custom config file paths

      vim.keymap.set("n", "<leader>gi", ":LazyGit<CR>", { desc = "LazyGit" })
    end,
  },
}
