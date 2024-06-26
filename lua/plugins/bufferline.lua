return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			local bufferline = require("bufferline")

			for i = 1, 9 do -- The range includes both ends.
				vim.keymap.set(
					"n",
					"<leader>b" .. i,
					":BufferLineGoToBuffer " .. i .. "<CR>",
					{ desc = "[B]ufferLineGoToBuffer [" .. i .. "]" }
				)
			end

			vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "[B]ufferLine [N]ext" })
			vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "[B]ufferLine [P]revoius" })
			vim.keymap.set("n", "<leader>bk", ":BufferLinePick<CR>", { desc = "[B]ufferLine Pic[k]" })
			vim.keymap.set("n", "<leader>btp", ":BufferLineTogglePin<CR>", { desc = "[B]ufferLine [T]oggle [P]in" })
			vim.keymap.set("n", "<leader>bmn", ":BufferLineMoveNext<CR>", { desc = "[B]ufferLine [M]ove [N]ext" })
			vim.keymap.set("n", "<leader>bmp", ":BufferLineMovePrev<CR>", { desc = "[B]ufferLine [M]ove [P]revious" })
			vim.keymap.set("n", "<leader>bck", ":BufferLinePickClose<CR>", { desc = "[B]ufferLine [C]lose Pic[k]" })
			vim.keymap.set("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", { desc = "[B]ufferLine [C]lose [L]elft" })
			vim.keymap.set("n", "<leader>bcr", ":BufferLineCloseRight<CR>", { desc = "[B]ufferLine [C]lose [R]ight" })
			-- vim.keymap.set("n", "<leader>bco", ":BufferLineCloseOthers<CR>", { desc = "[B]ufferLine [C]lose [O]thers" })

			bufferline.setup({
				options = {
					numbers = "ordinal",
					-- diagnostics = "nvim_lsp",
					-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
					-- 	local s = " "
					-- 	for e, n in pairs(diagnostics_dict) do
					-- 		local sym = e == "error" and " " or (e == "warning" and " " or "")
					-- 		s = s .. n .. sym
					-- 	end
					-- 	return s
					-- end,
					separator_style = "slant",
					-- indicator = { style = "underline" },
					-- mode = "tabs",
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
