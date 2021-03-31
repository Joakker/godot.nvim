---@diagnostic disable: duplicate-doc-class
local M = {}

---@alias Callback  fun(name: string, path: string)

---@class Preset    @The build presets for exporting the game
---@field name      string
---@field path      string
---@field callback  Callback

local Job = require 'plenary.job'

---@type string
local executable = 'godot'
---@type string
local version

---@type table<string,Preset>
M.presets = {}

-- Sets up the environment for godot development
--
---@class GodotOptions
---@field versionmsg    boolean     Display a message at startup (default: true)
---@field executable    string      Path of the godot executable (default: godot)
---@field presets       Preset[]    The default list of export presets
function M.setup(options)
    options = options or {}
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
    if options.presets then
        for _, exp in ipairs(options.presets) do
            M.presets[exp.name] = exp
        end
    end
end

-- Export the given template
--
---@param name string   The name of the preset to use
function M.export(name)
    if name and M.presets[name] then
        local exp = M.presets[name]
        Job:new{
            command = executable,
            args = {'--export', exp.name, exp.path},
            on_exit = function()
                -- TODO(Joakker): Translate the on_exit callback to our
                -- own custom handler
            end
        }:sync()
    end
end

-- Export for all configured presets
function M.export_all()
    for name in pairs(M.presets) do M.export(name) end
end

function M.eval_script(path)
    Job:new{
        command = executable,
        args = {'--script', path},
        on_exit = function(j, return_val)
            print(return_val)
            print(vim.inspect(j:result()))
        end
    }:sync()
end

return M
