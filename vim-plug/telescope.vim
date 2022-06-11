lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
defaults = {
    file_ignore_patterns = {".git/*"},
    pickers = {
            find_files = {
                    hidden=true
                    }
            },
        mappings = {
                i = {
                        -- set going up and down with <ctr-j> <ctrl-k>
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous
                        }
                   }
        } 
}
EOF

"ctrl p for find files
nnoremap <c-p> <CMD>Telescope find_files hidden=true<CR>
"show buffers
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"finding words
nnoremap <leader>f :Telescope live_grep<CR>
