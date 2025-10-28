local function getJdtlsPath()
  return vim.fn.stdpath("data") .. "/mason/packages/jdtls"
end

local function getDebuggerPath()
  return vim.fn.stdpath("data") .. "/mason/packages/java-debug-adapter"
end

return {
  filetypes = { "java" },
  cmd = { getJdtlsPath() .. "/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  init_options = {
    bundles = {
      vim.fn.glob(getDebuggerPath() .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
    },
  },
}
