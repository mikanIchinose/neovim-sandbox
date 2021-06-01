require 'lsp.config'.install_lsp_if_not_installed 'kotlin'
require 'lspconfig'.kotlin_language_server.setup{
    on_attach = require 'lsp.config'.common_on_attach,
}
