local state_ok, nvim_comment = pcall(require, 'nvim_comment')
if not state_ok then
    return
end

nvim_comment.setup({
    marker_padding = true, -- a space in between marker
    comment_empty = true,  -- comment space line
    create_mappings = true,
})


