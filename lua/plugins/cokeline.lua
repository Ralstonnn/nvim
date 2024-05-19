return {
	{
		{
			"willothy/nvim-cokeline",
			dependencies = {
				"nvim-lua/plenary.nvim", -- Required for v0.4.0+
				"nvim-tree/nvim-web-devicons", -- If you want devicons
				"stevearc/resession.nvim", -- Optional, for persistent history
			},
			-- config = true,
			config = function()
				local cokeline = require("cokeline")

				local get_hex = require("cokeline.hlgroups").get_hl_attr
				local red = vim.g.terminal_color_1
				local yellow = vim.g.terminal_color_3

				local map = vim.api.nvim_set_keymap
				local is_picking_focus = require("cokeline.mappings").is_picking_focus
				local is_picking_close = require("cokeline.mappings").is_picking_close

				map("n", "<leader>bp", "<Plug>(cokeline-focus-prev)", { silent = true })
				map("n", "<leader>bn", "<Plug>(cokeline-focus-next)", { silent = true })
				map("n", "<leader>bmp", "<Plug>(cokeline-switch-prev)", { silent = true })
				map("n", "<leader>bmn", "<Plug>(cokeline-switch-next)", { silent = true })
				map("n", "<leader>bff", "<Plug>(cokeline-pick-focus)", { silent = true })
				map("n", "<leader>bcc", "<Plug>(cokeline-pick-close)", { silent = true })

				for i = 1, 9 do
					map("n", ("<leader>bf%s"):format(i), ("<Plug>(cokeline-focus-%s)"):format(i), { silent = true })
					map("n", ("<leader>bs%s"):format(i), ("<Plug>(cokeline-switch-%s)"):format(i), { silent = true })
				end

				cokeline.setup({
					default_hl = {
						fg = function(buffer)
							return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
						end,
						bg = function()
							return get_hex("ColorColumn", "bg")
						end,
					},

					components = {
						{
							text = function(buffer)
								return (buffer.index ~= 1) and "▏" or ""
							end,
						},
						{
							text = "  ",
						},
						{
							text = function(buffer)
								return (is_picking_focus() or is_picking_close()) and buffer.pick_letter .. " "
									or buffer.devicon.icon
							end,
							fg = function(buffer)
								return (is_picking_focus() and yellow)
									or (is_picking_close() and red)
									or buffer.devicon.color
							end,
							italic = function()
								return (is_picking_focus() or is_picking_close())
							end,
							bold = function()
								return (is_picking_focus() or is_picking_close())
							end,
						},
						{
							text = " ",
						},
						{
							text = function(buffer)
								return buffer.filename .. " "
							end,
							bold = function(buffer)
								return buffer.is_focused
							end,
						},
						{
							text = "× ",
							on_click = function(_, _, _, _, buffer)
								buffer:delete()
							end,
						},
						{
							text = "  ",
						},
					},
				})
			end,
		},
	},
}
