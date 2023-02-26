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

" Alternate way to save
nnoremap <C-s> :w<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" Select to end of line without new line character
vnoremap $ g_

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
nnoremap <C-t> :NERDTreeToggle<CR>

"Vim Whick Key to show Mappings of commands
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

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

"dont skip wrapped lines
noremap j gj
noremap k gk

" commenting
noremap <c-k><c-c> <Plug>(comment_toggle_linewise_current)
vnoremap <c-k><c-u> <Plug>(comment_toggle_linewise_visual)

" close vim
nnoremap <c-w><c-w> :call CloseVim()<CR> 

"install plugins
nnoremap <leader>i <CMD> PlugInstall<CR>

" replace fast
nmap  S  :%s//g<LEFT><LEFT>
nmap  <leader>s  :call ReplaceAll()<CR>

" end of the line without space. it does not include the line break at the end
" of the line
nmap $ g_

" for nerdtree to show the current file
 nnoremap <Leader>b :NERDTreeFind<cr>

" cycle through autocomplete with tap
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" open markdown preview
nnoremap <leader>m :MarkdownPreview<CR>

" buffer mappings
source $HOME/.config/nvim/keys/buffer-mappings.vim

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>


nnoremap <leader>p gqip<CR>

" quick fix nav
noremap <leader>]  :cnext<CR>
noremap <leader>[  :cprevious<CR>
