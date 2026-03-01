-- PRIMION KEY SYSTEM V2.1 - LAYOUT HORIZONTAL (ORDEM ESPECÍFICA)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- CONFIGURAÇÕES
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_GET_KEY = "https://link-encurtador.com/exemplo" 
local KEY_CORRETA = "key-htpjvg"

-- CORES
local COLORS = {
    BG = Color3.fromRGB(15, 15, 20),
    Gold = Color3.fromRGB(255, 200, 50),
    Green = Color3.fromRGB(0, 255, 100),
    Purple = Color3.fromRGB(120, 120, 250),
    InputBG = Color3.fromRGB(25, 25, 35)
}

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV2_Ajustado") then playerGui.PrimionV2_Ajustado:Destroy() end

local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV2_Ajustado"
sg.IgnoreGuiInset = true
sg.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 500, 0, 350)
main.Position = UDim2.new(0.5, -250, 0.5, -175)
main.BackgroundColor3 = COLORS.BG
main.Parent = sg
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 20)
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = Color3.fromRGB(45, 50, 65)
mainStroke.Thickness = 2

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 15)
title.Text = "PRIMION EXECUTOR"
title.TextColor3 = COLORS.Gold
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.BackgroundTransparency = 1
title.Parent = main

-----------------------------------------------------------
-- CONTAINER DOS BOTÕES (ACIMA DA BARRA)
-----------------------------------------------------------
local btnFrame = Instance.new("Frame")
btnFrame.Size = UDim2.new(0, 460, 0, 50)
btnFrame.Position = UDim2.new(0.5, -230, 0, 85) -- Posição acima da barra
btnFrame.BackgroundTransparency = 1
btnFrame.Parent = main

local layout = Instance.new("UIListLayout")
layout.FillDirection = Enum.FillDirection.Horizontal
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Padding = UDim.new(0, 8)
layout.Parent = btnFrame

local function CreateBtn(text, color, textColor)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 145, 1, 0) -- Tamanho para caber os 3 lado a lado
    b.BackgroundColor3 = color
    b.Text = text
    b.TextColor3 = textColor or Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.Parent = btnFrame
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    return b
end

-- CRIAÇÃO NA ORDEM SOLICITADA
local btnGet = CreateBtn("GET KEY", COLORS.Green)
local btnCheck = CreateBtn("CHECK KEY", Color3.fromRGB(30, 60, 45))
local btnPrimion = CreateBtn("KEY PRIMION", COLORS.Gold, Color3.new(0,0,0))

-- Ajuste de brilho no Check Key para não ofuscar
local checkStroke = Instance.new("UIStroke", btnCheck)
checkStroke.Color = COLORS.Green
checkStroke.Thickness = 1.5

-----------------------------------------------------------
-- BARRA DE DIGITAR (LOGUE ABAIXO)
-----------------------------------------------------------
local input = Instance.new("TextBox")
input.Size = UDim2.new(0, 450, 0, 55)
input.Position = UDim2.new(0.5, -225, 0, 145) -- Logo abaixo dos botões
input.BackgroundColor3 = COLORS.InputBG
input.PlaceholderText = "Cole a sua chave aqui... I"
input.Text = ""
input.TextColor3 = Color3.new(1,1,1)
input.Font = Enum.Font.Gotham
input.TextSize = 16
input.Parent = main
Instance.new("UICorner", input)
local inputStroke = Instance.new("UIStroke", input)
inputStroke.Color = Color3.fromRGB(60, 65, 85)

-- Botão de Suporte (embaixo)
local btnSupport = Instance.new("TextButton")
btnSupport.Size = UDim2.new(0, 450, 0, 45)
btnSupport.Position = UDim2.new(0.5, -225, 0, 215)
btnSupport.BackgroundColor3 = COLORS.Purple
btnSupport.Text = "🎧 SUPORTE NO DISCORD"
btnSupport.Font = Enum.Font.GothamBold
btnSupport.TextColor3 = Color3.new(1,1,1)
btnSupport.Parent = main
Instance.new("UICorner", btnSupport)

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 280)
status.BackgroundTransparency = 1
status.Text = ""
status.Font = Enum.Font.GothamBold
status.TextColor3 = Color3.new(1,1,1)
status.Parent = main

-----------------------------------------------------------
-- CONEXÕES
-----------------------------------------------------------
btnCheck.MouseButton1Click:Connect(function()
    if input.Text == KEY_CORRETA then
        status.TextColor3 = COLORS.Green
        status.Text = "✅ ACESSO LIBERADO!"
        task.wait(1)
        sg:Destroy() -- Aqui você chama a sua GUI de funções
    else
        status.TextColor3 = Color3.fromRGB(255, 80, 80)
        status.Text = "❌ CHAVE INCORRETA!"
    end
end)

btnGet.MouseButton1Click:Connect(function() setclipboard(LINK_GET_KEY) status.Text = "Link copiado!" end)
btnPrimion.MouseButton1Click:Connect(function() setclipboard(LINK_GAMEPASS) status.Text = "Link Premium copiado!" end)
btnSupport.MouseButton1Click:Connect(function() setclipboard(LINK_DISCORD) status.Text = "Discord copiado!" end)
