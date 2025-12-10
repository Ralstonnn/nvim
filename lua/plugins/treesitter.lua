-- NOTE: Moved to old version of treesitter in master branch because the new one in main cant work with vue (doesn't install parsers)
local treesitter_master_branch_config = require("config.treesitter.master_branch_config")
local treesitter_main_branch_config = require("config.treesitter.main_branch_config")

local use_main_branch = false

return use_main_branch and treesitter_main_branch_config or treesitter_master_branch_config
