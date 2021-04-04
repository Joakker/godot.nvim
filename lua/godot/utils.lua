local M = {}

local Path = require 'plenary.path'

function M.find_export_presets()
    local path = Path:new(vim.loop.cwd())
    if (path / 'export_presets.cfg'):exists() then
        return 'export_presets.cfg'
    end
    for _, parent in ipairs(path:parents()) do
        local testpath = Path:new(parent) / 'export_presets.cfg'
        if testpath:exists() then testpath:absolute() end
    end
end

function M.get_config_names()
    local names = {}
    local filepath = M.find_export_presets()
    if not filepath then return names end
    local conf = io.open(filepath, 'r')
    if conf then
        for line in conf:lines() do
            if line == '' then goto continue end
            local key, value = unpack(vim.split(line, '='))
            if key == 'name' then
                table.insert(names, value:sub(2, #value - 1))
            end
            ::continue::
        end
        conf:close()
    end
    return names
end

return M
