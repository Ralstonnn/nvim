local function getJdtlsPath()
  local mason_registry = require("mason-registry")
  local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()
  return jdtls_path
end

local function getDebuggerPath()
  local mason_registry = require("mason-registry")
  local debugger = mason_registry.get_package("java-debug-adapter"):get_install_path()
  return debugger
end

local config = {
  cmd = { getJdtlsPath() .. "/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  init_options = {
    bundles = {
      vim.fn.glob(getDebuggerPath() .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
    },
  },
}

require("jdtls").start_or_attach(config)
