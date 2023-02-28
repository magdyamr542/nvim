-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
        local fn = vim.fn
        local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
        if fn.empty(fn.glob(install_path)) > 0 then
                fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
                vim.cmd [[packadd packer.nvim]]
                return true
        end
        return false
end

local packer_bootstrap = ensure_packer()

-- PackerCompile after writing to plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])



return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use 'Mofiqul/vscode.nvim'
        use 'jiangmiao/auto-pairs'
        use 'tomasiser/vim-code-dark'
        use 'ayu-theme/ayu-vim'
        use 'ambv/black'
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'sheerun/vim-polyglot'
        use 'scrooloose/NERDTree'
        use 'RRethy/vim-illuminate'
        use 'sbdchd/neoformat'
        use 'pangloss/vim-javascript'
        use 'leafgarland/typescript-vim'
        use 'morhetz/gruvbox'
        use 'unblevable/quick-scope'
        use 'liuchengxu/vim-which-key'
        use 'tpope/vim-surround'
        use 'preservim/nerdcommenter'
        use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
        use 'EdenEast/nightfox.nvim'
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use 'nvim-treesitter/playground'
        use 'nvim-treesitter/nvim-treesitter-context'
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'
        use 'hrsh7th/vim-vsnip-integ'
        use 'hrsh7th/cmp-nvim-lsp-signature-help'
        use 'ryanoasis/vim-devicons'
        use { 'akinsho/bufferline.nvim', tag = 'v3.*' }
        use 'nvim-tree/nvim-web-devicons'
        use 'rafamadriz/friendly-snippets'
        use 'yioneko/nvim-yati'
        use { 'dstein64/nvim-scrollview', branch = 'main' }
        use 'karb94/neoscroll.nvim'
        use { 'mg979/vim-visual-multi', branch = 'master' }
        use { 'rose-pine/neovim', branch = 'main' }
        use 'lukas-reineke/indent-blankline.nvim'
        use 'nvim-lualine/lualine.nvim'
        use 'lewis6991/gitsigns.nvim'
        use 'j-hui/fidget.nvim'
        use 'numToStr/Comment.nvim'
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'navarasu/onedark.nvim'
        use 'norcalli/nvim-colorizer.lua'

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
                require('packer').sync()
        end
end)
