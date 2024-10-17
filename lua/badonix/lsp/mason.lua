local servers = {
	"lua_ls",
	"jsonls",
	"gopls",
	"pyright",
	"tailwindcss",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("badonix.lsp.handlers").on_attach,
		capabilities = require("badonix.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "badonix.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
lspconfig.ts_ls.setup({
	on_attach = require("badonix.lsp.handlers").on_attach,
	capabilities = require("badonix.lsp.handlers").capabilities,
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
	filetypes = { "typescript", "javascript", "typescriptreact", "javascript.jsx", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
})
