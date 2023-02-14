lua << EOF
require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = { 'pyright',  'tsserver' , 'gopls' ,  'html' , "bashls" , "cssls" , "angularls" , "jsonls"}
}
EOF


lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
-- Enable completion triggered by <c-x><c-o>
vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local builtin = require('telescope.builtin')
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'fd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<c-f>', vim.lsp.buf.formatting, bufopts)
vim.keymap.set('n', '<leader>gd', builtin.lsp_implementations , bufopts )
vim.keymap.set('n', '<leader>fd', builtin.lsp_references , bufopts )
vim.keymap.set('n', 'fr', vim.lsp.buf.references, bufopts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright',  'tsserver' , 'gopls' ,  'html' , "bashls" , "cssls" , "angularls" , "jsonls"}
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
        }
end


-- Use kubernetes yaml
local yaml_on_attach = function(client, buffer)
if client.name == "yamlls" then
    client.resolved_capabilities.document_formatting = true
end
end
require('lspconfig').yamlls.setup {
    on_attach = yaml_on_attach,
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
            },
        },
    }
}
EOF

lua << EOF
require("fidget").setup{}
EOF
