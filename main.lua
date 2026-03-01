local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- CORES
local COLORS = {
    BG = Color3.fromRGB(15, 17, 22),
    Sidebar = Color3.fromRGB(20, 22, 28),
    Accent = Color3.fromRGB(0, 255, 127),
    Gold = Color3.fromRGB(255, 200, 50),
    Black = Color3.fromRGB(0, 0, 0),
    White = Color3.new(1, 1, 1)
}

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV4_Final") then playerGui.PrimionV4_Final:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4_Final"
sg.IgnoreGuiInset = true
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- 🌌 BOTÃO TOGGLE (ESTRELINHAS)
-----------------------------------------------------------
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 45, 0, 45)
toggleBtn.Position = UDim2.new(0, 10, 0.5, -22)
toggleBtn.BackgroundColor3 = COLORS.Black
toggleBtn.Text = "✨\n. * . "
toggleBtn.TextColor3 = COLORS.White
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 10
toggleBtn.Visible = false
toggleBtn.Parent = sg

Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)
local tStroke = Instance.new("UIStroke", toggleBtn)
tStroke.Color = Color3.fromRGB(60, 60, 60)
tStroke.Thickness = 2

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
    p.CanvasSize = UDim2.new(0,0,1.5,0)
    p.Parent = contentArea
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 8)
    pages[name] = p
    return p
end

-- Criar as Abas e Botões Laterais
local tabs = {"Menu", "ESP", "FPS Killer", "Player", "Configuração"}
for _, name in pairs(tabs) do
    local p = CreatePage(name)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.9, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(35, 37, 45)
    b.Text = name
    b.TextColor3 = COLORS.White
    b.Font = Enum.Font.GothamMedium
    b.Parent = sidebar
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        for _, pg in pairs(pages) do pg.Visible = false end
        p.Visible = true
    end)
end
pages["Menu"].Visible = true

-- Funções Básicas para as Abas (Exemplos)
local function AddTool(page, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(40, 44, 52)
    btn.Text = text
    btn.TextColor3 = COLORS.White
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = pages[page]
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
end

AddTool("Player", "Velocidade (Speed 50)", function() player.Character.Humanoid.WalkSpeed = 50 end)
AddTool("Player", "Pulo Alto (JP 100)", function() player.Character.Humanoid.JumpPower = 100 end)
AddTool("FPS Killer", "Boost FPS (Remover Texturas)", function() 
    for _, v in pairs(game:GetDescendants()) do 
        if v:IsA("Texture") or v:IsA("Decal") then v:Destroy() end 
    end 
end)

-- Lógica do Toggle
toggleBtn.MouseButton1Click:Connect(function()
    mainHub.Visible = not mainHub.Visible
end)

-----------------------------------------------------------
-- 🔑 TELA DE LOGIN (ESTILO ORIGINAL RESTAURADO)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 550, 0, 350)
loginFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
loginFrame.BackgroundColor3 = COLORS.BG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)

local loginTitle = Instance.new("TextLabel")
loginTitle.Size = UDim2.new(1,0,0,50)
loginTitle.Text = "PRIMION KEY SYSTEM\n100 Robux - Lifetime Infinito"
loginTitle.TextColor3 = COLORS.Gold
loginTitle.Font = Enum.Font.GothamBold
loginTitle.TextSize = 14
loginTitle.Parent = loginFrame
loginTitle.BackgroundTransparency = 1

local input = Instance.new("TextBox")
input.Size = UDim2.new(0.8, 0, 0, 45)
input.Position = UDim2.new(0.1, 0, 0, 100)
input.BackgroundColor3 = COLORS.Sidebar
input.PlaceholderText = "Cole sua key aqui..."
input.Text = ""
input.TextColor3 = COLORS.White
input.Parent = loginFrame
Instance.new("UICorner", input)

local btnGrid = Instance.new("Frame")
btnGrid.Size = UDim2.new(0.8, 0, 0, 50)
btnGrid.Position = UDim2.new(0.1, 0, 0, 160)
btnGrid.BackgroundTransparency = 1
btnGrid.Parent = loginFrame
Instance.new("UIListLayout", btnGrid).FillDirection = Enum.FillDirection.Horizontal
Instance.new("UIListLayout", btnGrid).Padding = UDim.new(0, 10)

local function QuickBtn(name, color, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.32, 0, 1, 0)
    b.BackgroundColor3 = color
    b.Text = name
    b.TextColor3 = COLORS.White
    b.Font = Enum.Font.GothamBold
    b.Parent = btnGrid
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(callback)
end

-- Botões de Login Originais
QuickBtn("GET KEY", Color3.fromRGB(255, 100, 0), function() 
    setclipboard("https://seulinkdekey.com") -- Coloque seu link aqui
end)

QuickBtn("CHECK KEY", COLORS.Accent, function()
    if input.Text == KEY_CORRETA then
        loginFrame:Destroy()
        mainHub.Visible = true
        toggleBtn.Visible = true
    else
        input.Text = ""
        input.PlaceholderText = "KEY INCORRETA!"
        task.wait(1.5)
        input.PlaceholderText = "Cole sua key aqui..."
    end
end)

QuickBtn("PREMIUM", COLORS.Gold, function() 
    setclipboard(LINK_GAMEPASS) 
end)
