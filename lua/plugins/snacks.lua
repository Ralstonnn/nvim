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
    gitbrowse = require("config.snacks.gitbrowse"),
    indent = {},
    lazygit = {},
    dashboard = require("config.snacks.dashboard")
  },
  keys = {
    {
      "<leader>rf",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename File",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
    {
      "<leader>gi",
      function()
        Snacks.lazygit()
      end,
      desc = "LazyGit",
    },
  },
}
