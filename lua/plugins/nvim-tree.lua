return {
  -- TODO: Before removing nvim-tree remove netrw disabling in lua/core/options.lua
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
      { "<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree Toggle" },
      { "<leader>nf", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTree Reveal" },
    },
    opts = {},
  },
}
