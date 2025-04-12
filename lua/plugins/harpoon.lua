return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon.setup()
      -- REQUIRED

      for i = 1, 9 do
        vim.keymap.set("n", "<leader>h" .. i, function()
          harpoon:list():select(i)
        end, { desc = "[H]arpoon " .. i .. " Item" })
      end

      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():add()
      end, { desc = "[H]arpoon [A]dd" })
      vim.keymap.set("n", "<leader>hc", function()
        harpoon:list():clear()
      end, { desc = "[H]arpoon [C]lear" })
      vim.keymap.set("n", "<leader>hw", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "[H]arpoon [W]indow" })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<leader>hp", function()
        harpoon:list():prev()
      end, { desc = "[H]arpoon [P]revious" })
      vim.keymap.set("n", "<leader>hn", function()
        harpoon:list():next()
      end, { desc = "[H]arpoon [N]ext" })
    end,
  },
}
