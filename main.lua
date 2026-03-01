local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- CONFIGURAÇÕES ORIGINAIS
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_GET_KEY = "https://link-encurtador.com/exemplo" 
local KEY_CORRETA = "key-htpjvg"

-- LIMPEZA
if playerGui:FindFirstChild("PrimionFinalV2") then playerGui.PrimionFinalV2:Destroy() end

local sg = Instance.new("ScreenGui")
sg.Name = "PrimionFinalV2"
sg.IgnoreGuiInset = true
sg.Parent = playerGui

-- FUNDO ESCURO COM DESFOQUE (SIMULADO)
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 680, 0, 420)
main.Position = UDim2.new(0.5, -340, 0.5, -210)
main.BackgroundColor3 = Color3.fromRGB(10, 15, 20)
main.BorderSizePixel = 0
main.Parent = sg

local cornerMain = Instance.new("UICorner", main)
cornerMain.CornerRadius = UDim.new(0, 20)

local strokeMain = Instance.new("UIStroke", main)
strokeMain.Thickness = 2
strokeMain.Color = Color3.fromRGB(40, 50, 65)

-- TÍTULO (Dourado e Azul como na foto)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, -80)
title.Text = "PRIMION EXECUTOR"
title.TextColor3 = Color3.fromRGB(255, 215, 100)
title.Font = Enum.Font.GothamBold
title.TextSize = 32
title.BackgroundTransparency = 1
title.Parent = main

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 30)
subtitle.Position = UDim2.new(0, 0, 0, -45)
subtitle.Text = "KEY AUTHORIZATION"
subtitle.TextColor3 = Color3.fromRGB(100, 180, 255)
subtitle.Font = Enum.Font.GothamBold
subtitle.TextSize = 28
subtitle.BackgroundTransparency = 1
subtitle.Parent = main

-- ÍCONE CENTRAL (Círculo da Chave)
local iconCircle = Instance.new("Frame")
iconCircle.Size = UDim2.new(0, 90, 0, 90)
iconCircle.Position = UDim2.new(0.5, -45, 0, -45)
iconCircle.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
iconCircle.Parent = main
Instance.new("UICorner", iconCircle).CornerRadius = UDim.new(1, 0)
local iconStroke = Instance.new("UIStroke", iconCircle)
iconStroke.Thickness = 3
iconStroke.Color = Color3.fromRGB(0, 255, 150)

local keyEmoji = Instance.new("TextLabel")
keyEmoji.Size = UDim2.new(1, 0, 1, 0)
keyEmoji.Text = "🗝️"
keyEmoji.TextSize = 45
keyEmoji.BackgroundTransparency = 1
keyEmoji.Parent = iconCircle

-----------------------------------------------------------
-- COLUNA ESQUERDA (BOTÕES)
-----------------------------------------------------------
local function CreateButton(text, subtext, pos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 280, 0, 75)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
    btn.Text = ""
    btn.Parent = main
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 15)
    
    local s = Instance.new("UIStroke", btn)
    s.Thickness = 2
    s.Color = color
    
    local t1 = Instance.new("TextLabel")
    t1.Size = UDim2.new(1, -20, 0.5, 0)
    t1.Position = UDim2.new(0, 15, 0.15, 0)
    t1.Text = text
    t1.TextColor3 = color
    t1.Font = Enum.Font.GothamBold
    t1.TextSize = 20
    t1.TextXAlignment = Enum.TextXAlignment.Left
    t1.BackgroundTransparency = 1
    t1.Parent = btn

    local t2 = Instance.new("TextLabel")
    t2.Size = UDim2.new(1, -20, 0.4, 0)
    t2.Position = UDim2.new(0, 15, 0.55, 0)
    t2.Text = subtext
    t2.TextColor3 = Color3.fromRGB(180, 180, 180)
    t2.Font = Enum.Font.Gotham
    t2.TextSize = 14
    t2.TextXAlignment = Enum.TextXAlignment.Left
    t2.BackgroundTransparency = 1
    t2.Parent = btn
    
    return btn
end

local btnGet = CreateButton("GET KEY", "Obtain free access", UDim2.new(0, 40, 0, 80), Color3.fromRGB(0, 255, 127))
local btnPremium = CreateButton("KEY PRIMION", "Lifetime Access", UDim2.new(0, 40, 0, 180), Color3.fromRGB(255, 180, 50))
local btnSupport = CreateButton("SUPPORTe", "Atendimento", UDim2.new(0, 40, 0, 280), Color3.fromRGB(150, 150, 255))

