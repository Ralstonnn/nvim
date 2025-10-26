return {
  "zaldih/themery.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "olimorris/onedarkpro.nvim",
    "rebelot/kanagawa.nvim",
  },
  opts = {
    themes = {
      "onedark",
      "onelight",
      "onedark_vivid",
      "onedark_dark",
      "vaporwave",
      "kanagawa-wave",
      "kanagawa-dragon",
      "kanagawa-lotus",
    },
    listPreview = true,
  },
}
