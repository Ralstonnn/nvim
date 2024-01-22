return {
	{
		"williamboman/mason.nvim",
		config = true
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = true,
		opts = {
			ensure_installed = {
				"lua_ls",
				"clangd",
				"cmake",
				"cssls",
				"cssmodules_ls",
				"dockerls",
				"docker_compose_language_service",
				"eslint",
				-- "emmet_ls",
				"html",
				"jdtls",
				"jsonls",
				"tsserver",
				"tailwindcss",
				"volar"
			},
			automatic_installation = true
		}
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local home = os.getenv('HOME')

			local empty_setup_servers = {
				"clangd",
				"cmake",
				"cssls",
				"cssmodules_ls",
				"docker_compose_language_service",
				"dockerls",
				-- "emmet_ls",
				"html",
				"jsonls",
				"tailwindcss",
				"tsserver"
			}

			for _, lsp in ipairs(empty_setup_servers) do
				lspconfig[lsp].setup({
					-- on_attach = my_custom_on_attach,
					-- capabilities = capabilities,
				})
			end

			lspconfig.eslint.setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end
			})

			lspconfig.lua_ls.setup({
				on_init = function(client)
					local path = client.workspace_folders[1].name
					if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
						client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
							Lua = {
								runtime = {
									-- Tell the language server which version of Lua you're using
									-- (most likely LuaJIT in the case of Neovim)
									version = 'LuaJIT'
								},
								-- Make the server aware of Neovim runtime files
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME
										-- "${3rd}/luv/library"
										-- "${3rd}/busted/library",
									}
									-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
									-- library = vim.api.nvim_get_runtime_file("", true)
								}
							}
						})

						client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
					end
					return true
				end
			})

			-------------------------------------------------------------------
			-- Get typescript local or take global version volar
			-------------------------------------------------------------------
			local util = require 'lspconfig.util'
			local function get_typescript_server_path(root_dir)
				local global_ts = home .. '/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib'
				local found_ts = ''
				local function check_dir(path)
					found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
					if util.path.exists(found_ts) then
						return path
					end
				end
				if util.search_ancestors(root_dir, check_dir) then
					return found_ts
				else
					return global_ts
				end
			end

			lspconfig.volar.setup({
				filetypes = { 'vue' },
				on_new_config = function(new_config, new_root_dir)
					new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
				end,
			})
			-------------------------------------------------------------------

			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
					vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, {})
					vim.keymap.set('n', '<space>f', function()
						vim.lsp.buf.format { async = true }
					end, {})
					vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
					vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {})
				end
			})
		end
	}
}
