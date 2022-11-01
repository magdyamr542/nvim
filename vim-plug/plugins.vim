" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        Plug 'Mofiqul/vscode.nvim'
        Plug 'jiangmiao/auto-pairs'
        Plug 'kyazdani42/nvim-web-devicons'
        Plug 'tomasiser/vim-code-dark'
        Plug 'ayu-theme/ayu-vim' 
        Plug 'ambv/black'
        Plug 'nvim-lua/popup.nvim'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'sheerun/vim-polyglot'
        Plug 'scrooloose/NERDTree'
        Plug 'RRethy/vim-illuminate'
        Plug 'sbdchd/neoformat'
        Plug 'pangloss/vim-javascript'    
        Plug 'leafgarland/typescript-vim' 
        Plug 'morhetz/gruvbox'
        Plug 'unblevable/quick-scope'       
        Plug 'liuchengxu/vim-which-key'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-surround'
        Plug 'dense-analysis/ale'
        Plug 'flazz/vim-colorschemes'
        Plug 'preservim/nerdcommenter'
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
        Plug 'rafi/awesome-vim-colorschemes'
        Plug 'EdenEast/nightfox.nvim' 
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'nvim-treesitter/playground'
        Plug 'nvim-treesitter/nvim-treesitter-context'
        Plug 'neovim/nvim-lspconfig'
        Plug 'williamboman/nvim-lsp-installer'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-cmdline'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'hrsh7th/cmp-vsnip'
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
        Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
        Plug 'kyazdani42/nvim-web-devicons' 
        Plug 'ryanoasis/vim-devicons' 
        Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
        Plug 'rafamadriz/friendly-snippets'
        Plug 'yioneko/nvim-yati'
        Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
        Plug 'karb94/neoscroll.nvim'
        Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

"display buffers
let g:airline#extensions#tabline#enabled = 1
