local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local function setup(servers)
	for _, server in ipairs(servers) do
		lspconfig[server].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end
end

local servers = {
	"astro",
	"cssls",
	"html",
	"tailwindcss",
	"clangd",
	"volar",
	"gleam",
}

setup(servers)

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

lspconfig.elixirls.setup({
	cmd = { "/usr/bin/elixir-ls" },
})

lspconfig.tsserver.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/home/tracel/.bun/install/global/node_modules/@vue/typescript-plugin",
				-- If .vue file cannot be recognized in either js or ts file try to add `typescript` and `javascript` in languages table.
				languages = { "vue" },
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
