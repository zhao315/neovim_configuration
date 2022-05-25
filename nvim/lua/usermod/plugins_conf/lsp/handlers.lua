local M = {}

-- TODO: backfill this to template
M.setup = function()
    local config = {
        -- disable  virtual text
        virtual_text = false,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'border',
            source = 'always',
            header = '',
            prefix = ''

        },
    }

    vim.diagnostic.config(config)
    vim.lsp.handlers['textDcoument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover, {border='rounded'}
    )
    vim.lsp.handlers['textDcoument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {border='rounded'}
    )
end

local function lsp_highlight_document(client)
    -- set autocommands conditional on server-capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
                augroup lsp_documment_highlight
                    autocmd! * <buffer>
                    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd CUrsorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]],
            false
        )
    end
end


local function lsp_keymaps(bufnr)
    local opts = {noremap=true, silent=true}
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gk', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev({border="rounded"})<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float({border="rounded"})<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({border="rounded"})<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<cr>', opts)
    vim.cmd [[command! Format execute 'lua vim.lsp.buf.formatting()']]
end

M.on_attach = function(client, bufnr)
    if client.name == 'tsserver' then
        client.server_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local state_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not state_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M







