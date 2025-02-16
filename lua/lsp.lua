-- Mason
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { 'pyright', 'ts_ls', 'gopls', "jsonls", "lua_ls" }
}


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local builtin = require('telescope.builtin')
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'fd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>gd', builtin.lsp_implementations, bufopts)
    vim.keymap.set('n', '<leader>fd', builtin.lsp_references, bufopts)
end

local icons = require "icons"
local default_diagnostic_config = {
    signs = {
        active = true,
        values = {
            { name = "DiagnosticSignError", text = icons.diagnostics.Error },
            { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
            { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
            { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
        },
    },
    virtual_text = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}
vim.diagnostic.config(default_diagnostic_config)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'ts_ls', 'gopls', "jsonls" }
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- lua lsp
require 'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
}

-- yaml lsp
local yaml_on_attach = function(client, _)
    if client.name == "yamlls" then
        client.server_capabilities.document_formatting = true
    end
end
require('lspconfig').yamlls.setup {
    on_attach = yaml_on_attach,
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ['https://raw.githubusercontent.com/docker/cli/master/cli/compose/schema/data/config_schema_v3.9.json'] = "docker-compose.yml",
            },
        },
    }
}

-- rust lsp
require 'lspconfig'.rust_analyzer.setup {
    cmd = { "rust-analyzer" }, -- use system installed rust-analyzer
    on_attach = on_attach,
    capabilities = capabilities
}

