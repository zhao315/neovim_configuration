local cmp_state_ok, cmp = pcall(require, 'cmp')
if not cmp_state_ok then
    return
end 

local snip_state_ok, luasnip = pcall(require, 'luasnip')
if not snip_state_ok then
    return 
end 

require('luasnip.loaders.from_vscode').load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    -----------------------------------------------------------------
    mapping = {
        ['<esc>'] = cmp.mapping.abort(),
        ['<cr>'] = cmp.mapping.confirm({select = true}), 
        ['<c-j>'] = cmp.mapping.select_next_item(),
        ['<c-k>'] = cmp.mapping.select_prev_item(),
        ['<c-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), {'i', 'c'}),
        ['<c-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), {'i', 'c'}),
    },
    -----------------------------------------------------------------
    sources = {
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip'},
        {name = 'buffer'},
        {name = 'path'},
    },
    -----------------------------------------------------------------
    window = {
        documentation = {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        },
    },
        -----------------------------------------------------------------
    experimental = {
        ghost_text = true,
        native_menu = false
    },
})
 
