-- PRIMION EXECUTOR V2.0 - FIDELIDADE TOTAL À IMAGEM
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- CONFIGURAÇÕES ORIGINAIS
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_GET_KEY = "https://link-encurtador.com/exemplo" 
local KEY_CORRETA = "key-htpjvg"

-- CORES DA IMAGEM
local BG_COLOR = Color3.fromRGB(12, 18, 24)
local CARD_COLOR = Color3.fromRGB(18, 25, 32)
local GREEN_NEON = Color3.fromRGB(0, 255, 127)
local GOLD_NEON = Color3.fromRGB(255, 215, 0)
local PURPLE_NEON = Color3.fromRGB(114, 137, 218)

-----------------------------------------------------------
-- UI PRINCIPAL (REPRODUÇÃO DA FOTO)
-----------------------------------------------------------
local screen = Instance.new("ScreenGui")
screen.Name = "PrimionV2_Fiel"
screen.IgnoreGuiInset = true
screen.Parent = playerGui

-- Fundo escuro total (Background da foto)
local bgFull = Instance.new("Frame")
bgFull.Size = UDim2.new(1, 0, 1, 0)
bgFull.BackgroundColor3 = BG_COLOR
bgFull.Parent = screen

-- Título Principal (Topo)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 100)
title.Position = UDim2.new(0, 0, 0, 20)
title.Text = "PRIMION EXECUTOR\nKEY AUTHORIZATION"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 30
title.BackgroundTransparency = 1
title.Parent = bgFull

-- Painel Central (O retângulo da imagem)
local mainCard = Instance.new("Frame")
mainCard.Size = UDim2.new(0, 650, 0, 380)
mainCard.Position = UDim2.new(0.5, -325, 0.5, -140)
mainCard.BackgroundColor3 = CARD_COLOR
mainCard.Parent = bgFull
Instance.new("UICorner", mainCard).CornerRadius = UDim.new(0, 20)
local stroke = Instance.new("UIStroke", mainCard)
stroke.Color = Color3.fromRGB(40, 50, 60)
stroke.Thickness = 2

-- Ícone de Chave (Círculo no Topo do Card)
local keyIconFrame = Instance.new("Frame")
keyIconFrame.Size = UDim2.new(0, 80, 0, 80)
keyIconFrame.Position = UDim2.new(0.5, -40, 0, -40)
keyIconFrame.BackgroundColor3 = CARD_COLOR
keyIconFrame.Parent = mainCard
Instance.new("UICorner", keyIconFrame).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", keyIconFrame).Color = GREEN_NEON

local keyEmoji = Instance.new("TextLabel")
keyEmoji.Size = UDim2.new(1, 0, 1, 0)
keyEmoji.Text = "🔑"
keyEmoji.TextSize = 40
keyEmoji.BackgroundTransparency = 1
keyEmoji.Parent = keyIconFrame

-- COLUNA ESQUERDA (BOTÕES DE AÇÃO)
local leftColumn = Instance.new("Frame")
leftColumn.Size = UDim2.new(0.45, 0, 0.8, 0)
leftColumn.Position = UDim2.new(0.05, 0, 0.15, 0)
leftColumn.BackgroundTransparency = 1
leftColumn.Parent = mainCard

local listLeft = Instance.new("UIListLayout")
listLeft.Padding = UDim.new(0, 15)
listLeft.Parent = leftColumn

local function CreateLeftButton(text, color, icon)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 60)
    btn.BackgroundColor3 = CARD_COLOR
    btn.Text = "      " .. text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = leftColumn
    
    local c = Instance.new("UICorner", btn)
    local s = Instance.new("UIStroke", btn)
    s.Color = color
    s.Thickness = 2
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    
    return btn
end

local btnGet = CreateLeftButton("GET KEY", GREEN_NEON)
local btnPrimion = CreateLeftButton("KEY PRIMION\nLifetime Access", GOLD_NEON)
local btnDiscord = CreateLeftButton("SUPPORTe\nAtendimento", PURPLE_NEON)

