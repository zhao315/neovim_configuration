local state_ok, nightfox = pcall(require, 'nightfox')
if not state_ok then
    return
end

nightfox.setup({
    options = {
        styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
        }
    }
})

vim.cmd('colorscheme terafox')



