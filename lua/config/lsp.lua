local function onLspAttach(event)
  local map = function(keys, func, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
  end

  local telescope_builtin = require("telescope.builtin")

  -- map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  -- map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
  -- map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  -- map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

  map("gd", telescope_builtin.lsp_definitions, "[G]oto [D]efinition")
  map("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
  map("gI", telescope_builtin.lsp_implementations, "[G]oto [I]mplementation")
  map("<leader>ld", telescope_builtin.lsp_type_definitions, "Type Definition")
  map("<leader>lee", "<cmd>Trouble diagnostics toggle<CR>", "Show Diagnostic [E]rror Messages")
  map(
    "<leader>leb",
    "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
    "Show Diagnostic [E]rror Messages Current Buffer"
  )
  map("<leader>ls", "<cmd>Trouble symbols toggle focus=false<CR>", "Symbols (Trouble)")
  map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  map("K", vim.lsp.buf.hover, "Hover Documentation")
  map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  map("<leader>lr", "<cmd>LspRestart<CR>", "[L]sp [R]estart")

  -- The following two autocommands are used to highlight references of the
  -- word under your cursor when your cursor rests there for a little while.
  --    See `:help CursorHold` for information about when this is executed
  --
  -- When you move your cursor, the highlights will be cleared (the second autocommand).
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = event.buf,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = event.buf,
      callback = vim.lsp.buf.clear_references,
    })
  end

  -- -- The following autocommand is used to enable inlay hints in your
  -- -- code, if the language server you are using supports them
  -- --
  -- -- This may be unwanted, since they displace some of your code
  -- if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
  -- 	map("<leader>th", function()
  -- 		vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
  -- 	end, "[T]oggle Inlay [H]ints")
  -- end
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = onLspAttach,
})


