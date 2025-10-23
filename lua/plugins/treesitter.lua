return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      opts = {},
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = { enabled = true }
    },
  },
  confing = function()
    local treesitter = require()

    treesitter.install(
      {
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
      }
    )
  end
}
