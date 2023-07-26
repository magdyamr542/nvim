function ReplaceOnCurrentLine(args)
    -- Extract quoted substrings and store them in a temporary table
    local quoted_substrings = {}
    args = args:gsub("%b''", function(q)
        table.insert(quoted_substrings, q)
        return "\0" -- Replace quoted substrings with null character
    end)

    args = args:gsub('%b""', function(q)
        table.insert(quoted_substrings, q)
        return "\0" -- Replace quoted substrings with null character
    end)

    -- Split the remaining arguments based on spaces
    local arguments = vim.split(args, " ")

    -- Merge the quoted substrings back into the argument list
    for i, arg in ipairs(arguments) do
        if arg == "\0" then
            arguments[i] = table.remove(quoted_substrings, 1):sub(2, -2) -- Remove quotes from the substring
        end
    end

    local num_args = #arguments

    -- Validate the number of arguments
    if num_args ~= 2 then
        error("ReplaceOnCurrentLine: requires exactly 2 arguments <toReplace> <replaceWith>")
        return
    end

    local first_arg, second_arg = arguments[1], arguments[2]

    -- Get the current line content
    local line = vim.fn.getline(".")

    -- Replace all occurrences of the first argument with the second argument
    local new_line = string.gsub(line, first_arg, second_arg)

    -- Update the current line with the new content
    vim.fn.setline(".", new_line)
end

-- Define a command to call the function from the Vim command prompt
vim.cmd("command! -nargs=1 ReplaceInLine lua ReplaceOnCurrentLine(<q-args>)")
