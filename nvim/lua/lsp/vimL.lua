require 'lsp.config'.install_lsp_if_not_installed 'vim'
require 'lspconfig'.vimls.setup{
    on_attach = require 'lsp.config'.common_on_attach,
}
