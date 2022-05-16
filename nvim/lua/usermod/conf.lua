-- :help options
local set = vim.opt


set.relativenumber = true
set.number = true
vim.cmd [[
    augroup relative_number
        autocmd InsertEnter * : set norelativenumber
        autocmd InsertLeave * : set relativenumber
    augroup END
]]

set.ignorecase = true
set.smartcase = true

set.cursorline = true
set.showmatch = true
set.incsearch = true
set.showmode = false

set.splitbelow = true
set.backup = false
set.splitright = true

set.swapfile = false
set.hidden = true
set.clipboard = 'unnamedplus'  -- access the system to clipboard

set.conceallevel = 0
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.smartindent = true

set.completeopt = {'menu', 'menuone', 'noselect'}
set.pumheight = 10

set.signcolumn = 'yes' -- always show sign column, otherwise it will shift

set.textwidth = 79

vim.cmd [[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=1000}
    augroup END

    set iskeyword+=-
]]

-- python3 provider
vim.g['python3_host_prog']  = '/home/lzhao/anaconda3/bin/python3'
-- disable python2 provider
vim.g['loaded_python_provider'] = 0
-- disable perl provider
vim.g['loaded_perl_provider'] = 0
-- disable ruby provider
vim.g['loaded_ruby_provider'] = 0


