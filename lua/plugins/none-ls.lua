local cspellConfig = {
  config_file_preferred_name = "cspell.json",
  cspell_config_dirs = { "~/.config/cspell/", "~/.local/share/cspell" },
}

return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "davidmh/cspell.nvim",
  },
  opts = function(_, opts)
    local cspell = require("cspell")

    opts.sources = opts.sources or {}

    table.insert(
      opts.sources,
      cspell.diagnostics.with({
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = vim.diagnostic.severity.INFO
        end,
        config = cspellConfig,
      })
    )

    table.insert(opts.sources, cspell.code_actions.with({ config = cspellConfig }))
  end,
}
