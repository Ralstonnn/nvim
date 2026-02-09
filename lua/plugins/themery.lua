return {
  "zaldih/themery.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "navarasu/onedark.nvim",
    "rebelot/kanagawa.nvim",
    "neanias/everforest-nvim",
  },
  opts = {
    themes = {
      {
        name = "One Dark Warm",
        colorscheme = "onedark",
        before = [[
          require('onedark').setup({
              style = "warm"
          })
        ]],
      },
      {
        name = "One Dark Warmer",
        colorscheme = "onedark",
        before = [[
          require('onedark').setup({
              style = "warmer"
          })
        ]],
      },
      {
        name = "One Dark Cool",
        colorscheme = "onedark",
        before = [[
          require('onedark').setup({
              style = "cool"
          })
        ]],
      },
      {
        name = "One Dark Deep",
        colorscheme = "onedark",
        before = [[
          require('onedark').setup({
              style = "deep"
          })
        ]],
      },
      {
        name = "One Dark Dark",
        colorscheme = "onedark",
        before = [[
          require('onedark').setup({
              style = "dark"
          })
        ]],
      },
      {
        name = "One Dark Darker",
        colorscheme = "onedark",
        before = [[
          require('onedark').setup({
              style = "darker"
          })
        ]],
      },
      "kanagawa-wave",
      "kanagawa-dragon",
      "kanagawa-lotus",
      "everforest",
    },
    listPreview = true,
  },
}
