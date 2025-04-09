local function getVueTsPluginPathFromMason()
	local mason_registry = require("mason-registry")
	local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
		.. "/node_modules/@vue/language-server"
	return vue_language_server_path
end

local function restartAllLsps()
	for _, client in pairs(vim.lsp.get_clients()) do
		vim.lsp.stop_client(client)
	end
	vim.cmd("edit")
end

local function onLspAttach(event)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end

	local telescope_builtin = require("telescope.builtin")

	-- map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	-- map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
	-- map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	-- map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

	map("gd", telescope_builtin.lsp_definitions, "[G]oto [D]efinition")
	map("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
	map("gI", telescope_builtin.lsp_implementations, "[G]oto [I]mplementation")
	map("<leader>D", telescope_builtin.lsp_type_definitions, "Type [D]efinition")
	-- map("<leader>ds", telescope_builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
	-- map("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	map("K", vim.lsp.buf.hover, "Hover Documentation")
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	map("<leader>lr", restartAllLsps, "[L]sp [R]estart")

	-- The following two autocommands are used to highlight references of the
	-- word under your cursor when your cursor rests there for a little while.
	--    See `:help CursorHold` for information about when this is executed
	--
	-- When you move your cursor, the highlights will be cleared (the second autocommand).
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.clear_references,
		})
	end

	-- -- The following autocommand is used to enable inlay hints in your
	-- -- code, if the language server you are using supports them
	-- --
	-- -- This may be unwanted, since they displace some of your code
	-- if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
	-- 	map("<leader>th", function()
	-- 		vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
	-- 	end, "[T]oggle Inlay [H]ints")
	-- end
end

return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Useful status updates for LSP.
			{ "j-hui/fidget.nvim", opts = {} },
			-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			{ "folke/neodev.nvim", opts = {} },
			-- NOTE: Plugin that gives function parameters hints
			{ "MysticalDevil/inlay-hints.nvim", opts = {} },
		},
		config = function()
			local lspconfig = require("lspconfig")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = onLspAttach,
			})

			-- Associate pcss files with css
			vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
				pattern = "*.pcss",
				command = "set filetype=css",
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- Set folding capabilities fror ufo
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				ts_ls = {
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = getVueTsPluginPathFromMason(),
								languages = { "vue" },
							},
						},
					},
					filetypes = {
						"typescript",
						"javascript",
						"javascriptreact",
						"typescriptreact",
						"vue",
					},
				},
				volar = {},
				svelte = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
				eslint = {},
				clangd = {
					apabilities = {
						offsetEncoding = { "utf-16" },
					},
				},
				cmake = {},
				cssls = {},
				bashls = {},
				emmet_ls = {},
				tailwindcss = {},
			}

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
				"prettierd",
				"clang-format",
				"jdtls",
				"java-debug-adapter",
				"beautysh",
				"cpptools", -- C, CPP, RUST DAP
				"eslint_d",
				"cspell",
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

						-- Skip jdtls setup it is managed by another plugin and handled in java.lua
						if server_name == "jdtls" then
							return
						end

						-- Setup language servers
						lspconfig[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
