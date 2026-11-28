-- Single source of truth for diagnostics.
-- NOTE: `virtual_text` is disabled here because tiny-inline-diagnostic
-- (lua/plugins/tiny-inline-diagnostics.lua) renders diagnostics inline itself.
local severity = vim.diagnostic.severity

vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})
