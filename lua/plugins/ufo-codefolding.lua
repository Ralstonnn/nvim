return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = { "BufWinEnter" },
    config = function()
      local ufo = require("ufo")

      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set("n", "zR", ufo.openAllFolds)
      vim.keymap.set("n", "zM", ufo.closeAllFolds)
      vim.keymap.set("n", "zK", function()
        local winid = ufo.peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, { desc = "Peek Fold" })

      --------------------------------
      -- NOTE: Set in lsp config file
      --------------------------------
      -- Option 2: nvim lsp as LSP client
      -- Tell the server the capability of foldingRange,
      -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities.textDocument.foldingRange = {
      -- 	dynamicRegistration = false,
      -- 	lineFoldingOnly = true,
      -- }
      -- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      -- for _, ls in ipairs(language_servers) do
      -- 	require("lspconfig")[ls].setup({
      -- 		capabilities = capabilities,
      -- 		-- you can add other fields for setting up lsp server in this table
      -- 	})
      -- end
      ufo.setup()

      -- Option 3: treesitter as a main provider instead
      -- (Note: the `nvim-treesitter` plugin is *not* needed.)
      -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
      -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
      -- ufo.setup({
      -- 	provider_selector = function(bufnr, filetype, buftype)
      -- 		return { "treesitter", "indent" }
      -- 	end,
      -- })

      -- Option 4: disable all providers for all buffers
      -- Not recommend, AFAIK, the ufo's providers are the best performance in Neovim
      -- require("ufo").setup({
      -- 	provider_selector = function(bufnr, filetype, buftype)
      -- 		return ""
      -- 	end,
      -- })
    end,
  },
}
