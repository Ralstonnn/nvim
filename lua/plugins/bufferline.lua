return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			indicator = {
				style = "underline",
			},
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icons = {
					error = " ",
					warning = " ",
					info = " ",
					hint = " ",
				}
				local result = " "
				for k, v in pairs(diagnostics_dict) do
					local icon = icons[k] or ""
					result = result .. icon .. v .. " "
				end
				return result
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
		},
	},
}
