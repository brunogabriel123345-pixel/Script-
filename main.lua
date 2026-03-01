-- PRIMION KEY SYSTEM V2.1 - HORIZONTAL LAYOUT
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- CONFIGURAÇÕES ORIGINAIS
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_GET_KEY = "https://link-encurtador.com/exemplo" 
local KEY_CORRETA = "key-htpjvg"

-- CORES
local BG_COLOR = Color3.fromRGB(15, 15, 20)
local GOLD_NEON = Color3.fromRGB(255, 200, 50)
local GREEN_NEON = Color3.fromRGB(0, 255, 100)
local PURPLE_NEON = Color3.fromRGB(120, 120, 250)

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV2_Horizontal") then playerGui.PrimionV2_Horizontal:Destroy() end

local screenBlock = Instance.new("ScreenGui")
screenBlock.Name = "PrimionV2_Horizontal"
screenBlock.IgnoreGuiInset = true
screenBlock.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 350)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
mainFrame.BackgroundColor3 = BG_COLOR
mainFrame.Parent = screenBlock
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 20)
Instance.new("UIStroke", mainFrame).Color = Color3.fromRGB(40, 45, 60)

-- Títulos
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 20)
title.Text = "PRIMION EXECUTOR"
title.TextColor3 = GOLD_NEON
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.BackgroundTransparency = 1
title.Parent = mainFrame

-----------------------------------------------------------
-- CONTAINER PARA OS 3 BOTÕES (UM DO LADO DO OUTRO)
-----------------------------------------------------------
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(0, 440, 0, 50)
buttonContainer.Position = UDim2.new(0.5, -220, 0, 80) -- Acima da barra
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = mainFrame

local layoutRow = Instance.new("UIListLayout")
layoutRow.FillDirection = Enum.FillDirection.Horizontal
layoutRow.HorizontalAlignment = Enum.HorizontalAlignment.Center
layoutRow.Padding = UDim.new(0, 10)
layoutRow.Parent = buttonContainer

local function CreateSmallBtn(text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 140, 1, 0) -- Tamanho fixo para caber os 3
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = (color == GOLD_NEON) and Color3.new(0,0,0) or Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.Parent = buttonContainer
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    return btn
end

local btnGet = CreateSmallBtn("GET KEY", GREEN_NEON)
local btnCheck = CreateSmallBtn("CHECK KEY", Color3.fromRGB(30, 60, 45))
local btnPrimion = CreateSmallBtn("KEY PRIMION", GOLD_NEON)

-- Brilho no Check Key para destacar
Instance.new("UIStroke", btnCheck).Color = GREEN_NEON

-----------------------------------------------------------
-- BARRA DE DIGITAÇÃO (ABAIXO DOS BOTÕES)
-----------------------------------------------------------
local inputKey = Instance.new("TextBox")
inputKey.Size = UDim2.new(0, 440, 0, 50)
inputKey.Position = UDim2.new(0.5, -220, 0, 145)
inputKey.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
inputKey.PlaceholderText = "Cole sua chave aqui..."
inputKey.Text = ""
inputKey.TextColor3 = Color3.new(1,1,1)
inputKey.Font = Enum.Font.Gotham
inputKey.Parent = mainFrame
Instance.new("UICorner", inputKey)
Instance.new("UIStroke", inputKey).Color = Color3.fromRGB(60, 65, 80)

-- Botão de Suporte (Separado em baixo)
local btnDiscord = Instance.new("TextButton")
btnDiscord.Size = UDim2.new(0, 440, 0, 45)
btnDiscord.Position = UDim2.new(0.5, -220, 0, 210)
btnDiscord.BackgroundColor3 = PURPLE_NEON
btnDiscord.Text = "🎧 SUPORTE NO DISCORD"
btnDiscord.TextColor3 = Color3.new(1,1,1)
btnDiscord.Font = Enum.Font.GothamBold
btnDiscord.Parent = mainFrame
Instance.new("UICorner", btnDiscord)

-- Status Feedback
local feedback = Instance.new("TextLabel")
feedback.Size = UDim2.new(1, 0, 0, 30)
feedback.Position = UDim2.new(0, 0, 0, 270)
feedback.BackgroundTransparency = 1
feedback.Text = ""
feedback.TextColor3 = Color3.new(1,1,1)
feedback.Font = Enum.Font.GothamBold
feedback.Parent = mainFrame

-----------------------------------------------------------
-- LÓGICA
-----------------------------------------------------------
btnCheck.MouseButton1Click:Connect(function()
    if inputKey.Text == KEY_CORRETA then
        feedback.TextColor3 = GREEN_NEON
        feedback.Text = "✅ Key Válida! Autorizando..."
        task.wait(1.5)
        screenBlock:Destroy()
        -- Chame sua função do HUB aqui
    else
        feedback.TextColor3 = Color3.fromRGB(255, 80, 80)
        feedback.Text = "❌ Key Incorreta!"
    end
end)

btnGet.MouseButton1Click:Connect(function() setclipboard(LINK_GET_KEY) feedback.Text = "Link GET KEY copiado!" end)
btnPrimion.MouseButton1Click:Connect(function() setclipboard(LINK_GAMEPASS) feedback.Text = "Link PRIMION copiado!" end)
btnDiscord.MouseButton1Click:Connect(function() setclipboard(LINK_DISCORD) feedback.Text = "Link DISCORD copiado!" end)
