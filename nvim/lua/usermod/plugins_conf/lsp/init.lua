local state_ok, lsp = pcall(require, 'lspconfig')
if not state_ok then
    return 
end 


require('usermod.plugins_conf.lsp.lsp_installer')
require('usermod.plugins_conf.lsp.handlers').setup()

