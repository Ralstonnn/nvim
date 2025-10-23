return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
      { "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "NeoTree Toggle" },
      { "<leader>nf", "<cmd>Neotree reveal<cr>", desc = "NeoTree Reveal" },
    },
  }
}
