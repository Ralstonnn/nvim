return {
--	{
--    "yorik1984/newpaper.nvim",
--    priority = 1000,
--    config = true,
--		opts = {
--			style = "dark"
--		}
--	},
--	{ 
--		"ellisonleao/gruvbox.nvim", 
--		priority = 1000, 
--    config = function ()
--			vim.o.background = "dark" -- or "light" for light mode
--			vim.cmd.colorscheme "gruvbox"
--		end,
--	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
    config = function ()
			vim.cmd.colorscheme "catppuccin"
		end,
	}
}
