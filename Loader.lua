-- Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- Freeze CoreGuis
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

-- Blur Effect
local Blur = Instance.new("BlurEffect")
Blur.Size = 25
Blur.Parent = Lighting

-- ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- Fullscreen Gradient Background
local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Background.BorderSizePixel = 0
Background.Parent = ScreenGui

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}
Gradient.Rotation = 90
Gradient.Parent = Background

-- Warning Label
local WarningLabel = Instance.new("TextLabel")
WarningLabel.Size = UDim2.new(1, 0, 0.05, 0)
WarningLabel.Position = UDim2.new(0, 0, 0.05, 0)
WarningLabel.BackgroundTransparency = 1
WarningLabel.Text = "⚠️ Please don't leave while executing the script, this might make you lose all your pets!"
WarningLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
WarningLabel.Font = Enum.Font.GothamBold
WarningLabel.TextScaled = true
WarningLabel.Parent = ScreenGui

-- Sonic Spinner
local Spinner = Instance.new("ImageLabel")
Spinner.Size = UDim2.new(0, 120, 0, 120)
Spinner.AnchorPoint = Vector2.new(0.5, 0.5)
Spinner.Position = UDim2.new(0.5, 0, 0.4, 0)
Spinner.BackgroundTransparency = 1
Spinner.Image = "rbxassetid://14284090563" -- Sonic Spin
Spinner.Parent = ScreenGui

-- Spinner Rotation Animation
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
ProgressBarBG.Size = UDim2.new(0.6, 0, 0.03, 0)
ProgressBarBG.AnchorPoint = Vector2.new(0.5, 0)
ProgressBarBG.Position = UDim2.new(0.5, 0, 0.55, 0)
ProgressBarBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ProgressBarBG.BorderSizePixel = 0
ProgressBarBG.Parent = ScreenGui

-- Progress Bar Fill with Rainbow Gradient
local ProgressBarFill = Instance.new("Frame")
ProgressBarFill.Size = UDim2.new(0, 0, 1, 0)
ProgressBarFill.BorderSizePixel = 0
ProgressBarFill.Parent = ProgressBarBG

local FillGradient = Instance.new("UIGradient")
FillGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 165, 0)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 128))
}
FillGradient.Rotation = 0
FillGradient.Parent = ProgressBarFill

-- Animate Gradient Travelling Effect
task.spawn(function()
    while ScreenGui.Parent do
        for i = 0, 1, 0.01 do
            FillGradient.Offset = Vector2.new(i, 0)
            task.wait(0.03)
        end
    end
end)

-- Percentage Text
local PercentageLabel = Instance.new("TextLabel")
PercentageLabel.Size = UDim2.new(1, 0, 0.05, 0)
PercentageLabel.Position = UDim2.new(0, 0, 0.6, 0)
PercentageLabel.BackgroundTransparency = 1
PercentageLabel.Text = "Loading... 0%"
PercentageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentageLabel.Font = Enum.Font.GothamBold
PercentageLabel.TextSize = 28
PercentageLabel.Parent = ScreenGui

-- Funny Tips Text
local TipLabel = Instance.new("TextLabel")
TipLabel.Size = UDim2.new(1, 0, 0.05, 0)
TipLabel.Position = UDim2.new(0, 0, 0.66, 0)
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

-- LEAVE BLOCKER: Prevent ESC Menu and Alt+F4
UserInputService.InputBegan:Connect(function(input, gp)
    if input.KeyCode == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.F4 then
        return
    end
end)
pcall(function()
    StarterGui:SetCore("ResetButtonCallback", false)
end)

-- Lock Mouse to Center
UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter

-- Loading Progress (3.5 Minutes)
for i = 1, 100 do
    local progress = i / 100
    PercentageLabel.Text = "Loading... " .. i .. "%"
    ProgressBarFill.Size = UDim2.new(progress, 0, 1, 0)
    task.wait(2.1)
end

-- Cleanup UI and Restore CoreGui
ScreenGui:Destroy()
Blur:Destroy()
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
UserInputService.MouseBehavior = Enum.MouseBehavior.Default

-- Execute Actual Script
local Spawner = loadstring(game:HttpGet("https://codeberg.org/GrowAFilipino/GrowAGarden/raw/branch/main/Spawner.lua"))()
Spawner.Load()
