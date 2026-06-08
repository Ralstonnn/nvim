local mergeKeys = require("utils.common").mergeKeys

return {
  "zaldih/themery.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "navarasu/onedark.nvim",
    "rebelot/kanagawa.nvim",
    "neanias/everforest-nvim",
    "sainnhe/sonokai",
    "rose-pine/neovim",
    "folke/tokyonight.nvim",
    "tiagovla/tokyodark.nvim",
  },
  opts = {
    themes = mergeKeys({
      require("config.themery.one-dark"),
      require("config.themery.kanagawa"),
      require("config.themery.rose-pine"),
      require("config.themery.sonokai"),
      require("config.themery.tokyonight"),
      {
        "tokyodark",
        "everforest",
      },
    }),
    listPreview = true,
  },
}
