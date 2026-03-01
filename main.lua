-- PRIMION V4 - ATUALIZAÇÃO ABA PLAYER
-- [O código anterior de Login e Toggle permanece o mesmo]

-----------------------------------------------------------
-- CONFIGURAÇÃO DA ABA PLAYER (DENTRO DA FUNÇÃO AbrirHubPrincipal)
-----------------------------------------------------------

-- 1. VELOCIDADE (WalkSpeed)
local speedFrame = Instance.new("Frame")
speedFrame.Size = UDim2.new(0.95, 0, 0, 50)
speedFrame.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
speedFrame.Parent = pages["Player"]
Instance.new("UICorner", speedFrame)

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0.6, 0, 1, 0)
speedLabel.Text = "Velocidade:"
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextSize = 14
speedLabel.BackgroundTransparency = 1
speedLabel.Parent = speedFrame

local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(0.3, 0, 0.7, 0)
speedInput.Position = UDim2.new(0.65, 0, 0.15, 0)
speedInput.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
speedInput.Text = "16"
speedInput.TextColor3 = COLORS.Accent
speedInput.Font = Enum.Font.GothamBold
speedInput.Parent = speedFrame
Instance.new("UICorner", speedInput)

speedInput.FocusLost:Connect(function()
    local val = tonumber(speedInput.Text)
    if val then
        player.Character.Humanoid.WalkSpeed = val
    end
end)

-- 2. NOCLIP (Atravessar Paredes)
local noclipFrame = Instance.new("Frame")
noclipFrame.Size = UDim2.new(0.95, 0, 0, 50)
noclipFrame.Position = UDim2.new(0, 0, 0, 60)
noclipFrame.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
noclipFrame.Parent = pages["Player"]
Instance.new("UICorner", noclipFrame)

local noclipLabel = Instance.new("TextLabel")
noclipLabel.Size = UDim2.new(0.6, 0, 1, 0)
noclipLabel.Text = "Noclip:"
noclipLabel.TextColor3 = Color3.new(1,1,1)
noclipLabel.Font = Enum.Font.GothamBold
noclipLabel.TextSize = 14
noclipLabel.BackgroundTransparency = 1
noclipLabel.Parent = noclipFrame

local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(0.3, 0, 0.7, 0)
noclipBtn.Position = UDim2.new(0.65, 0, 0.15, 0)
noclipBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80) -- Começa Off (Vermelho)
noclipBtn.Text = "OFF"
noclipBtn.TextColor3 = Color3.new(1,1,1)
noclipBtn.Font = Enum.Font.GothamBold
noclipBtn.Parent = noclipFrame
Instance.new("UICorner", noclipBtn)

local noclipActive = false
game:GetService("RunService").Stepped:Connect(function()
    if noclipActive and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

noclipBtn.MouseButton1Click:Connect(function()
    noclipActive = not noclipActive
    if noclipActive then
        noclipBtn.BackgroundColor3 = COLORS.Accent -- Verde (On)
        noclipBtn.Text = "ON"
    else
        noclipBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80) -- Vermelho (Off)
        noclipBtn.Text = "OFF"
    end
end)
