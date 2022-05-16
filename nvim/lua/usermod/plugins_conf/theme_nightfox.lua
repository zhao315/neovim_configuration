local state_ok, nightfox = pcall(require, 'nightfox')
if not state_ok then
    return
end

nightfox.setup({
    fox = 'nordfox',
    styles = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'italic,bold',
    },
})

nightfox.load()

