return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		config = function()
			local wk = require("which-key")

			local leader_prefix = {
				f = {
					name = "Find Files",
					f = { "Find File" },
					g = { "Live Grep" },
					b = { "Buffers" },
					h = { "Help Tags" },
					o = { "Open Oldfiles" },
				},
				g = {
					name = "Git And LSP",
					i = { "Lazy Git" },
					f = { "Format File" },
				},
				v = { "Vertical Split" },
				h = { "Horizontal Split" },
				e = { "Open Diagnostics Float" },
				k = { "Signature Help" },
				c = {
					name = "Code And AI",
					a = { "Code Actions" },
					o = {
						name = "Cody",
						o = { "Cody Chat Toggle" },
						t = { "Cody Task" },
						c = { "Cody New Chat" },
					},
				},
				r = {
					name = "Refactor",
					n = { "Rename" },
				},
				D = { "Type Definition" },
				t = {
					name = "Trouble",
					t = { "Trouble Toggle" },
					w = { "Trouble Toggle Workspace" },
					d = { "Trouble Document Diagnostics" },
					q = { "Trouble Quickfix" },
					l = { "Trouble Location List" },
				},
				["<F5>"] = { "UndoTree Toggle" },
			}

			local leader_prefix_visual = {
				c = {
					name = "Code And AI",
					a = { "Code Actions" },
					o = {
						name = "Cody",
						o = { "Cody Ask Selected Context" },
						t = { "Cody Task Selected Context" },
					},
				},
			}

			local g_prefix = {
				D = { "Declarations" },
				d = { "Definitions" },
				r = { "References" },
				i = { "Implementations" },
				R = { "Trouble LSP References" },
			}

			local b_prefix = {
				name = "Buffer",
				n = { "Next Buffer" },
				p = { "Previous Buffer" },
				k = { "Buffet Pick" },
				c = {
					name = "Buffer Close",
					k = { "Buffer Close Pick" },
					l = { "Buffer Close Left" },
					r = { "Buffer Close Right" },
					o = { "Buffer Close Others" },
				},
			}

			local open_bracket_prefix = {
				d = { "Diagnostics GoTo Next" },
				t = { "Netx Todo Comment" },
			}

			local close_bracket_prefix = {
				d = { "Diagnostics GoTo Prev" },
				t = { "Prev Todo Comment" },
			}

			local no_prefix = {
				K = { "LSP Hover" },
			}

			wk.register(leader_prefix, { prefix = "<leader>", mode = "n" })
			wk.register(leader_prefix_visual, { prefix = "<leader>", mode = "v" })
			wk.register(g_prefix, { prefix = "g", mode = "n" })
			wk.register(b_prefix, { prefix = "b", mode = "n" })
			wk.register(no_prefix, { mode = "n" })
		end,
	},
}