-- COLUNA DIREITA (INPUT E CHECK)
local rightColumn = Instance.new("Frame")
rightColumn.Size = UDim2.new(0.45, 0, 0.8, 0)
rightColumn.Position = UDim2.new(0.5, 0, 0.15, 0)
rightColumn.BackgroundTransparency = 1
rightColumn.Parent = mainCard

-- Barra de Progresso Sutil (como na foto)
local progBase = Instance.new("Frame")
progBase.Size = UDim2.new(1, 0, 0, 10)
progBase.Position = UDim2.new(0, 0, 0.1, 0)
progBase.BackgroundColor3 = Color3.fromRGB(30, 40, 50)
progBase.Parent = rightColumn
local progFill = Instance.new("Frame")
progFill.Size = UDim2.new(0.7, 0, 1, 0)
progFill.BackgroundColor3 = Color3.fromRGB(100, 150, 200)
progFill.Parent = progBase

-- TextBox (Caixa de Key)
local inputKey = Instance.new("TextBox")
inputKey.Size = UDim2.new(1, 0, 0, 60)
inputKey.Position = UDim2.new(0, 0, 0.25, 0)
inputKey.BackgroundColor3 = Color3.fromRGB(25, 35, 45)
inputKey.Text = ""
inputKey.PlaceholderText = "Cole a sua chave aqui... I"
inputKey.TextColor3 = Color3.new(1,1,1)
inputKey.Font = Enum.Font.Gotham
inputKey.TextSize = 16
inputKey.Parent = rightColumn
Instance.new("UICorner", inputKey)
Instance.new("UIStroke", inputKey).Color = Color3.fromRGB(60, 70, 80)

-- Botão CHECK KEY
local btnCheck = Instance.new("TextButton")
btnCheck.Size = UDim2.new(1, 0, 0, 60)
btnCheck.Position = UDim2.new(0, 0, 0.5, 0)
btnCheck.BackgroundColor3 = Color3.fromRGB(30, 60, 40)
btnCheck.Text = "CHECK KEY"
btnCheck.TextColor3 = GREEN_NEON
btnCheck.Font = Enum.Font.GothamBold
btnCheck.TextSize = 18
btnCheck.Parent = rightColumn
Instance.new("UICorner", btnCheck)
Instance.new("UIStroke", btnCheck).Color = GREEN_NEON

-- Feedback (Status na foto)
local feedback = Instance.new("TextLabel")
feedback.Size = UDim2.new(1, 0, 0, 40)
feedback.Position = UDim2.new(0, 0, 0.75, 0)
feedback.BackgroundTransparency = 1
feedback.Text = ""
feedback.Font = Enum.Font.GothamBold
feedback.TextSize = 14
feedback.Parent = rightColumn

-- Rodapé
local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 50)
footer.Position = UDim2.new(0, 0, 1, -50)
footer.Text = "PRIMION KEY SYSTEM V2.0"
footer.TextColor3 = Color3.fromRGB(100, 110, 120)
footer.Font = Enum.Font.GothamBold
footer.BackgroundTransparency = 1
footer.Parent = bgFull

-----------------------------------------------------------
-- LÓGICA E PAINEL (MANTIDOS)
-----------------------------------------------------------
local function AbrirPainelPrincipal()
    screen:Destroy()
    -- [Aqui entra o código do seu painel de funções original]
    print("Painel Aberto com Sucesso!")
end

btnCheck.MouseButton1Click:Connect(function()
    if inputKey.Text == KEY_CORRETA then
        feedback.TextColor3 = Color3.fromRGB(0, 255, 0)
        feedback.Text = "✅ Key Válida! Autorizando..."
        task.wait(1)
        AbrirPainelPrincipal()
    else
        feedback.TextColor3 = Color3.fromRGB(255, 0, 0)
        feedback.Text = "❌ Key Incorreta!"
    end
end)

-- Botões de Cópia
btnGet.MouseButton1Click:Connect(function() setclipboard(LINK_GET_KEY) feedback.Text = "Link copiado!" end)
btnPrimion.MouseButton1Click:Connect(function() setclipboard(LINK_GAMEPASS) feedback.Text = "Link Premium copiado!" end)
btnDiscord.MouseButton1Click:Connect(function() setclipboard(LINK_DISCORD) feedback.Text = "Discord copiado!" end)
