local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- CORES (Mantendo seu padrão)
local COLORS = {
    BG = Color3.fromRGB(15, 17, 22),
    Sidebar = Color3.fromRGB(20, 22, 28),
    Accent = Color3.fromRGB(0, 255, 127),
    Gold = Color3.fromRGB(255, 200, 50),
    Black = Color3.fromRGB(0, 0, 0)
}

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV4_Final") then playerGui.PrimionV4_Final:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4_Final"
sg.IgnoreGuiInset = true
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- 🎮 PAINEL PRINCIPAL
-----------------------------------------------------------
local mainHub = Instance.new("Frame")
mainHub.Size = UDim2.new(0, 650, 0, 400)
mainHub.Position = UDim2.new(0.5, -325, 0.5, -200)
mainHub.BackgroundColor3 = COLORS.BG
mainHub.Visible = false
mainHub.Parent = sg
Instance.new("UICorner", mainHub).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", mainHub).Color = COLORS.Accent

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 150, 1, 0)
sidebar.BackgroundColor3 = COLORS.Sidebar
sidebar.Parent = mainHub
Instance.new("UICorner", sidebar)

local sideLayout = Instance.new("UIListLayout", sidebar)
sideLayout.Padding = UDim.new(0, 5)
sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local sideTitle = Instance.new("TextLabel")
sideTitle.Size = UDim2.new(1, 0, 0, 50)
sideTitle.Text = "PRIMION V4"
sideTitle.TextColor3 = COLORS.Gold
sideTitle.Font = Enum.Font.GothamBold
sideTitle.TextSize = 18
sideTitle.BackgroundTransparency = 1
sideTitle.Parent = sidebar

-- Área de Conteúdo
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -165, 1, -20)
contentArea.Position = UDim2.new(0, 155, 0, 10)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainHub

local pages = {}
local function CreatePage(name)
    local p = Instance.new("ScrollingFrame")
    p.Size = UDim2.new(1, 0, 1, 0)
    p.Visible = false
    p.BackgroundTransparency = 1
    p.ScrollBarThickness = 2
    p.CanvasSize = UDim2.new(0, 0, 1.5, 0)
    p.Parent = contentArea
    local layout = Instance.new("UIListLayout", p)
    layout.Padding = UDim.new(0, 8)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    pages[name] = p
    return p
end

-- Criar as 5 Abas
local tabs = {"Menu", "ESP", "FPS Killer", "Player", "Configuração"}
for _, name in pairs(tabs) do
    CreatePage(name)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.9, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(35, 37, 45)
    b.Text = name
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamMedium
    b.Parent = sidebar
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        for _, pg in pairs(pages) do pg.Visible = false end
        pages[name].Visible = true
    end)
end
pages["Menu"].Visible = true

-----------------------------------------------------------
-- 🚀 FUNÇÕES ESPECÍFICAS (MENU E ESP)
-----------------------------------------------------------

-- Função Auxiliar para Labels
local function AddLabel(page, text, color)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0.9, 0, 0, 30)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = color or Color3.new(1,1,1)
    l.Font = Enum.Font.GothamSemibold
    l.TextSize = 14
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = pages[page]
    return l
end

-- 1. MENU (DADOS DO PLAYER)
AddLabel("Menu", "✨ DADOS DO USUÁRIO", COLORS.Gold)
AddLabel("Menu", "👤 Nick: " .. player.Name)
AddLabel("Menu", "🆔 ID: " .. player.UserId)
AddLabel("Menu", "⏳ Idade da Conta: " .. player.AccountAge .. " dias")

local timeLabel = AddLabel("Menu", "⏰ Tempo na Sessão: 0s")
local startTime = os.time()
task.spawn(function()
    while task.wait(1) do
        local seconds = os.time() - startTime
        timeLabel.Text = "⏰ Tempo na Sessão: " .. seconds .. "s"
    end
end)

-- 2. ESP (BOX E NICK ON/OFF)
local espActive = false
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0.9, 0, 0, 45)
espBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
espBtn.Text = "ESP: OFF"
espBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
espBtn.Font = Enum.Font.GothamBold
espBtn.Parent = pages["ESP"]
Instance.new("UICorner", espBtn)

espBtn.MouseButton1Click:Connect(function()
    espActive = not espActive
    espBtn.Text = "ESP: " .. (espActive and "ON" or "OFF")
    espBtn.TextColor3 = espActive and COLORS.Accent or Color3.fromRGB(255, 80, 80)
    
    -- Lógica simples de ESP (Box e Nick)
    if espActive then
        task.spawn(function()
            while espActive do
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        if not p.Character.HumanoidRootPart:FindFirstChild("PrimionESP") then
                            local bg = Instance.new("BillboardGui", p.Character.HumanoidRootPart)
                            bg.Name = "PrimionESP"
                            bg.AlwaysOnTop = true
                            bg.Size = UDim2.new(4, 0, 5, 0)
                            
                            local box = Instance.new("Frame", bg)
                            box.Size = UDim2.new(1, 0, 1, 0)
                            box.BackgroundTransparency = 0.6
                            box.BackgroundColor3 = COLORS.Accent
                            Instance.new("UIStroke", box).Color = Color3.new(1,1,1)
                            
                            local nameTag = Instance.new("TextLabel", bg)
                            nameTag.Text = p.Name
                            nameTag.Size = UDim2.new(1, 0, 0, 20)
                            nameTag.Position = UDim2.new(0, 0, -0.3, 0)
                            nameTag.BackgroundTransparency = 1
                            nameTag.TextColor3 =
                                    
