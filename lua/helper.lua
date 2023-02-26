local M = {}

function M.ReplaceAll()
    local wordUnderCursor = vim.fn.expand("<cword>")
    local command = ":%s/" .. wordUnderCursor .. "//g\\<LEFT>\\<LEFT>"
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, true, true), "n", true)
end

function M.CloseVim()
    vim.cmd(":wqa")
end

function M.CloseOtherBuffers()
    local bufnr = vim.fn.bufnr()
    vim.cmd("only")
    for _, buffer in ipairs(vim.fn.getbufinfo({ listed = true })) do
        if buffer.bufnr ~= bufnr then
            if buffer.changed then
                print(buffer.name .. " has changed, save first")
            else
                vim.cmd("bdelete " .. buffer.bufnr)
            end
        end
    end
end

return M
