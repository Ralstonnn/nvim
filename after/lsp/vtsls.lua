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
