game.ReplicatedFirst:RemoveDefaultLoadingScreen()


local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 1000
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local textLabel = Instance.new("TextLabel")
textLabel.Active = true
textLabel.Size = UDim2.new(1,0,1,0)
textLabel.BackgroundColor3 = Color3.fromRGB(45,45,45)
textLabel.Font = Enum.Font.Gotham
textLabel.TextColor3 = Color3.fromRGB(255,255,255)
textLabel.Text = "Loading..."
textLabel.TextSize = 40
textLabel.Parent = screenGui

if game:IsLoaded() == false then game.Loaded:Wait() end

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

screenGui:Destroy()