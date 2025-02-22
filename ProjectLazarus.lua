--[[
Project Lazarus AntiCheat bypass by @norbyv1

needed functions:
hookfunction, checkcaller 

put this script in autoexec or it will NOT work
]]--


local result;
task.spawn(function() while task.wait() do result = math.random(500, 3000) end end)

local old;
old = hookfunction(gcinfo, function(...)
    if not checkcaller() then return result end
    return old(...)
end)

local old;
old = hookfunction(collectgarbage, function(...)
    local arg = ...
    if not checkcaller() then
        if typeof(arg) ~= "string" or not arg:match("count") then
            return error(
                       'collectgarbage must be called with \'count\'; use gcinfo() instead');
        end
        return result
    end
    return old(...)
end)
