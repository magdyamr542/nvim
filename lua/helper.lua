local M = {}

function M.ReplaceAll()
    local wordUnderCursor = vim.fn.expand("<cword>")
    local command = ":%s/" .. wordUnderCursor .. "/<LEFT>/"
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, true, true), "n", true)
end

function M.CloseVim()
    vim.cmd(":wqa")
end

return M
