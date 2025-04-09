return {
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").add({
				{ "<leader><F5>", group = "UndoTree" },
				{ "<leader>b", group = "[B]uffer" },
				{ "<leader>bc", group = "[B]uffer [C]lose" },
				{ "<leader>bm", group = "[B]ufferLine [M]ove" },
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>d", group = "[D]ebugger" },
				{ "<leader>du", group = "[D]ap UI" },
				{ "<leader>n", group = "[N]vim tree" },
				{ "<leader>g", group = "[G]it" },
				{ "<leader>h", group = "[H]arpoon" },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>sd", group = "[S]earch inside [D]irectory" },
				{ "<leader>S", group = "[S]essio" },
				{ "<leader>t", group = "[T]abs" },
				{ "<leader>w", group = "[W]orkspace" },
			})
		end,
	},
}