-----------------------------------------------------------
-- COLUNA DIREITA (INPUT E CHECK)
-----------------------------------------------------------
-- Barra de Progresso
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0, 280, 0, 10)
barBg.Position = UDim2.new(0, 360, 0, 80)
barBg.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
barBg.Parent = main
Instance.new("UICorner", barBg)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0.7, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
barFill.Parent = barBg
Instance.new("UICorner", barFill)

-- TextBox
local input = Instance.new("TextBox")
input.Size = UDim2.new(0, 280, 0, 75)
input.Position = UDim2.new(0, 360, 0, 115)
input.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
input.Text = ""
input.PlaceholderText = "Cole a sua chave aqui... I"
input.TextColor3 = Color3.new(1,1,1)
input.Font = Enum.Font.Gotham
input.TextSize = 16
input.Parent = main
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 15)
Instance.new("UIStroke", input).Color = Color3.fromRGB(60, 70, 85)

-- Botão CHECK
local btnCheck = Instance.new("TextButton")
btnCheck.Size = UDim2.new(0, 280, 0, 75)
btnCheck.Position = UDim2.new(0, 360, 0, 215)
btnCheck.BackgroundColor3 = Color3.fromRGB(30, 50, 40)
btnCheck.Text = "CHECK KEY"
btnCheck.TextColor3 = Color3.fromRGB(0, 255, 127)
btnCheck.Font = Enum.Font.GothamBold
btnCheck.TextSize = 22
btnCheck.Parent = main
Instance.new("UICorner", btnCheck).CornerRadius = UDim.new(0, 15)
local sCheck = Instance.new("UIStroke", btnCheck)
sCheck.Thickness = 3
sCheck.Color = Color3.fromRGB(0, 255, 127)

-- Feedback Labels
local feedbackValid = Instance.new("TextLabel")
feedbackValid.Size = UDim2.new(0, 280, 0, 30)
feedbackValid.Position = UDim2.new(0, 360, 0, 305)
feedbackValid.Text = "✅ Key Válida! Autorizando..."
feedbackValid.TextColor3 = Color3.fromRGB(0, 255, 127)
feedbackValid.BackgroundTransparency = 1
feedbackValid.Font = Enum.Font.GothamBold
feedbackValid.TextSize = 16
feedbackValid.Visible = false
feedbackValid.Parent = main

local feedbackInvalid = Instance.new("TextLabel")
feedbackInvalid.Size = UDim2.new(0, 280, 0, 30)
feedbackInvalid.Position = UDim2.new(0, 360, 0, 340)
feedbackInvalid.Text = "❌ Key Incorreta!"
feedbackInvalid.TextColor3 = Color3.fromRGB(255, 80, 80)
feedbackInvalid.BackgroundTransparency = 1
feedbackInvalid.Font = Enum.Font.GothamBold
feedbackInvalid.TextSize = 16
feedbackInvalid.Visible = false
feedbackInvalid.Parent = main

-- Rodapé
local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 30)
footer.Position = UDim2.new(0, 0, 1, 10)
footer.Text = "PRIMION KEY SYSTEM V2.0"
footer.TextColor3 = Color3.fromRGB(120, 130, 145)
footer.Font = Enum.Font.GothamBold
footer.TextSize = 16
footer.BackgroundTransparency = 1
footer.Parent = main

-----------------------------------------------------------
-- LÓGICA FINAL
-----------------------------------------------------------
local function Autorizar()
    feedbackValid.Visible = true
    task.wait(1.5)
    sg:Destroy()
    print("Acesso Liberado!") -- Aqui você coloca o código do seu painel principal
end

btnCheck.MouseButton1Click:Connect(function()
    feedbackInvalid.Visible = false
    if input.Text == KEY_CORRETA then
        Autorizar()
    else
        feedbackInvalid.Visible = true
        -- Efeito de shake
        local op = main.Position
        for i = 1, 8 do
            main.Position = op + UDim2.new(0, math.random(-5,5), 0, 0)
            task.wait(0.04)
        end
        main.Position = op
    end
end)

btnGet.MouseButton1Click:Connect(function() setclipboard(LINK_GET_KEY) end)
btnPremium.MouseButton1Click:Connect(function() setclipboard(LINK_GAMEPASS) end)
btnSupport.MouseButton1Click:Connect(function() setclipboard(LINK_DISCORD) end)
