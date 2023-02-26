-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- I hate escape more than anything else
map('i', 'jj', '<Esc>')

-- Save buffer
map('n', '<C-s>', ':w<CR>')

-- Use control-c instead of escape
map('n', '<C-c>', '<Esc>')

-- Select to end of line without new line character
map('v', '$', 'g_')

-- Better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

--  source init.lua
map('n', '<leader>r', ':source ~/.config/nvim/init.lua<CR>')

-- remove highlight from last search pattern when pressing enter
map('n', '<CR>', ':noh<CR><CR>')

-- Nerdtree mapping
map('n', '<C-t>', ':NERDTreeToggle<CR>')

-- make Y copy to the end of the line
map('n', 'Y', 'y$')

-- keep the cursor centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

-- dont override the resiger when copying
map('v', 'p', 'pgvy')

-- dont skip wrapped lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- commenting
map('n', '<c-k><c-c>', '<Plug>(comment_toggle_linewise_current)')
map('v', '<c-k><c-u>', '<Plug>(comment_toggle_linewise_visual)')

-- close vim
map('n', '<c-w><c-w>', ':lua require("helper").CloseVim()<CR>')

-- install plugins
map('n', '<leader>i', '<CMD> PlugInstall<CR>')

-- replace fast
map('n', '<leader>S', ':%s//g<LEFT><LEFT>')
map('n', ' <leader>s', ':lua require("helper").ReplaceAll()<CR>')

-- end of the line without space. it does not include the line break at the end
-- of the line
map('n', '$', 'g_')

-- for nerdtree to show the current file
map('n', '<leader>b', ':NERDTreeFind<cr>')

-- open markdown preview
map('n', '<leader>m', ':MarkdownPreview<CR>')

-- quick fix nav
map('n', '<leader>]', ':cnext<CR>')
map('n', '<leader>[', ':cprevious<CR>')

-- close one buffer
map('n', '<c-w>', ':bd<CR>')

-- closing all buffers
map('n', '<c-k><c-w>', ':lua require("helper").CloseOtherBuffers()<CR>')

-- change color theme
map('n', '<leader>c', ':lua require("colors").ChangeColorTheme()<CR>', { silent = true })



-- telescope mappings
-- ctrl p for find files
map('n', '<C-p>', '<cmd>Telescope find_files hidden=true<CR>', { silent = true })
-- show buffers
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { silent = true })
-- show help tags
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { silent = true })
-- finding words
map('n', '<leader>f', '<cmd>Telescope live_grep<CR>', { silent = true })
