local cspellConfig = {
  config_file_preferred_name = "cspell.json",
  cspell_config_dirs = { "~/.config/cspell/", "~/.local/share/cspell" },
}

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "davidmh/cspell.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local cspell = require("cspell")

    null_ls.setup({
      sources = {
        cspell.diagnostics.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.INFO
          end,
          config = cspellConfig,
        }),
        cspell.code_actions.with({
          config = cspellConfig,
        }),
      },
    })
  end,
}
