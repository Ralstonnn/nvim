return {
  {
    name = "kanagawa-wave",
    colorscheme = "kanagawa-wave",
    before = [[
      require("kanagawa").setup({
        theme = "wave",
        transparent = false,
      })
    ]],
  },
  {
    name = "kanagawa-wave-transparent",
    colorscheme = "kanagawa-wave",
    before = [[
      require("kanagawa").setup({
        theme = "wave",
        transparent = true,
      })
    ]],
  },
  {
    name = "kanagawa-dragon",
    colorscheme = "kanagawa-dragon",
    before = [[
      require("kanagawa").setup({
        theme = "dragon",
        transparent = false,
      })
    ]],
  },
}
