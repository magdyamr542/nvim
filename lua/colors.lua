local M = {}

local function UseGruvbox()
  vim.cmd("colorscheme gruvbox")
  vim.g.gruvbox_contrast_dark = 'soft'
  vim.opt.background = "dark"
end

local function UseOnedark()
  require('onedark').setup {
    style = 'darker'
  }
  require('onedark').load()
end

local function UseVscodeDark()
  require('vscode').change_style('dark')
end

local function UseVscodeLight()
  require('vscode').change_style('light')
end

UseOnedark()

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local onedark = "Onedark (dark)"
local gruvbox = "Gruvbox"
local vscodeDark = "Vscode (dark)"
local vscodeLight = "Vscode (light)"

function M.ChangeColorTheme(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Color themes",
    finder = finders.new_table {
      results = { onedark, gruvbox, vscodeDark, vscodeLight }
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selection = require('telescope.actions.state').get_selected_entry()

        if selection == nil then
          error("invalid color")
        end

        local selectedColor = selection[1]

        -- change the color
        if selectedColor == gruvbox then
          UseGruvbox()
        elseif selectedColor == onedark then
          UseOnedark()
        elseif selectedColor == vscodeDark then
          UseVscodeDark()
        elseif selectedColor == vscodeLight then
          UseVscodeLight()
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

return M
