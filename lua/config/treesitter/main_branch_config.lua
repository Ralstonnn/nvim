return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
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
    })
  end,
}
