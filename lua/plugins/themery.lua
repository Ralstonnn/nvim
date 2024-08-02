return {
	{
		"zaldih/themery.nvim",
		config = function()
			require("themery").setup({
				themes = {
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
					{
						name = "Rose Pine Dark",
						colorscheme = "rose-pine",
					},
					{
						name = "Catppuccin Mocha",
						colorscheme = "catppuccin",
						after = [[
							require("catppuccin").setup({
								flavour = "mocha",
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
						name = "One Dark Deep",
						colorscheme = "onedark",
						before = [[
							require('onedark').setup({
							    style = "deep"
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
							    style = "Day"
							})
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
}
