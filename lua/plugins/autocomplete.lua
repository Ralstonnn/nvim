local function getSnippetsDir()
  -- TODO: Optional add another dir that wouldn't be backed up to git
  -- local snippetsDir = "$HOME/.config/nvim/snippets"
  -- return snippetsDir
  local path = vim.fn.expand("~/.local/share/nvim_snippets")
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p")
  end
  return path
end

return {
  "saghen/blink.cmp",
  dependencies = {
    {
      -- Plugin to add snippets from selected code
      "chrisgrieser/nvim-scissors",
      dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
      opts = {
        snippetDir = getSnippetsDir(),
      },
    },
    {
      -- Plugin to use custom snippets
      "L3MON4D3/LuaSnip",
      build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load({
          paths = { getSnippetsDir() },
        })
      end,
    },
    "rafamadriz/friendly-snippets",
  },
  -- use a release tag to download pre-built binaries
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = "default" },

    appearance = {
      nerd_font_variant = "mono",
    },
    completion = { documentation = { auto_show = true } },
    snippets = { preset = "luasnip" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}

-- return {
--   { -- Autocompletion
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter",
--     dependencies = {
--       {
--         -- Plugin to add snippets from selected code
--         "chrisgrieser/nvim-scissors",
--         dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
--         opts = {
--           snippetDir = getSnippetsDir(),
--         },
--       },
--       {
--         -- Plugin to use custom snippets
--         "L3MON4D3/LuaSnip",
--         build = (function()
--           if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
--             return
--           end
--           return "make install_jsregexp"
--         end)(),
--         config = function()
--           require("luasnip.loaders.from_vscode").lazy_load({
--             paths = { getSnippetsDir() },
--           })
--         end,
--       },
--       "rafamadriz/friendly-snippets", -- useful snippets
--       "saadparwaiz1/cmp_luasnip", -- for autocompletion
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-buffer", -- source for text in buffer
--       "hrsh7th/cmp-path", -- source for file system paths
--       "onsails/lspkind.nvim", -- vs-code like pictograms
--     },
--     config = function()
--       -- See `:help cmp`
--       local cmp = require("cmp")
--       local luasnip = require("luasnip")
--       local lspkind = require("lspkind")
--
--       require("luasnip.loaders.from_vscode").lazy_load()
--
--       local formatting_style = {
--         format = lspkind.cmp_format({
--           mode = "symbol", -- show only symbol annotations
--           maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
--           -- can also be a function to dynamically calculate max width such as
--           -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
--           ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
--           show_labelDetails = true, -- show labelDetails in menu. Disabled by default
--
--           -- The function below will be called before any actual modifications from lspkind
--           -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
--           before = function(entry, vim_item)
--             return vim_item
--           end,
--         }),
--       }
--
--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             luasnip.lsp_expand(args.body)
--           end,
--         },
--         completion = { completeopt = "menu,menuone,noinsert" },
--         formatting = formatting_style,
--
--         -- For an understanding of why these mappings were
--         -- chosen, you will need to read `:help ins-completion`
--         --
--         -- No, but seriously. Please read `:help ins-completion`, it is really good!
--         mapping = cmp.mapping.preset.insert({
--           -- Select the [n]ext item
--           ["<C-j>"] = cmp.mapping.select_next_item(),
--           -- Select the [p]revious item
--           ["<C-k>"] = cmp.mapping.select_prev_item(),
--
--           -- Scroll the documentation window [b]ack / [f]orward
--           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           ["<C-f>"] = cmp.mapping.scroll_docs(4),
--
--           -- Accept ([y]es) the completion.
--           --  This will auto-import if your LSP supports it.
--           --  This will expand snippets if the LSP sent a snippet.
--           ["<C-y>"] = cmp.mapping.confirm({ select = true }),
--
--           -- Manually trigger a completion from nvim-cmp.
--           --  Generally you don't need this, because nvim-cmp will display
--           --  completions whenever it has completion options available.
--           ["<C-Space>"] = cmp.mapping.complete({}),
--
--           -- Think of <c-l> as moving to the right of your snippet expansion.
--           --  So if you have a snippet that's like:
--           --  function $name($args)
--           --    $body
--           --  end
--           --
--           -- <c-l> will move you to the right of each of the expansion locations.
--           -- <c-h> is similar, except moving you backwards.
--           ["<C-l>"] = cmp.mapping(function()
--             if luasnip.expand_or_locally_jumpable() then
--               luasnip.expand_or_jump()
--             end
--           end, { "i", "s" }),
--           ["<C-h>"] = cmp.mapping(function()
--             if luasnip.locally_jumpable(-1) then
--               luasnip.jump(-1)
--             end
--           end, { "i", "s" }),
--
--           -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
--           --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
--         }),
--         sources = {
--           { name = "nvim_lsp" }, -- snippets from lsp
--           { name = "luasnip" }, -- snippets
--           { name = "buffer" }, -- text within current buffer
--           { name = "path" }, -- file system paths
--         },
--       })
--     end,
--   },
-- }
