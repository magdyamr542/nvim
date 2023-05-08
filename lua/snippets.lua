local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local func = ls.function_node

local date = function() return { os.date('%Y-%m-%d') } end

require('luasnip/loaders/from_vscode').lazy_load({ paths = "~/.config/nvim/lua/custom-snippets" })

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            func(date, {}),
        }),

    },
})
