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
        Plug 'RRethy/vim-illuminate'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'sbdchd/neoformat'
        Plug 'pangloss/vim-javascript'    
        Plug 'leafgarland/typescript-vim' 
        Plug 'morhetz/gruvbox'
        Plug 'kien/ctrlp.vim'
        Plug 'unblevable/quick-scope'       
        Plug 'liuchengxu/vim-which-key'
        Plug 'tpope/vim-surround'
        Plug 'voldikss/vim-floaterm'
        Plug 'preservim/nerdcommenter'
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
        Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

"MAPPINGS FOR THE PLUGINS

" ts-server
let g:coc_global_extensions = [ 'coc-tsserver' ]

" quickscope color mappings
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" Floaterm
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.2
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_position="bottom"
let g:floaterm_wintype="split"


"display buffers
let g:airline#extensions#tabline#enabled = 1
