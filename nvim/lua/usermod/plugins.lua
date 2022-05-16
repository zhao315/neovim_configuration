-- reloads neovim whenever save plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup END
]]

-- protected call for packer
local state_ok, packer = pcall(require, 'packer')
if not state_ok then
    return
end

-- popup window
packer.init{
    display = {
        open_fn = function()
            return require('packer.util').float{border='rounded'}
        end,
    }
}

-- plugins management
return require('packer').startup(function(use)
    -- packer management
    use 'wbthomason/packer.nvim' -- packer management
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'  -- popup API

    -- completion
    use 'neovim/nvim-lspconfig'  -- language server protocol
    use 'williamboman/nvim-lsp-installer'  -- language server installer
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use "rafamadriz/friendly-snippets"

    -- telescope
    use 'nvim-telescope/telescope.nvim'

    -- colorscheme
    use 'itchyny/lightline.vim' -- status line
    use 'EdenEast/nightfox.nvim' -- theme
--    use 'shaunsingh/nord.nvim' -- theme


    -- autopair
    use 'jiangmiao/auto-pairs'

    -- surround
    use 'tpope/vim-surround'

    -- commentary
    use "terrortylor/nvim-comment"

    -- indent line
    use 'lukas-reineke/indent-blankline.nvim'

    -- tagbar: a class outline viewer
    use 'preservim/tagbar'

    -- latex
    use 'lervag/vimtex'

    -- black (python formatting)
    use 'psf/black'

end)

