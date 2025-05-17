-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
      local fn = vim.fn
      local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
      if fn.empty(fn.glob(install_path)) > 0 then
            fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
            vim.cmd [[packadd packer.nvim]]
            return true
      end
      return false
end

local packer_bootstrap = ensure_packer()

-- PackerCompile after writing to plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
      use 'wbthomason/packer.nvim'                                           -- Packer itself
      use 'Mofiqul/vscode.nvim'                                              -- Vscode like color schemes
      use 'jiangmiao/auto-pairs'                                             -- Automatically insert matching brackets, parentheses, and quotes
      use 'tomasiser/vim-code-dark'                                          -- Dark color scheme
      use 'ayu-theme/ayu-vim'                                                -- Color scheme
      use 'ambv/black'                                                       -- Python formatter
      use 'nvim-lua/popup.nvim'                                              -- Popup windows
      use 'nvim-lua/plenary.nvim'                                            -- Utils library for Lua plugins
      use 'nvim-telescope/telescope.nvim'                                    -- Fuzzy finder
      use 'sheerun/vim-polyglot'                                             -- Language pack for syntax highlighting
      use 'scrooloose/NERDTree'                                              -- File system explorer
      use 'RRethy/vim-illuminate'                                            -- Highlight other occurrences of the word under the cursor
      use 'pangloss/vim-javascript'                                          -- JavaScript syntax highlighting
      use 'leafgarland/typescript-vim'                                       -- TypeScript syntax highlighting
      use 'morhetz/gruvbox'                                                  -- Color scheme
      use 'unblevable/quick-scope'                                           -- Highlight characters used for motions
      use 'tpope/vim-surround'                                               -- Easy manipulation of surroundings
      use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' } -- Preview Markdown files in browser
      use 'EdenEast/nightfox.nvim'                                           -- Color scheme
      use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }           -- Syntax highlighting and parsing
      use 'nvim-treesitter/playground'                                       -- Treesitter playground for experimenting with treesitter queries
      use 'nvim-treesitter/nvim-treesitter-context'                          -- Show context of cursor location
      use 'neovim/nvim-lspconfig'                                            -- Configuration for language servers
      use 'hrsh7th/cmp-nvim-lsp'                                             -- Autocomplete plugin
      use 'hrsh7th/cmp-buffer'                                               -- Autocomplete source for buffer words
      use 'hrsh7th/cmp-path'                                                 -- Autocomplete source for filesystem paths
      use 'hrsh7th/cmp-cmdline'                                              -- Autocomplete source for command line history
      use 'hrsh7th/nvim-cmp'                                                 -- Autocomplete plugin

      use { 'saadparwaiz1/cmp_luasnip' }
      use({
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            tag = "v1.2.1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!:).
            run = "make install_jsregexp",
            dependencies = { "rafamadriz/friendly-snippets" },
      })
      use 'hrsh7th/cmp-nvim-lsp-signature-help'           -- Show signature help for autocomplete
      use 'ryanoasis/vim-devicons'                        -- Icons for file types and plugins
      use { 'akinsho/bufferline.nvim' }     -- Display buffer tabs with configurable colors and icons.
      use 'nvim-tree/nvim-web-devicons'                   -- A Lua library for file icon support in Neovim.
      use 'rafamadriz/friendly-snippets'                  -- A collection of snippets for various programming languages.
      use 'yioneko/nvim-yati'                             -- A simple and fast indent line plugin for Neovim.
      use { 'dstein64/nvim-scrollview', branch = 'main' } -- Displays a preview of the file contents during scrolling.
      use 'karb94/neoscroll.nvim'                         -- A smooth scrolling plugin for Neovim.
      use { 'mg979/vim-visual-multi', branch = 'master' } -- A multiple cursors plugin for Neovim.
      use { 'rose-pine/neovim', branch = 'main' }         -- A color scheme for Neovim.
      use {'lukas-reineke/indent-blankline.nvim', commit='04e44b09ee3ff189c69ab082edac1ef7ae2e256c'}           -- A plugin to display indent lines in Neovim.
      use 'nvim-lualine/lualine.nvim'                     -- A fast and customizable status line plugin for Neovim.
      use 'lewis6991/gitsigns.nvim'                       -- A Git gutter plugin for Neovim.
      use { 'j-hui/fidget.nvim', tag = 'lecay' }          -- A lightweight file explorer for Neovim.
      use 'numToStr/Comment.nvim'                         -- A plugin to easily comment and uncomment code in various filetypes.
      use 'williamboman/mason.nvim'                       -- Portable package manager for Neovim
      use 'williamboman/mason-lspconfig.nvim'             -- A LSP configuration for the Mason build language.
      use 'navarasu/onedark.nvim'                         -- A dark color scheme for Neovim.
      use 'norcalli/nvim-colorizer.lua'                   -- A plugin to highlight color codes in various filetypes.

      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
      if packer_bootstrap then
            require('packer').sync()
      end
end)
