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

" search a selected word like vscode
vnoremap <c-f> y/\V<C-R>=escape(@",'/\')<CR><CR>

" comments
vnoremap <c-k><c-c> :Commentary<CR>
nmap <c-k><c-c> :Commentary<CR>
nmap <c-k><c-u> :Commentary<CR>

" close vim
nnoremap <c-w><c-w> :call CloseVim()<CR> 
vnoremap <leader>kc :Commentary<CR>
"ctrl p for find files
nnoremap <c-p> <CMD>Telescope find_files<CR>
"show buffers
nnoremap <silent> \\ :Telescope buffers<CR>
"finding words
nnoremap <c-f> :Telescope grep_string<CR>
nnoremap <leader>f :Telescope live_grep<CR>

"install plugins
nnoremap <leader>i <CMD> PlugInstall<CR>

"changing the color theme
nnoremap <leader>w <CMD> lua require("vscode").change_style("light")<CR>
nnoremap <leader>d <CMD> lua require("vscode").change_style("dark")<CR>
nnoremap <leader>g <CMD> colorscheme gruvbox<CR>

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
