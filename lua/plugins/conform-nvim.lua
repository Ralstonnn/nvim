return {
  { -- Autoformat
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { "prettierd", "eslint_d" },
        typescript = { "prettierd", "eslint_d" },
        vue = { "prettierd", "eslint_d" },
        css = { "prettierd", "eslint_d" },
        scss = { "prettierd", "eslint_d" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        sh = { "beautysh" },
        bash = { "beautysh" },
        proto = { "buf" },
        ["*"] = { "cspell" },
      },
    },
  },
}
