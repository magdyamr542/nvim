local ns = require('neoscroll')

ns.setup({
    easing_function = "quadratic"
})

local keymap = {
    ["<C-u>"] = function() ns.ctrl_u({ duration = 150 }) end,
    ["<C-d>"] = function() ns.ctrl_d({ duration = 150 }) end,
    ["<C-b>"] = function() ns.ctrl_b({ duration = 500 }) end,
    ["<C-f>"] = function() ns.ctrl_f({ duration = 500 }) end,
    ["<C-y>"] = function() ns.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
    ["<C-e>"] = function() ns.scroll(0.1, { move_cursor = false, duration = 100 }) end,
    ["zt"]    = function() ns.zt({ half_win_duration = 300 }) end,
    ["zz"]    = function() ns.zz({ half_win_duration = 300 }) end,
    ["zb"]    = function() ns.zb({ half_win_duration = 300 }) end,
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func)
end
