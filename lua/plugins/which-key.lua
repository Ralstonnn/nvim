return {
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require("which-key").setup()

      -- Document existing key chains
      require("which-key").add({
        { "<leader><F5>", group = "UndoTree" },
        { "<leader>b", group = "[B]uffer" },
        { "<leader>bc", group = "[B]uffer [C]lose" },
        { "<leader>c", group = "[C]ode" },
        { "<leader>n", group = "[N]vim tree" },
        { "<leader>g", group = "[G]it" },
        { "<leader>gs", group = "[G]it [S]igns" },
        { "<leader>gh", group = "[G]it [H]unk" },
        { "<leader>gw", group = "[G]it [W]ork" },
        { "<leader>h", group = "[H]arpoon" },
        { "<leader>r", group = "[R]ename" },
        { "<leader>s", group = "[S]earch" },
        { "<leader>S", group = "[S]ession" },
        { "<leader>t", group = "[T]abs" },
        { "<leader>T", group = "[T]rouble" },
        { "<leader>l", group = "[L]sp" },
        { "<leader>le", group = "[L]sp [E]rrors" },
        { "<leader>o", group = "[O]verseer" },
        { "<leader>u", group = "UFO nvim" },
        { "<leader>ur", group = "UFO nvim reload" },
      })
    end,
  },
}
