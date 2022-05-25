local state_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not state_ok then
    return
end

-- register a handler  that will be called for all installed servers
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require('usermod.plugins_conf.lsp.handlers').on_attach,
        capabilities = require('usermod.plugins_conf.lsp.handlers').capabilities,
    }

    if server.name == 'sumneko_lua' then
        local sumneko_opts = require('usermod.plugins_conf.lsp.server_conf.sumneko_lua')
        opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end

    if server.name == 'pyright' then
        local pyright_opts = require('usermod.plugins_conf.lsp.server_conf.pyright')
        opts = vim.tbl_deep_extend('force', pyright_opts, opts)
    end

    server:setup(opts)
end)
