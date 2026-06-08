return {
  {
    name = "tokyodark",
    colorscheme = "tokyodark",
    before = [[
      require("tokyodark").setup({
        transparent_background = false,
      })
    ]],
  },
  {
    name = "tokyodark transparent",
    colorscheme = "tokyodark",
    before = [[
      require("tokyodark").setup({
        transparent_background = true,
      })
    ]],
  },
}
