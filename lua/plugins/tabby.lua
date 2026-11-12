return {
  {
    "nanozuki/tabby.nvim",
    event = "VeryLazy",
    opts = {
      preset = "tab_only",
    },
    keys = (function()
      local keys = {
        { "<leader>to", "<cmd>tabnew<CR>", desc = "Open new tab" },
        { "<leader>tcc", "<cmd>tabclose<CR>", desc = "Close current tab" },
        { "<leader>tn", "<cmd>tabn<CR>", desc = "Go to next tab" },
        { "<leader>tp", "<cmd>tabp<CR>", desc = "Go to previous tab" },
        { "<leader>tf", "<cmd>tabnew %<CR>", desc = "Open current buffer in new tab" },
        { "<leader>tca", "<cmd>tabonly<CR>", desc = "Close all tabs except current" },
        -- { "<leader>tss", "<cmd>Tabby jump_to_tab<CR>", desc = "Pick a tab" },
        { "<leader>tmp", ":-tabmove<CR>", desc = "Tab move previous" },
        { "<leader>tmn", ":+tabmove<CR>", desc = "Tab move next" },
        -- { "<leader>tsc", tabPickClose, desc = "Pick a tab to close" },
      }

      for number = 1, 10 do
        local key = tostring(number % 10)

        table.insert(keys, {
          "<leader>t" .. key,
          "<cmd>" .. number .. "tabnext<CR>",
          desc = "Go to tab " .. number,
        })

        table.insert(keys, {
          "<leader>tm" .. key,
          "<cmd>tabmove " .. (number) .. "<CR>",
          desc = "Move current tab to position " .. number,
        })

        table.insert(keys, {
          "<leader>tc" .. key,
          "<cmd>" .. number .. "tabclose<CR>",
          desc = "Close tab " .. number,
        })
      end

      return keys
    end)(),
  },
}
