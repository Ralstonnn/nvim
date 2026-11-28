-- Project overrides live in .conform.json at the Git root:
-- { "formatters_by_ft": { "lua": ["stylua"] },
--   "args": { "stylua": ["--indent-width", "2"] } }
local function load_config(bufnr)
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local path = filename ~= "" and vim.fs.dirname(filename) or vim.fn.getcwd()
  local result = vim.fn.systemlist({ "git", "-C", path, "rev-parse", "--show-toplevel" })
  if vim.v.shell_error ~= 0 or not result[1] then
    return nil
  end

  local config_path = vim.fs.joinpath(result[1], ".conform.json")
  if vim.fn.filereadable(config_path) == 0 then
    return nil
  end
  local ok, config = pcall(function()
    return vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))
  end)
  if ok and type(config) == "table" then
    for _, key in ipairs({ "formatters_by_ft", "args" }) do
      local values = config[key]
      if values ~= nil then
        if type(values) ~= "table" then
          ok = false
          break
        end
        for name, list in pairs(values) do
          if type(name) ~= "string" or type(list) ~= "table" or not vim.islist(list) then
            ok = false
            break
          end
          for _, value in ipairs(list) do
            if type(value) ~= "string" then
              ok = false
              break
            end
          end
        end
      end
    end
  else
    ok = false
  end
  if not ok then
    vim.notify("Invalid formatting configuration in " .. config_path, vim.log.levels.ERROR)
    return nil
  end
  return config
end

local function format(opts, callback)
  local conform = require("conform")
  opts = vim.deepcopy(opts or {})
  local bufnr = opts.bufnr
  if not bufnr or bufnr == 0 then
    bufnr = vim.api.nvim_get_current_buf()
  end
  local config = load_config(bufnr)
  if config then
    if not opts.formatters then
      -- Replace lists per filetype, retaining defaults for unspecified filetypes.
      local by_ft = vim.tbl_extend("force", conform.formatters_by_ft, config.formatters_by_ft or {})
      local ft = vim.bo[bufnr].filetype
      local candidates = { ft }
      local parts = vim.split(ft, ".", { plain = true })
      for i = #parts, 1, -1 do
        candidates[#candidates + 1] = parts[i]
      end
      candidates[#candidates + 1] = "_"
      opts.formatters = {}
      local function append(value)
        local names = type(value) == "function" and value(bufnr) or value or {}
        for _, name in ipairs(names) do
          if not vim.tbl_contains(opts.formatters, name) then
            opts.formatters[#opts.formatters + 1] = name
          end
        end
      end
      for _, candidate in ipairs(candidates) do
        local value = by_ft[candidate]
        if value and (type(value) == "function" or next(value) ~= nil) then
          append(value)
          break
        end
      end
      append(by_ft["*"])
    end

    -- Private inherited formatters keep project arguments out of global defaults.
    for i, name in ipairs(opts.formatters) do
      local args = (config.args or {})[name]
      if args then
        local alias = "project_" .. name .. "_" .. vim.fn.sha256(vim.json.encode(args))
        conform.formatters[alias] = { inherit = name, prepend_args = args }
        opts.formatters[i] = alias
      end
    end
  end
  return conform.format(opts, callback)
end

return {
  { -- Autoformat
    "stevearc/conform.nvim",
    lazy = false,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { "prettierd", "eslint_d" },
        typescript = { "prettierd", "eslint_d" },
        javascriptreact = { "prettierd", "eslint_d" },
        typescriptreact = { "prettierd", "eslint_d" },
        vue = { "prettierd", "eslint_d" },
        json = { "prettierd" },
        css = { "prettierd", "stylelint", "eslint_d" },
        scss = { "prettierd", "stylelint", "eslint_d" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        sh = { "beautysh" },
        bash = { "beautysh" },
        proto = { "buf" },
        kotlin = { "ktlint" },
        yaml = { "prettierd" },
        nix = { "nixfmt" }
      },
    },
    config = function(_, opts)
      local conform = require("conform")

      conform.setup(opts)

      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        format({
          lsp_format = "fallback",
          async = true,
          timeout_ms = 5000,
        })
      end, { desc = "Format current file with conform" })
    end,
  },
}
