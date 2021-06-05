" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " Better Syntax Support
        Plug 'sheerun/vim-polyglot'
        Plug 'scrooloose/NERDTree'
        Plug 'jiangmiao/auto-pairs'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'sbdchd/neoformat'
        Plug 'pangloss/vim-javascript'    
        Plug 'leafgarland/typescript-vim' 
        Plug 'maxmellon/vim-jsx-pretty'   
        Plug 'morhetz/gruvbox'
        Plug 'kien/ctrlp.vim'
        Plug 'tpope/vim-surround'
        Plug 'preservim/nerdcommenter'
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()
