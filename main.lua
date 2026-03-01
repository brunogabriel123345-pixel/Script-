local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GET_KEY = "Https://link-hub.net/3920699/Bb9WkaqTBZsg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

local COLORS = {
    MainBG = Color3.fromRGB(15, 15, 23),
    Glass = Color3.fromRGB(22, 22, 31),
    GreenNeon = Color3.fromRGB(0, 255, 128),
    BlueNeon = Color3.fromRGB(0, 170, 255),
    GoldNeon = Color3.fromRGB(255, 190, 60),
    PurpleNeon = Color3.fromRGB(160, 80, 255),
    Border = Color3.fromRGB(40, 40, 50),
    Text = Color3.new(1, 1, 1)
}

if playerGui:FindFirstChild("PrimionV4") then playerGui.PrimionV4:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4"
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- FUNÇÃO: HUB PRINCIPAL (GUI)
-----------------------------------------------------------
local function AbrirHubPrincipal()
    local mainHub = Instance.new("Frame")
    mainHub.Size = UDim2.new(0, 600, 0, 380)
    mainHub.Position = UDim2.new(0.5, -300, 0.5, -190)
    mainHub.BackgroundColor3 = COLORS.MainBG
    mainHub.Parent = sg
    Instance.new("UICorner", mainHub)
    Instance.new("UIStroke", mainHub).Color = COLORS.BlueNeon

    -- [Aqui você pode colocar as funções que já criamos antes]
    print("Hub Primion Ativado")
end

-----------------------------------------------------------
-- TELA DE LOGIN (CORREÇÃO DE POSICIONAMENTO DOS NOMES)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 650, 0, 380)
loginFrame.Position = UDim2.new(0.5, -325, 0.5, -175)
loginFrame.BackgroundColor3 = COLORS.MainBG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)

-- Títulos
local t1 = Instance.new("TextLabel")
t1.Size = UDim2.new(1, 0, 0, 40)
t1.Position = UDim2.new(0, 0, 0, 15)
t1.Text = "PRIMION EXECUTOR"
t1.TextColor3 = COLORS.GoldNeon
t1.Font = "GothamBold"
t1.TextSize = 26
t1.BackgroundTransparency = 1
t1.Parent = loginFrame

-- PAINEL ESQUERDO
local lp = Instance.new("Frame")
lp.Size = UDim2.new(0, 260, 0, 200)
lp.Position = UDim2.new(0, 30, 0, 140)
lp.BackgroundTransparency = 1
lp.Parent = loginFrame

local function CreateLoginBtn(name, color, icon, pos)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 55)
    b.Position = pos
    b.BackgroundColor3 = COLORS.Glass
    b.Text = "" -- Deixa vazio para não bugar
    b.Parent = lp
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", b).Color = color

    -- QUADRADO DO ÍCONE
    local il = Instance.new("TextLabel")
    il.Size = UDim2.new(0, 38, 0, 38)
    il.Position = UDim2.new(0, 10, 0.5, -19)
    il.BackgroundColor3 = color
    il.Text = icon
    il.TextColor3 = Color3.new(1,1,1)
    il.TextSize = 20
    il.Parent = b
    Instance.new("UICorner", il)

    -- NOME (MOVIDO MAIS PARA A DIREITA - CORREÇÃO AQUI)
    local tl = Instance.new("TextLabel")
    tl.Size = UDim2.new(1, -70, 1, 0)
    tl.Position = UDim2.new(0, 65, 0, 0) -- Movido 65 pixels para a direita
    tl.Text = name
    tl.TextColor3 = COLORS.Text
    tl.Font = "GothamBold"
    tl.TextSize = 15
    tl.TextXAlignment = Enum.TextXAlignment.Left -- Alinhado à esquerda após o ícone
    tl.BackgroundTransparency = 1
    tl.Parent = b

    return b
end

local btnGet = CreateLoginBtn("GET KEY", COLORS.GreenNeon, "📥", UDim2.new(0,0,0,0))
local btnPremium = CreateLoginBtn("KEY PRIMION", COLORS.GoldNeon, "⭐", UDim2.new(0,0,0,65))
local btnSupport = CreateLoginBtn("SUPPORT", COLORS.PurpleNeon, "💬", UDim2.new(0,0,0,130))

-- PAINEL DIREITO
local rp = Instance.new("Frame")
rp.Size = UDim2.new(0, 310, 0, 200)
rp.Position = UDim2.new(0, 310, 0, 140)
rp.BackgroundTransparency = 1
rp.Parent = loginFrame

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, 0, 0, 50)
input.BackgroundColor3 = COLORS.Glass
input.Text = LINK_GET_KEY -- Já vem com seu link
input.TextColor3 = Color3.fromRGB(200, 200, 200)
input.ClearTextOnFocus = false
input.Parent = rp
Instance.new("UICorner", input)

local check = Instance.new("TextButton")
check.Size = UDim2.new(1, 0, 0, 60)
check.Position = UDim2.new(0, 0, 0, 75)
check.BackgroundColor3 = Color3.fromRGB(15, 30, 20)
check.Text = "CHECK KEY"
check.TextColor3 = COLORS.GreenNeon
check.Font = "GothamBold"
check.TextSize = 22
check.Parent = rp
Instance.new("UICorner", check)
Instance.new("UIStroke", check).Color = COLORS.GreenNeon

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 145)
status.BackgroundTransparency = 1
status.Text = "Aguardando chave..."
status.TextColor3 = Color3.fromRGB(150, 150, 150)
status.Parent = rp

-- LÓGICA
btnGet.MouseButton1Click:Connect(function()
    setclipboard(LINK_GET_KEY)
    status.Text = "✅ Link de Key copiado!"
    status.TextColor3 = COLORS.GreenNeon
end)

check.MouseButton1Click:Connect(function()
    if input.Text:gsub("%s+", "") == KEY_CORRETA then
        status.Text = "✅ Autorizado!"
        loginFrame:Destroy()
        AbrirHubPrincipal()
    else
        status.Text = "❌ Chave Errada!"
        status.TextColor3 = Color3.new(1, 0, 0)
    end
end)
