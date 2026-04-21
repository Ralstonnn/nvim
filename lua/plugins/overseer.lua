return {
  {
    "stevearc/overseer.nvim",
    ---@module 'overseer'
    ---@type overseer.SetupOpts
    opts = {},
    keys = {
      {
        "or",
        "<cmd>OverseerRun<CR>",
        desc = "Overseer Run"
      },
      {
        "oo",
        "<cmd>OverseerOpen<CR>",
        desc = "Overseer Open"
      },
      {
        "oc",
        "<cmd>OverseerClose<CR>",
        desc = "Overseer Close"
      },
      {
        "ot",
        "<cmd>OverseerToggle<CR>",
        desc = "Overseer Toggle"
      },
      {
        "os",
        "<cmd>OverseerShell<CR>",
        desc = "Overseer Shell"
      },
      {
        "oa",
        "<cmd>OverseerTaskAction<CR>",
        desc = "Overseer Task Action"
      },
    }
  },
}
