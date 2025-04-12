return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    scope = {
      enabled = true, -- Enable active indent highlighting
      show_start = true, -- Show start of the active indent
      show_end = false, -- Hide end of the indent (set true if you want)
      highlight = { "Function", "Label", "CursorColumn", "Whitespace" }, -- Custom highlights (use your preferred ones)
    },
  },
}
