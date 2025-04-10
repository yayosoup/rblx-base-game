for _,v in ipairs(game.ServerScriptService:GetDescendants()) do
    if v.ClassName ~= "ModuleScript" then continue end
    _G[v.Name] = require(v)
end
for _,v in pairs(_G) do
    if typeof(v) ~= "table" then continue end
    if v.Init == nil then continue end
    v.Init()
end
for _,v in pairs(_G) do
    if typeof(v) ~= "table" then continue end
    if v.Start == nil then continue end
    v.Start()
end
