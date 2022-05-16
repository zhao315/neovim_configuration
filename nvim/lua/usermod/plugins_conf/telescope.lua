local state_ok, telescope = pcall(require, 'telescope')
if not state_ok then
    return
end

local actions = require('telescope.actions')

telescope.setup{
    defaults = {
        path_display = {'smart'},

        mappings = {
            i = {
                ['<c-n>'] = actions.cycle_history_next,
                ['<c-p>'] = actions.cycle_history_prev,
                ['<c-j>'] = actions.move_selection_next,
                ['<c-k>'] = actions.move_selection_previous,
                ['<c-c>'] = actions.close,
                ['<down>'] = actions.move_selection_next,
                ['<up>'] = actions.move_selection_previous,
                ['<cr>'] = actions.select_default,
                ['<pageup>'] = actions.results_scrolling_up,
                ['<pagedown>'] = actions.results_scrolling_down,
                ['<c-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<c-l>'] = actions.complete_tag,
            },
            n = {
                ['<esc>'] = actions.close,
                ['<cr>'] = actions.select_default,
                ['j'] = actions.move_selection_next,
                ['k'] = actions.move_selection_previous,
                ['H'] = actions.move_to_top,
                ['M'] = actions.move_to_middle,
                ['L'] = actions.move_to_bottom,
            },

        },

    },
}
