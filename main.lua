local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- PALETA DE CORES V2.0 (FIEL À SEGUNDA IMAGEM)
local COLORS = {
    MainBG = Color3.fromRGB(12, 12, 18),
    Glass = Color3.fromRGB(20, 20, 28),
    GreenNeon = Color3.fromRGB(0, 255, 128),
    BlueNeon = Color3.fromRGB(0, 170, 255),
    GoldNeon = Color3.fromRGB(255, 190, 60),
    PurpleNeon = Color3.fromRGB(160, 80, 255),
    Border = Color3.fromRGB(45, 45, 60)
}

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV4") then playerGui.PrimionV4:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4"
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- FUNÇÃO: HUB PRINCIPAL (EXEMPLO DE FUNÇÃO)
-----------------------------------------------------------
local function AbrirHubPrincipal()
    -- Aqui entra o seu Hub com as funções (Player, ESP, etc)
    -- e o botão flutuante da estrela Galáxia.
    print("Autorizado! Abrindo Primion Hub...")
end

-----------------------------------------------------------
-- TELA DE LOGIN ESTILO V2.0 (DESIGN "MELHOR")
-----------------------------------------------------------
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 650, 0, 380)
mainFrame.Position = UDim2.new(0.5, -325, 0.5, -190)
mainFrame.BackgroundColor3 = COLORS.MainBG
mainFrame.Parent = sg
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Thickness = 1.5
mainStroke.Color = COLORS.Border

-- TÍTULOS SUPERIORES
local titleMain = Instance.new("TextLabel")
titleMain.Size = UDim2.new(1, 0, 0, 40)
titleMain.Position = UDim2.new(0, 0, 0, 15)
titleMain.Text = "PRIMION EXECUTOR"
titleMain.TextColor3 = COLORS.GoldNeon
titleMain.Font = Enum.Font.GothamBold
titleMain.TextSize = 26
titleMain.BackgroundTransparency = 1
titleMain.Parent = mainFrame

local titleSub = Instance.new("TextLabel")
titleSub.Size = UDim2.new(1, 0, 0, 20)
titleSub.Position = UDim2.new(0, 0, 0, 45)
titleSub.Text = "KEY AUTHORIZATION"
titleSub.TextColor3 = COLORS.BlueNeon
titleSub.Font = Enum.Font.GothamBold
titleSub.TextSize = 16
titleSub.BackgroundTransparency = 1
titleSub.Parent = mainFrame

-- ÍCONE DE CHAVE (CÍRCULO CENTRAL)
local iconCircle = Instance.new("Frame")
iconCircle.Size = UDim2.new(0, 70, 0, 70)
iconCircle.Position = UDim2.new(0.5, -35, 0, 80)
iconCircle.BackgroundColor3 = COLORS.Glass
iconCircle.Parent = mainFrame
Instance.new("UICorner", iconCircle).CornerRadius = UDim.new(1, 0)
local iconStroke = Instance.new("UIStroke", iconCircle)
iconStroke.Color = COLORS.BlueNeon
iconStroke.Thickness = 2

local iconLabel = Instance.new("TextLabel")
iconLabel.Size = UDim2.new(1, 0, 1, 0)
iconLabel.Text = "🔑"
iconLabel.TextSize = 35
iconLabel.BackgroundTransparency = 1
iconLabel.Parent = iconCircle

-- PAINEL LATERAL ESQUERDO (BOTÕES)
local leftPanel = Instance.new("Frame")
leftPanel.Size = UDim2.new(0, 240, 0, 180)
leftPanel.Position = UDim2.new(0, 30, 0, 160)
leftPanel.BackgroundTransparency = 1
leftPanel.Parent = mainFrame

