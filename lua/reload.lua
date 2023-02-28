local M = {}

-- Add modules here
local modules = {
  "mappings",
  "settings",
  "custom_commands",
  "helper"
}

function M.ReloadConfig()
  -- Refresh module cache
  for _, v in pairs(modules) do
    package.loaded[v] = nil
    require(v)
  end
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

return M
