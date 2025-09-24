local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))

  ---------------------------------------------------------------------------------------
  --- Added autocommand for nvim-tree file rename from nvim-snacks
  ---------------------------------------------------------------------------------------
  local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
  vim.api.nvim_create_autocmd("User", {
    pattern = "NvimTreeSetup",
    callback = function()
      local events = require("nvim-tree.api").events
      events.subscribe(events.Event.NodeRenamed, function(data)
        if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
          data = data
          Snacks.rename.on_rename_file(data.old_name, data.new_name)
        end
      end)
    end,
  })
  ---------------------------------------------------------------------------------------
end

return {
  "nvim-tree/nvim-tree.lua",
  dependecies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimTree = require("nvim-tree")

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { desc = "Nvim-Tree Toggle" })
    -- vim.keymap.set("n", "<leader>nc", ":NvimTreeCollapse<CR>", { desc = "Nvim-Tree Collapse" })
    -- vim.keymap.set("n", "<leader>nf", ":NvimTreeFocus<CR>", { desc = "Nvim-Tree Focus" })
    vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", { desc = "Nvim-Tree Find File" })

    -- OR setup with some options
    nvimTree.setup({
      -- sort = {
      -- 	sorter = "case_sensitive",
      -- },
      view = {
        width = 50,
        relativenumber = true,
      },
      -- renderer = {
      -- 	group_empty = true,
      -- },
      filters = {
        git_ignored = false,
        custom = { "^\\.DS_Store" },
      },
      git = {
        timeout = 4000,
      },
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "▼",
              arrow_open = "▲",
            },
          },
        },
      },
      on_attach = on_attach,
    })
  end,
}
