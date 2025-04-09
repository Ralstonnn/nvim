return {
	"stevearc/overseer.nvim",
	config = function()
		local overseer = require("overseer")

		vim.keymap.set("n", "<leader>or", overseer.run_template, { desc = "[O]verseer [R]un" })
		vim.keymap.set("n", "<leader>ot", overseer.toggle, { desc = "[O]verseer [T]oggle" })

		overseer.setup()
	end,
}
