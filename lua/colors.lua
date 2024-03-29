local M = {}

local function applyQuickScopeColors()
  vim.cmd("highlight QuickScopePrimary guifg='#469839'")
  vim.cmd("highlight QuickScopeSecondary guifg='#C02323'")
end

local function UseGruvbox()
  vim.cmd("colorscheme gruvbox")
  vim.g.gruvbox_contrast_dark = 'soft'
  vim.opt.background = "dark"
  applyQuickScopeColors()
end

local function UseOnedark()
  require('onedark').setup {
      style = 'warm'
  }
  require('onedark').load()
  applyQuickScopeColors()
end

local function UseOnedarkWarmer()
  require('onedark').setup {
      style = 'warmer'
  }
  require('onedark').load()
  applyQuickScopeColors()
end


local function UseVscodeDark()
  require('vscode').load('dark')
  applyQuickScopeColors()
end

local function UseVscodeLight()
  require('vscode').load('light')
  applyQuickScopeColors()
end

UseOnedark()

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local onedark = "Onedark (dark)"
local onedarkWarmer = "Onedark (dark warmer)"
local gruvbox = "Gruvbox"
local vscodeDark = "Vscode (dark)"
local vscodeLight = "Vscode (light)"

function M.ChangeColorTheme(opts)
  opts = opts or {}
  pickers.new(opts, {
      prompt_title = "Color themes",
      finder = finders.new_table {
          results = { onedark, onedarkWarmer, gruvbox, vscodeDark, vscodeLight }
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
          elseif selectedColor == onedarkWarmer then
            UseOnedarkWarmer()
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
