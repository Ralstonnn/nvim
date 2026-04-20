return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    -- Optional dependencies
    dependencies = {
      { "nvim-mini/mini.icons", opts = {} },
      {
        "malewicz1337/oil-git.nvim",
        dependencies = { "stevearc/oil.nvim" },
        opts = {},
      },
      {
        "JezerM/oil-lsp-diagnostics.nvim",
        dependencies = { "stevearc/oil.nvim" },
        opts = {},
      },
      "folke/snacks.nvim",
    },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "OilActionsPost",
        callback = function(event)
          if event.data.actions[1].type == "move" then
            Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
          end
        end,
      })

      require("oil").setup({
        keymaps = {
          ["?"] = { "actions.show_help", mode = "n" },
          ["<CR>"] = "actions.select",
          ["<C-u>"] = { "actions.select", opts = { vertical = true } },
          ["<C-i>"] = { "actions.select", opts = { horizontal = true } },
          ["<C-t>"] = { "actions.select", opts = { tab = true } },
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = { "actions.close", mode = "n" },
          ["<C-r>"] = "actions.refresh",
          ["-"] = { "actions.parent", mode = "n" },
          ["_"] = { "actions.open_cwd", mode = "n" },
          ["`"] = { "actions.cd", mode = "n" },
          ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
          ["gs"] = { "actions.change_sort", mode = "n" },
          ["gx"] = "actions.open_external",
          ["g."] = { "actions.toggle_hidden", mode = "n" },
          ["g\\"] = { "actions.toggle_trash", mode = "n" },
          ["yr"] = {
            callback = function()
              local entry = require("oil").get_cursor_entry()
              if not entry then
                return
              end

              local full_path = require("oil").get_current_dir() .. entry.name
              local rel_path = "./" .. vim.fn.fnamemodify(full_path, ":.")

              vim.fn.setreg("+", rel_path)
              vim.notify("Copied: " .. rel_path)
            end,
            mode = "n",
            desc = "Copy relative path",
          },
          ["yp"] = {
            callback = function()
              local entry = require("oil").get_cursor_entry()
              if not entry then
                return
              end

              local full_path = require("oil").get_current_dir() .. entry.name

              vim.fn.setreg("+", full_path)
              vim.notify("Copied: " .. full_path)
            end,
            mode = "n",
            desc = "Copy absolute path",
          },
        },
        use_default_keymaps = false,
      })
    end,
    keys = {
      {
        "<leader>o",
        "<cmd>Oil<cr>",
        desc = "Open oil",
      },
    },
  },
}
