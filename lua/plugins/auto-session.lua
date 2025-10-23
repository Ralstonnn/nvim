return {
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      log_level = "error",
      auto_session_use_git_branch = true,
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Programming/Projects", "~/Downloads", "/" },
    },
    keys = {
      {"<leader>Ss", "<cmd>AutoSession save<CR>", desc = "Session save"},
      {"<leader>Sr", "<cmd>AutoSession restore<CR>", desc = "Session restore"},
      {"<leader>Sd", "<cmd>AutoSession delete<CR>", desc = "Session delete"},
    },
  },
}
