local function mergeKeys(nestedArray)
  local keysArr = {}

  for i = 1, #nestedArray do
    local currentArr = nestedArray[i]
    for j = 1, #currentArr do
      keysArr[#keysArr + 1] = currentArr[j]
    end
  end

  return keysArr
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    gitbrowse = require("config.snacks.config.gitbrowse"),
    dashboard = require("config.snacks.config.dashboard"),
    input = require("config.snacks.config.input"),
    image = require("config.snacks.config.image"),
    notifier = require("config.snacks.config.picker"),
    dim = require("config.snacks.config.dim"),
    styles = require("config.snacks.config.styles"),
    indent = require("config.snacks.config.indent"),
    lazygit = require("config.snacks.config.lazygit"),
    scope = require("config.snacks.config.scope"),
    picker = require("config.snacks.config.picker"),
  },
  keys = mergeKeys({
    require("config.snacks.keys.gitbrowse"),
    require("config.snacks.keys.lazygit"),
    require("config.snacks.keys.dim"),
    require("config.snacks.keys.picker"),
  }),
}