local function CreateSideBtn(name, subText, color, icon, pos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 55)
    btn.Position = pos
    btn.BackgroundColor3 = COLORS.Glass
    btn.Text = ""
    btn.Parent = leftPanel
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    local s = Instance.new("UIStroke", btn)
    s.Color = color
    s.Thickness = 1.2

    local i = Instance.new("TextLabel")
    i.Size = UDim2.new(0, 35, 0, 35)
    i.Position = UDim2.new(0, 10, 0.5, -17)
    i.BackgroundColor3 = color
    i.Text = icon
    i.TextColor3 = Color3.new(1,1,1)
    i.Parent = btn
    Instance.new("UICorner", i).CornerRadius = UDim.new(0, 8)

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -60, 0, 20)
    t.Position = UDim2.new(0, 55, 0.2, 0)
    t.Text = name
    t.TextColor3 = Color3.new(1,1,1)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 14
    t.TextXAlignment = "Left"
    t.BackgroundTransparency = 1
    t.Parent = btn

    local st = Instance.new("TextLabel")
    st.Size = UDim2.new(1, -60, 0, 15)
    st.Position = UDim2.new(0, 55, 0.55, 0)
    st.Text = subText
    st.TextColor3 = Color3.fromRGB(180, 180, 180)
    st.Font = Enum.Font.Gotham
    st.TextSize = 11
    st.TextXAlignment = "Left"
    st.BackgroundTransparency = 1
    st.Parent = btn
    
    return btn
end

local btnGet = CreateSideBtn("GET KEY", "Obter chave gratuita", COLORS.GreenNeon, "📥", UDim2.new(0,0,0,0))
local btnPremium = CreateSideBtn("KEY PRIMION", "Lifetime Access", COLORS.GoldNeon, "⭐", UDim2.new(0,0,0,65))
local btnSupport = CreateSideBtn("SUPPORTe", "Atendimento", COLORS.PurpleNeon, "💬", UDim2.new(0,0,0,130))

-- PAINEL DIREITO (ENTRADA)
local rightPanel = Instance.new("Frame")
rightPanel.Size = UDim2.new(0, 330, 0, 180)
rightPanel.Position = UDim2.new(0, 290, 0, 160)
rightPanel.BackgroundTransparency = 1
rightPanel.Parent = mainFrame

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, 0, 0, 50)
input.BackgroundColor3 = COLORS.Glass
input.PlaceholderText = "Cole a sua chave aqui..."
input.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
input.Text = ""
input.TextColor3 = Color3.new(1,1,1)
input.Font = Enum.Font.Gotham
input.TextSize = 15
input.Parent = rightPanel
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", input).Color = COLORS.Border

local checkBtn = Instance.new("TextButton")
checkBtn.Size = UDim2.new(1, 0, 0, 60)
checkBtn.Position = UDim2.new(0, 0, 0, 70)
checkBtn.BackgroundColor3 = Color3.fromRGB(15, 30, 25)
checkBtn.Text = "CHECK KEY"
checkBtn.TextColor3 = COLORS.GreenNeon
checkBtn.Font = Enum.Font.GothamBold
checkBtn.TextSize = 20
checkBtn.Parent = rightPanel
Instance.new("UICorner", checkBtn).CornerRadius = UDim.new(0, 12)
local checkStroke = Instance.new("UIStroke", checkBtn)
checkStroke.Color = COLORS.GreenNeon
checkStroke.Thickness = 2

-- Mensagens de Status (O detalhe das bolinhas verde/vermelha)
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 30)
statusLabel.Position = UDim2.new(0, 0, 0, 140)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Aguardando chave..."
statusLabel.TextColor3 = Color3.fromRGB(120, 120, 150)
statusLabel.Font = Enum.Font.GothamMedium
statusLabel.TextSize = 14
statusLabel.Parent = rightPanel

-- AÇÃO DE VERIFICAR
checkBtn.MouseButton1Click:Connect(function()
    if input.Text:gsub("%s+", "") == KEY_CORRETA then
        statusLabel.Text = "✅ Key Válida! Autorizando..."
        statusLabel.TextColor3 = COLORS.GreenNeon
        task.wait(1.5)
        mainFrame:Destroy()
        AbrirHubPrincipal()
    else
        statusLabel.Text = "❌ Key Incorreta!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        input.Text = ""
    end
end)

-- Clipeboards
btnGet.MouseButton1Click:Connect(function() setclipboard("LINK_DA_KEY_AQUI") end)
btnPremium.MouseButton1Click:Connect(function() setclipboard(LINK_GAMEPASS) end)
