local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local function setup(servers)
  for _, server in ipairs(servers) do
    lspconfig[server].setup({
      on_attach = on_attach,
      capabilities = capabilities
    })
  end
end

local servers = {
  "astro",
  "tsserver",
  "cssls",
  "html",
  "tailwindcss",
  "clangd",
  "volar"
}

setup(servers)

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities, capabilities,
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
})
