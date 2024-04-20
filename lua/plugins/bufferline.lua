return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			local bufferline = require("bufferline")

			vim.keymap.set("n", "<leader>b1", ":BufferLineGoToBuffer 1<CR>", { desc = "[B]ufferLineGoToBuffer [1]" })
			vim.keymap.set("n", "<leader>b2", ":BufferLineGoToBuffer 2<CR>", { desc = "[B]ufferLineGoToBuffer [2]" })
			vim.keymap.set("n", "<leader>b3", ":BufferLineGoToBuffer 3<CR>", { desc = "[B]ufferLineGoToBuffer [3]" })
			vim.keymap.set("n", "<leader>b4", ":BufferLineGoToBuffer 4<CR>", { desc = "[B]ufferLineGoToBuffer [4]" })
			vim.keymap.set("n", "<leader>b5", ":BufferLineGoToBuffer 5<CR>", { desc = "[B]ufferLineGoToBuffer [5]" })
			vim.keymap.set("n", "<leader>b6", ":BufferLineGoToBuffer 6<CR>", { desc = "[B]ufferLineGoToBuffer [6]" })
			vim.keymap.set("n", "<leader>b7", ":BufferLineGoToBuffer 7<CR>", { desc = "[B]ufferLineGoToBuffer [7]" })
			vim.keymap.set("n", "<leader>b8", ":BufferLineGoToBuffer 8<CR>", { desc = "[B]ufferLineGoToBuffer [8]" })
			vim.keymap.set("n", "<leader>b9", ":BufferLineGoToBuffer 9<CR>", { desc = "[B]ufferLineGoToBuffer [9]" })

			vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "[B]ufferLine [N]ext" })
			vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "[B]ufferLine [P]revoius" })
			vim.keymap.set("n", "<leader>bk", ":BufferLinePick<CR>", { desc = "[B]ufferLine Pic[k]" })
			vim.keymap.set("n", "<leader>btp", ":BufferLineTogglePin<CR>", { desc = "[B]ufferLine [T]oggle [P]in" })
			vim.keymap.set("n", "<leader>bck", ":BufferLinePickClose<CR>", { desc = "[B]ufferLine [C]lose Pic[k]" })
			vim.keymap.set("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", { desc = "[B]ufferLine [C]lose [L]elft" })
			vim.keymap.set("n", "<leader>bcr", ":BufferLineCloseRight<CR>", { desc = "[B]ufferLine [C]lose [R]ight" })
			vim.keymap.set("n", "<leader>bco", ":BufferLineCloseOthers<CR>", { desc = "[B]ufferLine [C]lose [O]thers" })

			bufferline.setup({
				options = {
					numbers = "ordinal",
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local s = " "
						for e, n in pairs(diagnostics_dict) do
							local sym = e == "error" and " " or (e == "warning" and " " or "")
							s = s .. n .. sym
						end
						return s
					end,

					separator_style = "slant",
					-- indicator = { style = "underline" },

					get_element_icon = function(element)
						if not vim.g.have_nerd_font then
							return
						end

						local icon, hl =
							require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
						return icon, hl
					end,
				},
			})
		end,
	},
}
