lua << EOF
vim.diagnostic.config({
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 2,
      prefix = '~',
    },
})
EOF
