local function enableServers(servers)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- Set folding capabilities for ufo
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  -- NOTE: Uncomment if move back to nvim-cmp
  -- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
  capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

  local excludedServers = {
    jdtls = true,
  }

  -- Add servers to vim.lsp.config
  for server_name, config in pairs(servers) do
    local server_settings = config or {}
    -- This handles overriding only values explicitly passed
    -- by the server configuration above. Useful when disabling
    -- certain features of an LSP (for example, turning off formatting for tsserver)
    server_settings.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_settings.capabilities or {})
    -- Setup language servers
    vim.lsp.config[server_name] = server_settings

    if not excludedServers[server_name] then
      vim.lsp.enable(server_name)
    end
  end
end

local function getVueTsPluginPathFromMason()
  local mason_path = vim.fn.stdpath("data") .. "/mason" -- Expands to full Mason directory
  local pkg_name = "vue-language-server" -- Replace with your package name

  -- Construct the full path
  local path = mason_path .. "/packages/" .. pkg_name .. "/node_modules/@vue/language-server"
  if vim.fn.isdirectory(path) == 1 then
    return path
  else
    return ""
  end
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
  map("<leader>ld", telescope_builtin.lsp_type_definitions, "Type Definition")
  map("<leader>lee", "<cmd>Trouble diagnostics toggle<CR>", "Show Diagnostic [E]rror Messages")
  map(
    "<leader>leb",
    "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
    "Show Diagnostic [E]rror Messages Current Buffer"
  )
  map("<leader>ls", "<cmd>Trouble symbols toggle focus=false<CR>", "Symbols (Trouble)")
  map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  map("K", vim.lsp.buf.hover, "Hover Documentation")
  map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  map("<leader>lr", "<cmd>LspRestart<CR>", "[L]sp [R]estart")

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
    "mason-org/mason.nvim",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },
      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { "folke/neodev.nvim", opts = {} },
      -- NOTE: Plugin that gives function parameters hints
      { "MysticalDevil/inlay-hints.nvim", opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = onLspAttach,
      })

      -- Associate pcss files with css
      vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = "*.pcss",
        command = "set filetype=css",
      })

      local servers = {
        -- ts_ls = {
        --   init_options = {
        --     plugins = {
        --       {
        --         name = "@vue/typescript-plugin",
        --         location = getVueTsPluginPathFromMason(),
        --         languages = { "vue" },
        --       },
        --     },
        --   },
        --   filetypes = {
        --     "typescript",
        --     "javascript",
        --     "javascriptreact",
        --     "typescriptreact",
        --     "vue",
        --   },
        -- },
        -- NOTE: Last working version was 3.0.1 with next major update vue 2 support will be dropped
        vue_ls = {},
        vtsls = {
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = getVueTsPluginPathFromMason(),
                    languages = { "vue" },
                    configNamespace = "typescript",
                  },
                },
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
          filetypes = {
            "c",
            "cpp",
            "cmake",
            "make",
          },
        },
        cmake = {},
        cssls = {},
        bashls = {},
        emmet_ls = {},
        tailwindcss = {},
        buf = {},
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
        -- automatic_enable = {
        --   exclude = {
        --     "jdtls",
        --   },
        -- },
      })

      enableServers(servers)
    end,
  },
}
