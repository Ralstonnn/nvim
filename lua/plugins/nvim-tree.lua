local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	-- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

return {
	"nvim-tree/nvim-tree.lua",
	dependecies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true

		vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { desc = "Nvim-Tree Toggle" })
		vim.keymap.set("n", "<leader>nc", ":NvimTreeCollapse<CR>", { desc = "Nvim-Tree Collapse" })

		-- OR setup with some options
		require("nvim-tree").setup({
			-- sort = {
			-- 	sorter = "case_sensitive",
			-- },
			view = {
				width = 45,
				relativenumber = true,
			},
			-- renderer = {
			-- 	group_empty = true,
			-- },
			filters = {
				git_ignored = false,
			},
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "▼",
							arrow_open = "▲",
						},
					},
				},
			},
			on_attach = on_attach,
		})
	end,
}
