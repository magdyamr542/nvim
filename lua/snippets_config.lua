-- NOTE: You can use other key to expand snippet.

-- Expand
vim.api.nvim_set_keymap('i', '<expr>', '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<expr>', '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"',
  { noremap = true, silent = true })

-- Expand or jump
vim.api.nvim_set_keymap('i', '<expr>', '<C-l>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<expr>', '<C-l>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"',
  { noremap = true, silent = true })

-- Jump forward or backward
vim.api.nvim_set_keymap('i', '<expr>', '<Tab>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<expr>', '<Tab>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<expr>', '<S-Tab>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<expr>', '<S-Tab>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"',
  { noremap = true, silent = true })

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
vim.api.nvim_set_keymap('n', 's', '<Plug>(vsnip-select-text)', { noremap = true })
vim.api.nvim_set_keymap('x', 's', '<Plug>(vsnip-select-text)', { noremap = true })
vim.api.nvim_set_keymap('n', 'S', '<Plug>(vsnip-cut-text)', { noremap = true })
vim.api.nvim_set_keymap('x', 'S', '<Plug>(vsnip-cut-text)', { noremap = true })

-- If you want to use snippet for multiple filetypes, you can g:vsnip_filetypes for it.
vim.g.vsnip_filetypes = {}
vim.g.vsnip_filetypes.javascriptreact = { 'javascript' }
vim.g.vsnip_filetypes.typescriptreact = { 'typescript' }
