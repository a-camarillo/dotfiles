local lspconfig = require('lspconfig')

-- go config
lspconfig.gopls.setup {
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
}

-- lua config
lspconfig.lua_ls.setup {
}

