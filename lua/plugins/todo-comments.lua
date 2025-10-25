return {
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
    },
    keys = {
      {"<leader>st", "<cmd>TodoTelescope<CR>", desc = "[S]earch [T]odo" }
    }
  },
}
