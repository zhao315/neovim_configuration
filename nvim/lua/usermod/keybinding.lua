local bind = vim.api.nvim_set_keymap
local options = {noremap=true, silent=true}

-- <space> : leader_key
-- jk : <esc>
-- <space>+l : explorer
-- resize window :
--	<ctrl> + <up>: move up
--	<ctrl> + <down>: move down
--	<ctrl> + <left>: move left
--	<ctrl> + <right>: move right
-- indent under visual mode:
-- 	> : move right
-- 	< : move left
-- buffer switch:
-- 	<shift> + l: next buffer
-- 	<shift> + h: previous buffer
-- nvim window naviagtion:
-- 	<ctrl> + j: up
-- 	<ctrl> + k: down
-- 	<ctrl> + h: left
-- 	<ctrl> + l: right
-- move lines:
-- 	alt + j: move current line down
-- 	alt + k: move current line up
-- <esc> : cancel highlight
-- <space> + w : write to file
-- <space> + e : refresh the netrw list
-- <F2> : comment
-- <F5> : c++ compile
-- <F6> : python compile
-- <space> + f: telescope find_files
-- <space> + t: telescope live_grep
-- <space> + p: show current file path


bind('n', '<space>', '<nop>', options)
vim.g.mapleader = ' '

bind('i', '<esc>', '<nop>', options)
bind('i', 'jk', '<esc>', options)

bind('n', '<leader>l', ':Lex 30<cr>', options)

bind('n', '<c-up>', ':resize +2<cr>', options)
bind('n', '<c-down>', ':resize -2<cr>', options)
bind('n', '<c-left>', ':vertical resize +2<cr>', options)
bind('n', '<c-right>', ':vertical resize -2<cr>', options)

bind('v', '<',  '<gv' , options)
bind('v', '>',  '>gv' , options)

bind('n', '<s-l>', ':bnext<cr>', options)
bind('n', '<s-h>', ':bprevious<cr>', options)

bind('n', '<c-j>', '<c-w>j', options)
bind('n', '<c-k>', '<c-w>k', options)
bind('n', '<c-h>', '<c-w>h', options)
bind('n', '<c-l>', '<c-w>l', options)

bind('n', '<a-j>', ':move .+1<cr>==', options)
bind('n', '<a-k>', ':move .-2<cr>==', options)
bind('x', '<a-j>', ":move '>+1<cr>gv-gv", options)
bind('x', '<a-k>', ":move '<-2<cr>gv-gv", options)

bind('v', 'p', '"_dp', options)

bind('n', '<esc>', ':noh<cr>', options)

bind('n', '<leader>w', '<esc>:w<cr>', options)

bind('n', '<leader>e', '<Plug>NetrwRefresh', options)

bind('', '<F2>', ':CommentToggle<cr>', options)
bind('n', '<F3>', ':TagbarToggle<cr>', options)
bind('n', '<F5>', '<Esc>:w<CR>:!g++ -std=c++17 % -o /tmp/a.out && /tmp/a.out<CR>', options)
bind('n', '<F6>', '<esc>:w<cr>:!python3 %<cr>', options)
bind('n', '<F9>', ':Black<cr>', options)

bind('n', '<leader>f', '<cmd>lua require("telescope.builtin").find_files()<cr>', options)
bind('n', '<leader>t', '<cmd>Telescope live_grep<cr>', options)

bind('n', '<leader>p', '1<c-g>', options)

-- 	disable arrow navigation
bind('n', '<up>', '<nop>', options)
bind('n', '<down>', '<nop>', options)
bind('n', '<left>', '<nop>', options)
bind('n', '<right>', '<nop>', options)
--	disable Ex mode
bind('n', 'Q', '<nop>', options)


