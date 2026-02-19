local function get_git_key()
  local cwd = vim.loop.cwd() or ""

  local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
  local git_key = cwd .. (branch ~= "" and ("|" .. branch) or "")

  return git_key
end

local function setup_keys(harpoon)
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
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup({
      settings = {
        key = get_git_key,
      },
    })
    -- REQUIRED

    setup_keys(harpoon)
  end,
}
