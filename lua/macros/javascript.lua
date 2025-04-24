local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.api.nvim_create_augroup("JsLogMacro", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "JsLogMacro",
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  callback = function()
    vim.fn.setreg("l", "yoconsole.log('" .. esc .. "pa: ', " .. esc .. "pa);" .. esc)
    vim.fn.setreg("o", "yoconsole.log('" .. esc .. "pa:');" .. esc .. "oconsole.log(" .. esc .. "pA);" .. esc)
  end,
})
