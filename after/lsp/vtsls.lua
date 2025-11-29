local function getVueTsPluginPathFromMason()
  local mason_root = vim.fs.joinpath(vim.fn.stdpath("data"), "mason") -- Expands to full Mason directory
  local pkg_name = "vue-language-server" -- Replace with your package name

  -- Construct the full path
  local server_path = vim.fs.joinpath(mason_root, "packages", pkg_name, "node_modules", "@vue", "language-server")

  if vim.fn.isdirectory(server_path) == 1 then
    return server_path
  else
    return ""
  end
end

return {
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
}
