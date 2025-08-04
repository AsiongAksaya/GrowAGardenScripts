-- Loading Screen UI Start
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

-- Fullscreen Opaque Background
local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Position = UDim2.new(0, 0, 0, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.3
Background.Parent = ScreenGui

-- Center Frame for Spinner & Text
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 300)
Frame.Position = UDim2.new(0.5, -125, 0.5, -150)
Frame.BackgroundTransparency = 1
Frame.Parent = ScreenGui

-- Circular Spinner Image
local Spinner = Instance.new("ImageLabel")
Spinner.Size = UDim2.new(0, 120, 0, 120)
Spinner.Position = UDim2.new(0.5, -60, 0.2, -60)
Spinner.BackgroundTransparency = 1
Spinner.Image = "rbxassetid://7743870906"
Spinner.Parent = Frame

-- Percentage Text Below Spinner
local PercentageLabel = Instance.new("TextLabel")
PercentageLabel.Size = UDim2.new(1, 0, 0.15, 0)
PercentageLabel.Position = UDim2.new(0, 0, 0.6, 0)
PercentageLabel.BackgroundTransparency = 1
PercentageLabel.Text = "Loading... 0%"
PercentageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentageLabel.Font = Enum.Font.GothamBold
PercentageLabel.TextSize = 28
PercentageLabel.Parent = Frame

-- Funny Tip TextLabel
local TipLabel = Instance.new("TextLabel")
TipLabel.Size = UDim2.new(1, 0, 0.1, 0)
TipLabel.Position = UDim2.new(0, 0, 0.8, 0)
TipLabel.BackgroundTransparency = 1
TipLabel.Text = "Preparing magic soil..."
TipLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TipLabel.Font = Enum.Font.Gotham
TipLabel.TextSize = 20
TipLabel.Parent = Frame

-- Spinner Rotation Animation
task.spawn(function()
    local rotation = 0
    while ScreenGui.Parent do
        rotation = rotation + 2
        Spinner.Rotation = rotation % 360
        task.wait(0.01)
    end
end)

-- Bouncing Dots Animation
task.spawn(function()
    local dots = 0
    while ScreenGui.Parent do
        dots = (dots + 1) % 4
        local dotStr = string.rep(".", dots)
        PercentageLabel.Text = "Loading" .. dotStr
        task.wait(0.5)
    end
end)

-- Funny Tips System
local funnyTips = {
    "Bypassing Anti-Cheat...",
    "Stealing crops from neighbors...",
    "Downloading OP pets...",
    "Planting invisible carrots...",
    "Bribing the garden NPCs...",
    "Watering plastic flowers...",
    "Fooling the server admin...",
    "Claiming free sheckles...",
    "Installing instant-grow hacks...",
    "Petting golden rabbits...",
    "Growing money trees..."
}

task.spawn(function()
    while ScreenGui.Parent do
        TipLabel.Text = funnyTips[math.random(1, #funnyTips)]
        task.wait(4) -- Change tip every 4 seconds
    end
end)

-- Percentage Loading Effect (2 Minutes with Pop Effect)
for i = 1, 100 do
    PercentageLabel.Text = "Loading... " .. i .. "%"
    PercentageLabel.TextScaled = false
    PercentageLabel.TextSize = 32
    wait(0.05)
    PercentageLabel.TextSize = 28

    wait(1.2 - 0.05)
end

-- Remove Loading Screen
ScreenGui:Destroy()

-- Load the Actual Script
local Spawner = loadstring(game:HttpGet("https://codeberg.org/GrowAFilipino/GrowAGarden/raw/branch/main/Spawner.lua"))()
Spawner.Load()
