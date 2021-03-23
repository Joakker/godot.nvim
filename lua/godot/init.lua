local M = {}

local Job = require 'plenary.job'

---@type string
local executable
---@type string
local version

-- Sets up the environment for godot development
--
---@class options:    table     The options to be passed
---@field versionmsg  boolean   Display a message at startup (default: true)
---@field executable  string    Name of the godot executable
function M.setup(options)
    executable = options.executable or 'godot'
    local versionmsg =
        (options.versionmsg == nil) and true or options.versionmsg
    Job:new{
        command = executable,
        args = {'--version'},
        on_exit = function(j, _)
            -- Extract the version of godot that we're using
            version = j:result()[1]
        end
    }:sync()
    if version:sub(1, 1) ~= '3' then
        print [[Only tested with Godot 3. Tread lightly]]
    end
    if versionmsg then print('Using godot v' .. version) end
end

-- Export the given template
--
---@param name string
function M.export(name)
    if name then print [[Launch the export tool and export]] end
end

return M
