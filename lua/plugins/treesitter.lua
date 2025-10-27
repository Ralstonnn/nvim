-- NOTE: Moved to old version of treesitter in master branch because the new one in main cant work with vue (doesn't insall parsers)
return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "master",
  -- branch = "main",
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
  opts = {
    ensure_installed = {
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
    },
  },
  -- config = function()
  --   local treesitter = require("nvim-treesitter")
  --
  --   treesitter.install({
  --     "bash",
  --     "c",
  --     "html",
  --     "lua",
  --     "luadoc",
  --     "markdown",
  --     "vim",
  --     "vimdoc",
  --     "vue",
  --     "typescript",
  --     "javascript",
  --     "regex",
  --     "css",
  --   })
  -- end,
}
