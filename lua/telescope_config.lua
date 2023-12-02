local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { ".git/*" },
    dynamic_preview_title = true,
    pickers = {
      find_files = {
        hidden = true
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
