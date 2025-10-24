return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
      }
    },
    config = function()
      -- Install LSPs
      require("mason-lspconfig").setup({
        ensure_installed = {
          "vue_ls", -- NOTE: Last working version was 3.0.1 with next major update vue 2 support will be dropped
          "vtsls",
          "svelte",
          "lua_ls",
          "eslint",
          "clangd",
          "cmake",
          "cssls",
          "bashls",
          "emmet_ls",
          "tailwindcss",
          "kotlin_language_server",
        }
      })

      -- Install formatters, linters, etc..
      require("mason-tool-installer").setup({
        ensure_installed = {
          "buf",
          "stylua", -- Used to format Lua code
          "prettierd",
          "clang-format",
          "jdtls",
          "java-debug-adapter",
          "beautysh",
          "cpptools", -- C, CPP, RUST DAP
          "eslint_d",
          "cspell",
          "ktfmt",
          "ktlint",
        };
      })
    end,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  },
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
