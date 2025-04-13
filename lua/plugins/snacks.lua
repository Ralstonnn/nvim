return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = {
      enabled = true,
    },
    image = {
      enabled = true,
    },
    notifier = {
      enabled = true,
    },
    styles = {
      input = {
        relative = "cursor",
        row = -3,
        col = 0,
      },
    },
  },
  keys = {
    {
      "<leader>rf",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename File",
    },
  },
}
