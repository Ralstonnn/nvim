return {
	-- {
	-- 	"yorik1984/newpaper.nvim",
	-- 	priority = 1000,
	-- 	config = true,
	-- 	opts = {
	-- 		style = "dark"
	-- 	}
	-- },
	-- { 
	-- 	"ellisonleao/gruvbox.nvim", 
	-- 	priority = 1000, 
	-- 	config = function ()
	-- 		vim.o.background = "dark" -- or "light" for light mode
	-- 		vim.cmd.colorscheme "gruvbox"
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function ()
			local catppuccin = require("catppuccin")
			catppuccin.setup({
				flavour = "mocha"
			})
			vim.cmd.colorscheme "catppuccin"
		end,
	},
	-- {
	-- 	"baliestri/aura-theme",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function(plugin)
	-- 		vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
	-- 		vim.cmd([[colorscheme aura-dark]])
	-- 	end
	-- },
	-- {
	-- 	{
	-- 		{
	-- 			'kepano/flexoki-neovim',
	-- 			name = 'flexoki',
	-- 			config = function ()
	-- 				vim.cmd('colorscheme flexoki-dark')
	-- 				-- vim.cmd('colorscheme flexoki-light')
	-- 			end
	-- 		}
	-- 	}
	-- }
}
