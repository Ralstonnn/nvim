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
      enabled = false, -- NOTE: Disabled because dropbar does the same thing
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
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { "ruby" },
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,

  -- NOTE: Config function for main branch
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
