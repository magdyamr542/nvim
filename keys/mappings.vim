" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
nnoremap <Tab> >>_
vnoremap <Tab> >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" source init.vim
nnoremap <Leader>r :source $MYVIMRC<CR>
" remove highlight from last search pattern when pressing enter
nnoremap <CR> :noh<CR><CR>

" Nerdtree mapping
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Floaterm mappings
nnoremap <leader>t :FloatermToggle<CR>


"Vim Whick Key to show Mappings of commands
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
"Floaterm
nnoremap   <silent>   <leader>;    :FloatermNew<CR>

"make Y copy to the end of the line
nnoremap Y y$
"keep the cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"undo breakpoints
inoremap  , ,<c-g>u
inoremap  . .<c-g>u
inoremap  ! !<c-g>u
inoremap  ? ?<c-g>u

"Moving text around when highlighting
vnoremap <c-J> :m '>+1<CR>gv=gv
vnoremap <c-K> :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-j> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
"dont override the resiger when copying
vnoremap p pgvy

"vscode mapping like: close all windows except the current one
nnoremap <c-k><c-w> <c-w><c-o>
"dont skip wrapped lines
noremap j gj
noremap k gk

"closing vim
nnoremap <c-w><c-w> :wq<CR>

" Go to command mode without the shift
noremap ; :

" close window fast
nnoremap <c-w> <c-w>q
"comment a line
nnoremap <c-c><c-c> :Commentary<CR>
