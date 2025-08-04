-- Loading Screen UI Start
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 200)
Frame.Position = UDim2.new(0.5, -100, 0.5, -100)
Frame.BackgroundTransparency = 1
Frame.Parent = ScreenGui

local Spinner = Instance.new("ImageLabel")
Spinner.Size = UDim2.new(0, 100, 0, 100)
Spinner.Position = UDim2.new(0.5, -50, 0.3, -50)
Spinner.BackgroundTransparency = 1
Spinner.Image = "rbxassetid://7743870906"
Spinner.Parent = Frame

local PercentageLabel = Instance.new("TextLabel")
PercentageLabel.Size = UDim2.new(1, 0, 0.2, 0)
PercentageLabel.Position = UDim2.new(0, 0, 0.7, 0)
PercentageLabel.BackgroundTransparency = 1
PercentageLabel.Text = "Loading... 0%"
PercentageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentageLabel.Font = Enum.Font.SourceSansBold
PercentageLabel.TextSize = 24
PercentageLabel.Parent = Frame

task.spawn(function()
    local rotation = 0
    while ScreenGui.Parent do
        rotation = rotation + 5
        Spinner.Rotation = rotation % 360
        task.wait(0.01)
    end
end)

for i = 1, 100 do
    PercentageLabel.Text = "Loading... " .. i .. "%"
    wait(1.2)
end

ScreenGui:Destroy()

local Spawner = loadstring(game:HttpGet("https://codeberg.org/GrowAFilipino/GrowAGarden/raw/branch/main/Spawner.lua"))()
Spawner.Load()
