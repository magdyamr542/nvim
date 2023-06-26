local ls = require "luasnip"
-- some shorthands...
local s = ls.snippet
local c = ls.choice_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local func = f
local text = t
local snip = s
local insert = i

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
    local file = io.popen(command, "r")
    local res = {}
    for line in file:lines() do
        table.insert(res, line)
    end
    return res
end

local filepath = function(_, _, relative)
    if relative == true then
        return { vim.fn.expand "%" }
    else
        return { vim.fn.expand "%:p" }
    end
end

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
        snip({
            trig = "pwd",
            namr = "PWD",
            dscr = "Path to current working directory",
        }, {
            func(bash, {}, { user_args = { "pwd" } }),
        }),
        snip({
            trig = "filename",
            namr = "Filename",
            dscr = "Name of the file",
        }, {
            func(filepath, {}, { user_args = { true } }),
        }),
        snip({
            trig = "filepath",
            namr = "Absolute filepath",
            dscr = "Absolute path to file",
        }, {
            func(filepath, {}, { user_args = { false } }),
        }),
    },
    go = {
        snip("test", {
            text "func ",
            insert(1, "Name"),
            text "(t *testing.T)",
            text { " {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),
        snip("tyi", {
            text "type ",
            insert(1, "Name"),
            text { " interface {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),
        snip("tys", {
            text "type ",
            insert(1, "Name"),
            text { " struct {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),
        snip("fori", {
            text "for ",
            insert(1, "i := 0"),
            text ";",
            insert(2, "i < 10"),
            text ";",
            insert(3, "i++"),
            text { " {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),
        snip("forr", {
            text "for ",
            insert(1, "k, v"),
            text " := range ",
            insert(2, "expr"),
            text { " {", "" },
            text "\t",
            insert(0),
            text { "", "}" },
        }),
    },
})

-- Go to next choice
vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)
