local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- CORES DO TEMA (GLASSMORPHISM)
local COLORS = {
    MainBG = Color3.fromRGB(10, 10, 15),
    Glass = Color3.fromRGB(20, 20, 30),
    NeonGreen = Color3.fromRGB(0, 255, 127),
    NeonBlue = Color3.fromRGB(0, 162, 255),
    NeonGold = Color3.fromRGB(255, 180, 50),
    NeonPurple = Color3.fromRGB(150, 50, 255)
}

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV4") then playerGui.PrimionV4:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4"
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- FUNÇÃO: HUB PRINCIPAL (APÓS LOGIN)
-----------------------------------------------------------
local function AbrirHubPrincipal()
    -- [O código do Hub Principal e Botão Galáxia que já fizemos continua aqui]
    -- Resumindo para o código não ficar gigante, mas ele abrirá o menu com as funções.
    print("Hub Aberto com Sucesso!")
    
    -- Botão Galáxia flutuante
    local tBtn = Instance.new("TextButton")
    tBtn.Size = UDim2.new(0, 50, 0, 50)
    tBtn.Position = UDim2.new(0, 20, 0, 20)
    tBtn.Text = "★"
    tBtn.TextColor3 = Color3.new(1,1,1)
    tBtn.Font = Enum.Font.GothamBold
    tBtn.TextSize = 24
    tBtn.Parent = sg
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new(COLORS.NeonPurple, Color3.fromRGB(25, 25, 112))
    grad.Rotation = 45
    grad.Parent = tBtn
    Instance.new("UICorner", tBtn).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", tBtn).Color = Color3.new(1,1,1)
end

-----------------------------------------------------------
-- TELA DE LOGIN ESTILO V2.0 (FIEL À IMAGEM)
-----------------------------------------------------------
local loginContainer = Instance.new("Frame")
loginContainer.Size = UDim2.new(0, 600, 0, 350)
loginContainer.Position = UDim2.new(0.5, -300, 0.5, -175)
loginContainer.BackgroundColor3 = COLORS.MainBG
loginContainer.BackgroundTransparency = 0.1
loginContainer.Parent = sg
Instance.new("UICorner", loginContainer).CornerRadius = UDim.new(0, 20)
local mainStroke = Instance.new("UIStroke", loginContainer)
mainStroke.Thickness = 2
mainStroke.Color = Color3.fromRGB(40, 40, 60)

-- Títulos (Executor e Authorization)
local title1 = Instance.new("TextLabel")
title1.Size = UDim2.new(1, 0, 0, 30)
title1.Position = UDim2.new(0, 0, 0, 10)
title1.Text = "PRIMION EXECUTOR"
title1.TextColor3 = COLORS.NeonGold
title1.Font = Enum.Font.GothamBold
title1.TextSize = 22
title1.BackgroundTransparency = 1
title1.Parent = loginContainer

local title2 = Instance.new("TextLabel")
title2.Size = UDim2.new(1, 0, 0, 20)
title2.Position = UDim2.new(0, 0, 0, 35)
title2.Text = "KEY AUTHORIZATION"
title2.TextColor3 = COLORS.NeonBlue
title2.Font = Enum.Font.GothamBold
title2.TextSize = 16
title2.BackgroundTransparency = 1
title2.Parent = loginContainer

-- Ícone de Chave Central (Decorativo)
local keyIcon = Instance.new("TextLabel")
keyIcon.Size = UDim2.new(0, 60, 0, 60)
key
