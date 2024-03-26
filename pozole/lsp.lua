local lspconfig = require 'lspconfig'
local capabilities = require'cmp_nvim_lsp'.default_capabilities()

lspconfig.gopls.setup {
    capabilities = capabilities,
    filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
    settings = {
        gopls = {
            completeUnimported = true,
            staticcheck = true,
            usePlaceholders = true,
            analyses = {unusedparams = true}
        }
    }
} 
-- python config
lspconfig.pyright.setup {capabilities = capabilities}
-- lua config
lspconfig.lua_ls.setup {capabilities = capabilities}
-- js/ts config
lspconfig.tsserver.setup {capabilities = capabilities}
lspconfig.clangd.setup {capabilities = capabilities}
lspconfig.arduino_language_server.setup {
    cmd = {
        "arduino-language-server", "-cli-config",
        "/home/anthony/.config/.arduino15/arduino-cli.yaml", "-fqbn",
        "arduino:avr:uno", "-log"
    }
}
lspconfig.astro.setup {capabilities = capabilities}
lspconfig.rust_analyzer.setup {
    settings = {['rust_analyzer'] = {diagnostics = {enable = false}}},
    capabilities = capabilities
}

