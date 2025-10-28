return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      symbols = {
        focus = true,
        win = {
          size = 0.3,
        },
      },
    },
  }, -- for default options, refer to the configuration section for custom setup.
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
    {
      "<leader>Tl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    { "<leader>lee", "<cmd>Trouble diagnostics toggle<CR>", desc = "Show Diagnostic [E]rror Messages" },
    {
      "<leader>leb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Show Diagnostic [E]rror Messages Current Buffer",
    },
    { "<leader>ls", "<cmd>Trouble symbols toggle<CR>", desc = "Symbols (Trouble)" },
  },
}
