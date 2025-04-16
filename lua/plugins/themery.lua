return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("themery").setup({
        themes = {
          -- ********************************************************************************
          -- GRUVBOX
          -- ********************************************************************************
          {
            name = "Gruvbox Original Dark",
            colorscheme = "gruvbox-material",
            before = [[
              vim.opt.background = "dark"
              vim.g.gruvbox_material_foreground = "original"
            ]],
          },
          {
            name = "Gruvbox Material Dark",
            colorscheme = "gruvbox-material",
            before = [[
              vim.opt.background = "dark"
              vim.g.gruvbox_material_foreground = "material"
            ]],
          },
          {
            name = "Gruvbox Mix Dark",
            colorscheme = "gruvbox-material",
            before = [[
              vim.opt.background = "dark"
              vim.g.gruvbox_material_foreground = "mix"
            ]],
          },

          -- ********************************************************************************
          -- ROSE PINE
          -- ********************************************************************************
          {
            name = "Rose Pine",
            colorscheme = "rose-pine-main",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Rose Pine Moon",
            colorscheme = "rose-pine-moon",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Rose Pine Dawn",
            colorscheme = "rose-pine-dawn",
            before = [[
              vim.opt.background = "light"
            ]],
          },

          -- ********************************************************************************
          -- CATPPUCCIN
          -- ********************************************************************************
          {
            name = "Catppuccin Mocha",
            colorscheme = "catppuccin",
            before = [[
              vim.opt.background = "dark"
              require("catppuccin").setup({
                flavour = "mocha",
              })
            ]],
          },
          {
            name = "Catppuccin Transparent",
            colorscheme = "catppuccin",
            before = [[
              vim.opt.background = "dark"
              require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
              })
            ]],
          },

          -- ********************************************************************************
          -- ONE DARK
          -- ********************************************************************************
          {
            name = "One Dark Warm",
            colorscheme = "onedark",
            before = [[
          		require('onedark').setup({
          		    style = "warm"
          		})
          	]],
          },
          {
            name = "One Dark Warmer",
            colorscheme = "onedark",
            before = [[
          		require('onedark').setup({
          		    style = "warmer"
          		})
          	]],
          },
          {
            name = "One Dark Cool",
            colorscheme = "onedark",
            before = [[
          		require('onedark').setup({
          		    style = "cool"
          		})
          	]],
          },
          {
            name = "One Dark Deep",
            colorscheme = "onedark",
            before = [[
          		require('onedark').setup({
          		    style = "deep"
          		})
          	]],
          },
          {
            name = "One Dark Dark",
            colorscheme = "onedark",
            before = [[
          		require('onedark').setup({
          		    style = "dark"
          		})
          	]],
          },
          {
            name = "One Dark Darker",
            colorscheme = "onedark",
            before = [[
          		require('onedark').setup({
          		    style = "darker"
          		})
          	]],
          },

          -- ********************************************************************************
          -- TOKYO NIGHT
          -- ********************************************************************************
          {
            name = "Tokyo Night Night",
            colorscheme = "tokyonight",
            before = [[
              vim.opt.background = "dark"
              require('tokyonight').setup({
                style = "night"
              })
            ]],
          },
          {
            name = "Tokyo Night Storm",
            colorscheme = "tokyonight",
            before = [[
              vim.opt.background = "dark"
              require('tokyonight').setup({
                style = "storm"
              })
            ]],
          },
          {
            name = "Tokyo Night Moon",
            colorscheme = "tokyonight",
            before = [[
              vim.opt.background = "dark"
              require('tokyonight').setup({
                style = "moon"
              })
            ]],
          },
          {
            name = "Tokyo Night Day",
            colorscheme = "tokyonight",
            before = [[
              vim.opt.background = "light"
              require('tokyonight').setup({
                style = "day"
              })
            ]],
          },

          -- ********************************************************************************
          -- OXOCARBON
          -- ********************************************************************************
          {
            name = "Oxocarbon",
            colorscheme = "oxocarbon",
            before = [[
              vim.opt.background = "dark"
            ]],
          },

          -- ********************************************************************************
          -- NIGHTFOX
          -- ********************************************************************************
          {
            name = "Nightfox",
            colorscheme = "nightfox",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Dayfox",
            colorscheme = "dayfox",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Dawnfox",
            colorscheme = "dawnfox",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Duskfox",
            colorscheme = "duskfox",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Nordfox",
            colorscheme = "nordfox",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Terafox",
            colorscheme = "terafox",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Carbonfox",
            colorscheme = "carbonfox",
            before = [[
              vim.opt.background = "dark"
            ]],
          },

          -- ********************************************************************************
          -- NORD
          -- ********************************************************************************
          {
            name = "Nord",
            colorscheme = "nord",
            before = [[
              vim.opt.background = "dark"
            ]],
          },

          -- ********************************************************************************
          -- KANAGAWA
          -- ********************************************************************************
          {
            name = "Kanagawa Wave",
            colorscheme = "kanagawa-wave",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Kanagawa Dragon",
            colorscheme = "kanagawa-dragon",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Kanagawa Lotus",
            colorscheme = "kanagawa-lotus",
            before = [[
              vim.opt.background = "light"
            ]],
          },
        }, -- Your list of installed colorschemes.
        livePreview = true, -- Apply theme while picking. Default to true.
      })
    end,
  },
  "folke/tokyonight.nvim",
  "navarasu/onedark.nvim",
  "sainnhe/gruvbox-material",
  "rose-pine/neovim",
  "catppuccin/nvim",
  "EdenEast/nightfox.nvim",
  "gbprod/nord.nvim",
  "rebelot/kanagawa.nvim",
  "nyoom-engineering/oxocarbon.nvim",
}
