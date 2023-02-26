" Gruvbox
fun! UseGruvbox()
    colorscheme gruvbox
    let g:gruvbox_contrast_dark = 'dark'
    set background=dark
    hi TelescopeBorder guifg=#5eacd
endfun

" Onedark
fun! UseOnedark()
    let g:onedark_config = {
        \ 'style': 'darker',
    \}
    colorscheme onedark
endfun

" Vscode dark
fun! UseVscodeDark()
    lua require('vscode').change_style('dark')
endfun

" Vscode light
fun! UseVscodeLight()
    lua require('vscode').change_style('light')
endfun



" call UseGruvbox()
call UseOnedark()

" Pick color schemes
lua << EOF
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local onedark = "Onedark (dark)"
local gruvbox = "Gruvbox"
local vscodeDark = "Vscode (dark)"
local vscodeLight = "Vscode (light)"

function change_color_theme (opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Color themes",
    finder = finders.new_table {
      results = {onedark , gruvbox , vscodeDark , vscodeLight}
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(_, map)
        map("i", "<CR>", function(prompt_bufnr)
            local selection = require('telescope.actions.state').get_selected_entry()
            
            if selection == nil then
                error("invalid color")
            end

            selectedColor = selection[1]

            -- change the color
              if selectedColor == gruvbox then
                 vim.fn.UseGruvbox()
              elseif selectedColor == onedark then
                 vim.fn.UseOnedark()
              elseif selectedColor == vscodeDark then
                 vim.fn.UseVscodeDark()
              elseif selectedColor == vscodeLight then
                 vim.fn.UseVscodeLight()
                else
                  error("invalid color")
                end
            -- done change 

            require('telescope.actions').close(prompt_bufnr)
        end)
        return true
    end,
  }):find()
end

-- invoke the function
vim.api.nvim_set_keymap('n', '<leader>c', ':lua change_color_theme()<CR>', { noremap = true, silent = true })
EOF
