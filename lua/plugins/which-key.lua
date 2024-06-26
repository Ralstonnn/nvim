return {
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
				["<leader>h"] = { name = "[H]arpoon", _ = "which_key_ignore" },
				["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
				["<leader>b"] = { name = "[B]uffer", _ = "which_key_ignore" },
				["<leader>bc"] = { name = "[B]uffer [C]lose", _ = "which_key_ignore" },
				["<leader>bm"] = { name = "[B]ufferLine [M]ove", _ = "which_key_ignore" },
				["<leader><F5>"] = { name = "UndoTree", _ = "which_key_ignore" },
			})
		end,
	},
}
