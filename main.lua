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

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV4") then playerGui.PrimionV4:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4"
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- 1. FUNÇÃO: HUB PRINCIPAL (GUI)
-----------------------------------------------------------
local function AbrirHubPrincipal()
    local mainHub = Instance.new("Frame")
    mainHub.Name = "MainHub"
    mainHub.Size = UDim2.new(0, 600, 0, 380)
    mainHub.Position = UDim2.new(0.5, -300, 0.5, -190)
    mainHub.BackgroundColor3 = COLORS.MainBG
    mainHub.Parent = sg
    mainHub.Visible = true
    Instance.new("UICorner", mainHub)
    Instance.new("UIStroke", mainHub).Color = COLORS.BlueNeon

    -- Botão Galáxia (Toggle) incorporado para abrir/fechar
    local tBtn = Instance.new("TextButton")
    tBtn.Size = UDim2.new(0, 50, 0, 50)
    tBtn.Position = UDim2.new(0, 10, 0, 10)
    tBtn.Text = "★"
    tBtn.Parent = sg
    Instance.new("UICorner", tBtn)
    
    tBtn.MouseButton1Click:Connect(function()
        mainHub.Visible = not mainHub.Visible
    end)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Text = "PRIMION HUB ATIVADO"
    title.TextColor3 = Color3.new(1,1,1)
    title.BackgroundTransparency = 1
    title.Parent = mainHub
end

-----------------------------------------------------------
-- 2. TELA DE LOGIN (NOMES REPOSICIONADOS À DIREITA)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 650, 0, 380)
loginFrame.Position = UDim2.new(0.5, -325, 0.5, -175)
loginFrame.BackgroundColor3 = COLORS.MainBG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)

-- Painel Lateral Esquerdo
local lp = Instance.new("Frame")
lp.Size = UDim2.new(0, 280, 0, 200)
lp.Position = UDim2.new(0, 30, 0, 140)
lp.BackgroundTransparency = 1
lp.Parent = loginFrame

local function CreateLoginBtn(name, color, icon, pos)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 55)
    b.Position = pos
    b.BackgroundColor3 = COLORS.Glass
    b.Text = ""
    b.Parent = lp
    Instance.new("UICorner", b)
    Instance.new("UIStroke", b).Color = color

    -- Ícone Lateral
    local il = Instance.new("TextLabel")
    il.Size = UDim2.new(0, 40, 0, 40)
    il.Position = UDim2.new(0, 10, 0.5, -20)
    il.BackgroundColor3 = color
    il.Text = icon
    il.TextColor3 = Color3.new(1,1,1)
    il.Parent = b
    Instance.new("UICorner", il)

    -- NOME DO BOTÃO (MOVIMENTADO PARA A DIREITA)
    local tl = Instance.new("TextLabel")
    tl.Size = UDim2.new(1, -80, 1, 0)
    tl.Position = UDim2.new(0, 75, 0, 0) -- Ajuste de 75px para não sobrepor o ícone
    tl.Text = name
    tl.TextColor3 = COLORS.Text
    tl.Font = "GothamBold"
    tl.TextSize = 16
    tl.TextXAlignment = "Left"
    tl.BackgroundTransparency = 1
    tl.Parent = b

    return b
end

local btnGet = CreateLoginBtn("GET KEY", COLORS.GreenNeon, "📥", UDim2.new(0,0,0,0))
local btnPremium = CreateLoginBtn("KEY PRIMION", COLORS.GoldNeon, "⭐", UDim2.new(0,0,0,65))
local btnSupport = CreateLoginBtn("SUPPORT", COLORS.PurpleNeon, "💬", UDim2.new(0,0,0,130))

-- Painel Direito (Entrada de Chave)
local rp = Instance.new("Frame")
rp.Size = UDim2.new(0, 300, 0, 200)
rp.Position = UDim2.new(0, 320, 0, 140)
rp.BackgroundTransparency = 1
rp.Parent = loginFrame

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, 0, 0, 50)
input.BackgroundColor3 = COLORS.Glass
input.PlaceholderText = "Cole a sua chave aqui..." -- Removido o link da barra
input.Text = ""
input.TextColor3 = Color3.new(1,1,1)
input.Parent = rp
Instance.new("UICorner", input)

local check = Instance.new("TextButton")
check.Size = UDim2.new(1, 0, 0, 60)
check.Position = UDim2.new(0, 0, 0, 75)
check.BackgroundColor3 = Color3.fromRGB(20, 40, 30)
check.Text = "CHECK KEY"
check.TextColor3 = COLORS.GreenNeon
check.Font = "GothamBold"
check.TextSize = 20
check.Parent = rp
Instance.new("UICorner", check)
Instance.new("UIStroke", check).Color = COLORS.GreenNeon

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 145)
status.BackgroundTransparency = 1
status.Text = "Aguardando..."
status.TextColor3 = Color3.new(0.6, 0.6, 0.6)
status.Parent = rp

-- Ações
btnGet.MouseButton1Click:Connect(function()
    setclipboard(LINK_GET_KEY)
    status.Text = "✅ Link copiado!"
end)

check.MouseButton1Click:Connect(function()
    if input.Text == KEY_CORRETA then
        status.Text = "✅ Acesso Liberado!"
        task.wait(1)
        loginFrame:Destroy()
        AbrirHubPrincipal() -- Agora abre o GUI corretamente
    else
        status.Text = "❌ Chave Inválida!"
    end
end)
