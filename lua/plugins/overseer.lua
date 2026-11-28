return {
  {
    "stevearc/overseer.nvim",
    ---@module 'overseer'
    ---@type overseer.SetupOpts
    opts = {},
    keys = {
      {
        "<leader>or",
        "<cmd>OverseerRun<CR>",
        desc = "Overseer Run",
      },
      {
        "<leader>oo",
        "<cmd>OverseerOpen<CR>",
        desc = "Overseer Open",
      },
      {
        "<leader>oc",
        "<cmd>OverseerClose<CR>",
        desc = "Overseer Close",
      },
      {
        "<leader>ot",
        "<cmd>OverseerToggle<CR>",
        desc = "Overseer Toggle",
      },
      {
        "<leader>os",
        "<cmd>OverseerShell<CR>",
        desc = "Overseer Shell",
      },
      {
        "<leader>oa",
        "<cmd>OverseerTaskAction<CR>",
        desc = "Overseer Task Action",
      },
    },
  },
}
