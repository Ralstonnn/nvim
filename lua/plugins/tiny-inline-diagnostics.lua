return {
    "rachartier/tiny-inline-diagnostic.nvim",
    -- enabled = false,
    event = "VeryLazy",
    priority = 1000,
    config = function()
        -- `virtual_text` is disabled globally in lua/core/diagnostic.lua
        require("tiny-inline-diagnostic").setup()
    end,
}
