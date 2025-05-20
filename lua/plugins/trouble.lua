return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>Tq",
      function()
        vim.cmd("cclose")
        vim.cmd("Trouble quickfix toggle")
      end,
      desc = "Quickfix (Trouble)",
    },
  },
}
