return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
      "folke/snacks.nvim",
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
      { "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "NeoTree Toggle" },
      { "<leader>nf", "<cmd>Neotree reveal<cr>", desc = "NeoTree Reveal" },
    },
    opts = function(_, opts)
      local function on_move(data)
        Snacks.rename.on_rename_file(data.source, data.destination)
      end
      local events = require("neo-tree.events")

      opts.event_handlers = opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      })

      opts.window = opts.window or {}
      opts.window.mappings = opts.window.mappings or {}
      opts.window.mappings["Y"] = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local filename = node.name
        local modify = vim.fn.fnamemodify

        local results = {
          filepath,
          modify(filepath, ":."), -- relative to CWD
          modify(filepath, ":~"), -- relative to HOME
          filename,
          modify(filename, ":r"), -- basename without extension
          modify(filename, ":e"), -- extension
        }

        vim.ui.select({
          "1. Absolute path: " .. results[1],
          "2. Path relative to CWD: " .. results[2],
          "3. Path relative to HOME: " .. results[3],
          "4. Filename: " .. results[4],
          "5. Filename without extension: " .. results[5],
          "6. Extension of the filename: " .. results[6],
        }, { prompt = "Choose to copy to clipboard:" }, function(choice)
          if not choice then
            return
          end
          local i = tonumber(choice:sub(1, 1))
          local result = results[i]
          vim.fn.setreg('"', result)
          vim.notify("Copied: " .. result)
        end)
      end
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    opst = {
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          -- if the buffer type is one of following, the window will be ignored
          buftype = { "terminal", "quickfix" },
        },
      },
    },
  },
}
