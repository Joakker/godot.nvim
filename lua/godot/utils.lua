local M = {}

function M.get_config_names()
    local names = {}
    local conf = io.open('export_presets.cfg', 'r')
    if conf then
        for line in conf:lines() do
            if line == '' then goto continue end
            local pair = vim.split(line, '=')
            if pair[1] == 'name' then
                table.insert(names, pair[2]:sub(2, #pair[2] - 1))
            end
            ::continue::
        end
        conf:close()
    end
    return names
end

return M
