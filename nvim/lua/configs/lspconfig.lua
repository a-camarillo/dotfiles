local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- go config
lspconfig.gopls.setup {
	capabilities = capabilities,
	filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
	settings = {
		gopls = {
			completeUnimported = true,
			staticcheck = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
}

-- python config
lspconfig.pyright.setup{
	capabilities = capabilities,
}

-- lua config
lspconfig.lua_ls.setup {
	capabilities = capabilities,
}

