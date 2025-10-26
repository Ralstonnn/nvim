return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      lazy = false,
      opts = {},
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      lazy = false,
      opts = {},
    },
  },
  config = function()
    local treesitter = require("nvim-treesitter")

    treesitter.install({
      "bash",
      "c",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "vim",
      "vimdoc",
      "vue",
      "typescript",
      "javascript",
      "regex",
      "css",
    })
  end,
}
