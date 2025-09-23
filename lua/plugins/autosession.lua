return {
  {
    "rmagatti/auto-session",
    config = function()
      vim.keymap.set("n", "<leader>Ss", "<cmd>AutoSession save<CR>", { desc = "Session save" })
      vim.keymap.set("n", "<leader>Sr", "<cmd>AutoSession restore<CR>", { desc = "Session restore" })
      vim.keymap.set("n", "<leader>Sd", "<cmd>AutoSession delete<CR>", { desc = "Session delete" })

      require("auto-session").setup({
        log_level = "error",
        auto_session_use_git_branch = true,
        auto_restore_enabled = false,
        auto_session_suppress_dirs = { "~/", "~/Programming/Projects", "~/Downloads", "/" },
      })
    end,
  },
}
