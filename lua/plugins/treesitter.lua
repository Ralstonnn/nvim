-- NOTE: Moved to old version of treesitter in master branch because the new one in main cant work with vue (doesn't install parsers)
-- local treesitter_master_branch_config = require("config.treesitter.master_branch_config")
-- local treesitter_main_branch_config = require("config.treesitter.main_branch_config")
--
-- local use_main_branch = false
--
-- return use_main_branch and treesitter_main_branch_config or treesitter_master_branch_config

return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  config = function()
    require("tree-sitter-manager").setup({
      -- Default Options
      -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session. If set to "all", install all parsers.
      -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
      -- auto_install = true, -- if enabled, install missing parsers when editing a new file
      -- highlight = true, -- treesitter highlighting is enabled by default
      -- languages = {}, -- override or add new parser sources
    })
  end
}
