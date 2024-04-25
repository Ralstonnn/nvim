local function getJdtlsPath()
	local mason_registry = require("mason-registry")
	local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()
	return jdtls_path
end

local config = {
	cmd = { getJdtlsPath() .. "/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

require("jdtls").start_or_attach(config)
