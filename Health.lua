local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local playerGui = player:WaitForChild("PlayerGui")
local screenGui = script.Parent

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 40)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0
frame.Parent = screenGui

local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 36, 0, 36)
icon.Position = UDim2.new(0, 2, 0.5, -18)
icon.BackgroundTransparency = 1
icon.Parent = frame

local content, isReady = game.Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
icon.Image = content

local healthBg = Instance.new("Frame")
healthBg.Size = UDim2.new(0, 160, 0, 20)
healthBg.Position = UDim2.new(0, 45, 0.5, -10)
healthBg.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
healthBg.BorderSizePixel = 0
healthBg.Parent = frame
healthBg.AnchorPoint = Vector2.new(0, 0)

local healthBar = Instance.new("Frame")
healthBar.Size = UDim2.new(1, 0, 1, 0)
healthBar.Position = UDim2.new(0, 0, 0, 0)
healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
healthBar.BorderSizePixel = 0 
healthBar.Parent = healthBg

local healthText = Instance.new("TextLabel")
healthText.Size = UDim2.new(1, 0, 1, 0)
healthText.Position = UDim2.new(0, 0, 0, 0)
healthText.BackgroundTransparency = 1
healthText.TextColor3 = Color3.new(1,1,1)
healthText.Font = Enum.Font.GothamBold
healthText.TextScaled = true
healthText.TextStrokeTransparency = 0.7
healthText.Parent = healthBg


local function updateHealth()
	local health = humanoid.Health
	local maxHealth = humanoid.MaxHealth
	local healthPercent = math.clamp(health / maxHealth, 0, 1)
	healthBar.Size = UDim2.new(healthPercent, 0, 1, 0)
	
	local green = healthPercent
	local red = 1 - healthPercent
	healthBar.BackgroundColor3 = Color3.new(red, green, 0)
	
	healthText.Text = string.format("%d / %d", math.floor(health), maxHealth)
end


humanoid.HealthChanged:Connect(updateHealth)
updateHealth()
