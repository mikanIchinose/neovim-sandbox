local function documentHighlight(client, bufnr)
    if client.resolved_capabilities.document_highlight then
        vim.cmd(
            [[
              hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
              hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
              hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
              augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]],
            false
        )
    end
end

local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    documentHighlight(client, bufnr)
end

function lsp_config.install_lsp_if_not_installed(lang)
    local root_path = vim.fn.stdpath('data') .. '/lspinstall/' .. lang
    if vim.fn.empty(vim.fn.glob(root_path)) > 0 then
        require'lspinstall'.install_server(lang)
    end
end

return lsp_config

