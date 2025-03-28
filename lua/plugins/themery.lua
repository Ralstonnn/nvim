return {
	{
		"zaldih/themery.nvim",
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
							vim.g.gruvbox_material_foreground = "original"
						]],
					},
					{
						name = "Gruvbox Material Dark",
						colorscheme = "gruvbox-material",
						before = [[
							vim.g.gruvbox_material_foreground = "material"
						]],
					},
					{
						name = "Gruvbox Mix Dark",
						colorscheme = "gruvbox-material",
						before = [[
							vim.g.gruvbox_material_foreground = "mix"
						]],
					},

					-- ********************************************************************************
					-- ROSE PINE
					-- ********************************************************************************
					{
						name = "Rose Pine Dark",
						colorscheme = "rose-pine",
					},

					-- ********************************************************************************
					-- CATPPUCCIN
					-- ********************************************************************************
					{
						name = "Catppuccin Mocha",
						colorscheme = "catppuccin",
						before = [[
							require("catppuccin").setup({
								flavour = "mocha",
								})
							]],
					},
					{
						name = "Catppuccin Transparent",
						colorscheme = "catppuccin",
						before = [[
							require("catppuccin").setup({
								flavour = "mocha",
								transparent_background = true,
								})
							]],
					},

					-- ********************************************************************************
					-- ONE DARK PRO
					-- ********************************************************************************
					{
						name = "One Dark Pro Light",
						colorscheme = "onelight",
						before = [[
							require('onedarkpro').setup({})
						]],
					},
					{
						name = "One Dark Pro",
						colorscheme = "onedark",
						before = [[
							require('onedarkpro').setup({})
						]],
					},
					{
						name = "One Dark Pro Vivid",
						colorscheme = "onedark_vivid",
						before = [[
							require('onedarkpro').setup({})
						]],
					},
					{
						name = "One Dark Pro Dark",
						colorscheme = "onedark_dark",
						before = [[
							require('onedarkpro').setup({})
						]],
					},

					-- ********************************************************************************
					-- ONE DARK
					-- ********************************************************************************
					-- {
					-- 	name = "One Dark Warm",
					-- 	colorscheme = "onedark",
					-- 	before = [[
					-- 		require('onedark').setup({
					-- 		    style = "warm"
					-- 		})
					-- 	]],
					-- },
					-- {
					-- 	name = "One Dark Warmer",
					-- 	colorscheme = "onedark",
					-- 	before = [[
					-- 		require('onedark').setup({
					-- 		    style = "warmer"
					-- 		})
					-- 	]],
					-- },
					-- {
					-- 	name = "One Dark Cool",
					-- 	colorscheme = "onedark",
					-- 	before = [[
					-- 		require('onedark').setup({
					-- 		    style = "cool"
					-- 		})
					-- 	]],
					-- },
					-- {
					-- 	name = "One Dark Deep",
					-- 	colorscheme = "onedark",
					-- 	before = [[
					-- 		require('onedark').setup({
					-- 		    style = "deep"
					-- 		})
					-- 	]],
					-- },
					-- {
					-- 	name = "One Dark Dark",
					-- 	colorscheme = "onedark",
					-- 	before = [[
					-- 		require('onedark').setup({
					-- 		    style = "dark"
					-- 		})
					-- 	]],
					-- },
					-- {
					-- 	name = "One Dark Darker",
					-- 	colorscheme = "onedark",
					-- 	before = [[
					-- 		require('onedark').setup({
					-- 		    style = "darker"
					-- 		})
					-- 	]],
					-- },

					-- ********************************************************************************
					-- TOKYO NIGHT
					-- ********************************************************************************
					{
						name = "Tokyo Night Night",
						colorscheme = "tokyonight",
						before = [[
							require('tokyonight').setup({
							    style = "night"
							})
						]],
					},
					{
						name = "Tokyo Night Storm",
						colorscheme = "tokyonight",
						before = [[
							require('tokyonight').setup({
							    style = "storm"
							})
						]],
					},
					{
						name = "Tokyo Night Moon",
						colorscheme = "tokyonight",
						before = [[
							require('tokyonight').setup({
							    style = "moon"
							})
						]],
					},
					{
						name = "Tokyo Night Day",
						colorscheme = "tokyonight",
						before = [[
							require('tokyonight').setup({
							    style = "day"
							})
						]],
					},
				}, -- Your list of installed colorschemes.
				livePreview = true, -- Apply theme while picking. Default to true.
			})
		end,
	},
	"folke/tokyonight.nvim",
	-- "navarasu/onedark.nvim",
	"olimorris/onedarkpro.nvim",
	"sainnhe/gruvbox-material",
	"rose-pine/neovim",
	"catppuccin/nvim",
}
