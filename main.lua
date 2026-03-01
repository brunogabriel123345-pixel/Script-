local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- ==========================================
-- CONFIGURAÇÕES (EDITE AQUI)
-- ==========================================
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_GET_KEY = "https://link-encurtador.com/exemplo" 
local KEY_CORRETA = "key-htpjvg"

-- CORES V2.0
local COLORS = {
    MainBG = Color3.fromRGB(12, 18, 24),
    GreenNeon = Color3.fromRGB(0, 255, 127),
    Gold = Color3.fromRGB(255, 215, 100),
    AccentBlue = Color3.fromRGB(100, 180, 255),
    ButtonBG = Color3.fromRGB(20, 28, 38)
}

-- LIMPEZA INICIAL
if playerGui:FindFirstChild("PrimionV2_System") then playerGui.PrimionV2_System:Destroy() end

local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV2_System"
sg.IgnoreGuiInset = true
sg.ResetOnSpawn = false
sg.Parent = playerGui

-- ==========================================
-- FUNÇÃO 2: PAINEL DE FUNÇÕES (ABRE APÓS A KEY)
-- ==========================================
local function AbrirPainelPrincipal()
    -- Botão de Toggle (Abrir/Fechar)
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 50, 0, 50)
    toggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
    toggleBtn.BackgroundColor3 = COLORS.MainBG
    toggleBtn.Text = "P"
    toggleBtn.TextColor3 = COLORS.GreenNeon
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 24
    toggleBtn.Parent = sg
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", toggleBtn).Color = COLORS.GreenNeon

    -- Frame do Hub
    local hub = Instance.new("Frame")
    hub.Size = UDim2.new(0, 500, 0, 350)
    hub.Position = UDim2.new(0.5, -250, 0.5, -175)
    hub.BackgroundColor3 = COLORS.MainBG
    hub.Visible = true
    hub.Parent = sg
    Instance.new("UICorner", hub).CornerRadius = UDim.new(0, 15)
    Instance.new("UIStroke", hub).Color = COLORS.GreenNeon

    -- Cabeçalho
    local header = Instance.new("TextLabel")
    header.Size = UDim2.new(1, 0, 0, 50)
    header.Text = "PRIMION EXECUTOR - HUB V2.0"
    header.TextColor3 = COLORS.Gold
    header.Font = Enum.Font.GothamBold
    header.TextSize = 18
    header.BackgroundTransparency = 1
    header.Parent = hub

    -- Lista de Funções
    local container = Instance.new("ScrollingFrame")
    container.Size = UDim2.new(1, -20, 1, -60)
    container.Position = UDim2.new(0, 10, 0, 55)
    container.BackgroundTransparency = 1
    container.ScrollBarThickness = 4
    container.CanvasSize = UDim2.new(0, 0, 0, 600)
    container.Parent = hub
    Instance.new("UIListLayout", container).Padding = UDim.new(0, 10)

    -- Função para adicionar Cheat
    local function AddCheat(name, desc, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.95, 0, 0, 55)
        btn.BackgroundColor3 = COLORS.ButtonBG
        btn.Text = "  " .. name .. "\n  " .. desc
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = container
        Instance.new("UICorner", btn)
        btn.MouseButton1Click:Connect(callback)
    end

    -- EXEMPLOS DE FUNÇÕES
    AddCheat("FLY", "Ativa o modo voo", function() print("Fly!") end)
    AddCheat("WALKSPEED", "Aumenta velocidade", function() player.Character.Humanoid.WalkSpeed = 50 end)

    toggleBtn.MouseButton1Click:Connect(function() hub.Visible = not hub.Visible end)
end

-- ==========================================
-- FUNÇÃO 1: TELA DE KEY (VISUAL DA FOTO)
-- ==========================================
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 680, 0, 420)
main.Position = UDim2.new(0.5, -340, 0.5, -210)
main.BackgroundColor3 = COLORS.MainBG
main.Parent = sg
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 20)
Instance.new("UIStroke", main).Color = Color3.fromRGB(40, 50, 65)

-- Titulo Principal
local t1 = Instance.new("TextLabel")
t1.Size = UDim2.new(1, 0, 0, 40) t1.Position = UDim2.new(0,0,0,-70)
t1.Text = "PRIMION EXECUTOR" t1.TextColor3 = COLORS.Gold
t1.Font = Enum.Font.GothamBold t1.TextSize = 30 t1.BackgroundTransparency = 1 t1.Parent = main

-- Coluna Esquerda
local function CreateBtn(name, sub, pos, col)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 280, 0, 70) b.Position = pos
    b.BackgroundColor3 = COLORS.ButtonBG b.Text = "" b.Parent = main
    Instance.new("UICorner", b)
    Instance.new("UIStroke", b).Color = col
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1,0,1,0) l.Text = name.."\n"..sub l.TextColor3 = col
    l.BackgroundTransparency = 1 l.Font = Enum.Font.GothamBold l.Parent = b
    return b
end

local bGet = CreateBtn("GET KEY", "Free Access", UDim2.new(0,40,0,80), COLORS.GreenNeon)
local bPrem = CreateBtn("KEY PRIMION", "Lifetime", UDim2.new(0,40,0,170), COLORS.Gold)
local bDisc = CreateBtn("SUPPORT", "Discord", UDim2.new(0,40,0,260), COLORS.AccentBlue)

-- Coluna Direita
local input = Instance.new("TextBox")
input.Size = UDim2.new(0,280,0,70) input.Position = UDim2.new(0,360,0,110)
input.BackgroundColor3 = COLORS.ButtonBG input.PlaceholderText = "Cole a key aqui..."
input.TextColor3 = Color3.new(1,1,1) input.Parent = main
Instance.new("UICorner", input)

local bCheck = Instance.new("TextButton")
bCheck.Size = UDim2.new(0,280,0,70) bCheck.Position = UDim2.new(0,360,0,200)
bCheck.BackgroundColor3 = Color3.fromRGB(15, 35, 25) bCheck.Text = "CHECK KEY"
bCheck.TextColor3 = Color3.new(1,1,1) -- Texto Branco para não ofuscar
bCheck.Font = Enum.Font.GothamBold bCheck.Parent = main
Instance.new("UICorner", bCheck)
Instance.new("UIStroke", bCheck).Color = COLORS.GreenNeon -- Brilho suave

-- Logica de Verificação
bCheck.MouseButton1Click:Connect(function()
    if input.Text == KEY_CORRETA then
        main:Destroy() -- Deleta a tela de Key
        AbrirPainelPrincipal() -- ABRE A GUI
    else
        input.Text = "KEY INCORRETA!"
        task.wait(1)
        input.Text = ""
    end
end)

bGet.MouseButton1Click:Connect(function() setclipboard(LINK_GET_KEY) end)
bPrem.MouseButton1Click:Connect(function() setclipboard(LINK_GAMEPASS) end)
bDisc.MouseButton1Click:Connect(function() setclipboard(LINK_DISCORD) end)
