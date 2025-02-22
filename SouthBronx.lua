--[[
South Bronx AntiCheat bypass by @norbyv1
put this script in autoexec or it will NOT work

needed functions:
getconnections, hookfunction, getcallingscript, checkcaller, hookfunction, getscriptclosure
]]--

for i, v in getconnections(game.ScriptContext.Error) do
    hookfunction(v.Function, function() end)
end

local old
old = hookfunction(getfenv, newcclosure(function(...)
    if not checkcaller() and getcallingscript():IsDescendantOf(game:GetService("Players").LocalPlayer.PlayerGui) then
        for i, v in pairs(getscriptclosure(getcallingscript())) do
            hookfunction(v, function() return task.wait(9e9) end)
        end
        return task.wait(9e9)
    end
    return old(...)
end))

print("south bronx anticheat bypassed")
print("norby was here")
