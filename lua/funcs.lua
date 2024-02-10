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







-- Define the function
function QuoteIds()
    -- Get the current visual selection range
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")

    -- Loop through the selected lines
    for line = start_line, end_line do
        -- Get the content of each line
        local line_content = vim.fn.getline(line)

        -- Add single quotes around the line content
        local quoted_line = "'" .. line_content .. "'" .. ","

        -- Set the modified line content
        vim.fn.setline(line, quoted_line)
    end

    -- Update the display
    vim.fn.visualmode() -- This triggers a redraw to update the display
end

function OpenPdfAtPage()
    -- Get the currently highlighted text
    local selected_text = vim.fn.getline("'<,'>")

    -- Check if the text matches the expected format
    local pattern = "(.-)%s+(%d+)"
    local pdf_path, page_number = selected_text:match(pattern)

    if pdf_path and page_number then
        -- Construct the bash command to open the PDF at the specified page
        local bash_command = string.format("evince %s -p %s &", pdf_path, page_number)

        -- Execute the bash command from Neovim
        vim.fn.system(bash_command)
    else
        print("Invalid format. Expected: <pdf path> <page number>")
    end
end

vim.api.nvim_set_keymap('x', '<leader>op', [[:lua OpenPdfAtPage()<CR>]], { noremap = true, silent = true })
