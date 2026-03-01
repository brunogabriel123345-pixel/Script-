local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- ==========================================
-- CONFIGURAÇÕES
-- ==========================================
local KEY_CORRETA = "key-htpjvg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

local COLORS = {
    BG = Color3.fromRGB(15, 17, 22),
    Sidebar = Color3.fromRGB(20, 22, 28),
    Accent = Color3.fromRGB(0, 255, 127),
    Gold = Color3.fromRGB(255, 200, 50),
    Red = Color3.fromRGB(255, 80, 80),
    Black = Color3.fromRGB(0, 0, 0)
}

-- Limpar execuções anteriores
if playerGui:FindFirstChild("PrimionV4_Fixed") then playerGui.PrimionV4_Fixed:Destroy() end

local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4_Fixed"
sg.IgnoreGuiInset = true
sg.ResetOnSpawn = false
sg.Parent = playerGui

local noclipActive = false
local pages = {}

-- ==========================================
-- LÓGICA DE SISTEMA (NOCLIP)
-- ==========================================
RunService.Stepped:Connect(function()
    if noclipActive and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- ==========================================
-- CONSTRUÇÃO DA GUI PRINCIPAL
-- ==========================================
local function CriarMainHub()
    -- Botão Toggle (Estrelinhas)
    local toggle = Instance.new("TextButton")
    toggle.Name = "ToggleStars"
    toggle.Size = UDim2.new(0, 45, 0, 45)
    toggle.Position = UDim2.new(0, 10, 0.5, -22)
    toggle.BackgroundColor3 = COLORS.Black
    toggle.Text = "✨\n. * . "
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.Font = Enum.Font.GothamBold
    toggle.TextSize = 10
    toggle.Parent = sg
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", toggle).Color = Color3.fromRGB(60, 60, 60)

    -- Painel de Cheats
    local main = Instance.new("Frame")
    main.Name = "MainFrame"
    main.Size = UDim2.new(0, 650, 0, 400)
    main.Position = UDim2.new(0.5, -325, 0.5, -200)
    main.BackgroundColor3 = COLORS.BG
    main.Visible = true
    main.Parent = sg
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", main).Color = COLORS.Accent

    -- Sidebar
    local side = Instance.new("Frame")
    side.Size = UDim2.new(0, 150, 1, 0)
    side.BackgroundColor3 = COLORS.Sidebar
    side.Parent = main
    Instance.new("UICorner", side)

    local list = Instance.new("UIListLayout", side)
    list.Padding = UDim.new(0, 5)
    list.HorizontalAlignment = Enum.HorizontalAlignment.Center

    -- Título Sidebar
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 60)
    title.BackgroundTransparency = 1
    title.Text = "PRIMION V4"
    title.TextColor3 = COLORS.Gold
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.Parent = side

    -- Content Area
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -165, 1, -20)
    container.Position = UDim2.new(0, 155, 0, 10)
    container.BackgroundTransparency = 1
    container.Parent = main

    -- Criar Abas
    local abas = {"Menu", "ESP", "FPS Killer", "Player", "Configuração"}
    for _, nome in pairs(abas) do
        local p = Instance.new("ScrollingFrame")
        p.Size = UDim2.new(1, 0, 1, 0)
        p.Visible = (nome == "Menu")
        p.BackgroundTransparency = 1
        p.ScrollBarThickness = 2
        p.CanvasSize = UDim2.new(0,0,2,0)
        p.Parent = container
        pages[nome] = p

        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.9, 0, 0, 35)
        b.BackgroundColor3 = Color3.fromRGB(35, 37, 45)
        b.Text = nome
        b.TextColor3 = Color3.new(1, 1, 1)
        b.Font = Enum.Font.GothamMedium
        b.Parent = side
        Instance.new("UICorner", b)

        b.MouseButton1Click:Connect(function()
            for _, pg in pairs(pages) do pg.Visible = false end
            pages[nome].Visible = true
        end)
    end

    -- Toggle Logic
    toggle.MouseButton1Click:Connect(function()
        main.Visible = not main.Visible
    end)

    -- Funções da Aba Player
    local function NewSection(name, parent)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(0.95, 0, 0, 50)
        f.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
        f.Parent = parent
        Instance.new("UICorner", f)
        Instance.new("UIListLayout", parent).Padding = UDim.new(0, 10)
        
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0.5, 0, 1, 0)
        l.Position = UDim2.new(0, 15, 0, 0)
        l.Text = name
        l.TextColor3 = Color3.new(1,1,1)
        l.BackgroundTransparency = 1
        l.Font = Enum.Font.GothamBold
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.Parent = f
        return f
    end

    -- Velocidade
    local sSec = NewSection("Velocidade:", pages["Player"])
    local sInp = Instance.new("TextBox")
    sInp.Size = UDim2.new(0.3, 0, 0.7, 0)
    sInp.Position = UDim2.new(0.65, 0, 0.15, 0)
    sInp.BackgroundColor3 = COLORS.BG
    sInp.Text = "16"
    sInp.TextColor3 = COLORS.Accent
    sInp.Parent = sSec
    Instance.new("UICorner", sInp)
    sInp.FocusLost:Connect(function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = tonumber(sInp.Text) or 16
        end
    end)

    -- Noclip
    local nSec = NewSection("Noclip:", pages["Player"])
    local nBtn = Instance.new("TextButton")
    nBtn.Size = UDim2.new(0, 80, 0.7, 0)
    nBtn.Position = UDim2.new(0.65, 0, 0.15, 0)
    nBtn.BackgroundColor3 = COLORS.Red
    nBtn.Text = "OFF"
    nBtn.TextColor3 = Color3.new(1,1,1)
    nBtn.Font = Enum.Font.GothamBold
    nBtn.Parent = nSec
    Instance.new("UICorner", nBtn)
    nBtn.MouseButton1Click:Connect(function()
        noclipActive = not noclipActive
        nBtn.Text = noclipActive and "ON" or "OFF"
        nBtn.BackgroundColor3 = noclipActive and COLORS.Accent or COLORS.Red
    end)
end

-- ==========================================
-- SISTEMA DE KEY (LOGIN)
-- ==========================================
local login = Instance.new("Frame")
login.Size = UDim2.new(0, 550, 0, 320)
login.Position = UDim2.new(0.5, -275, 0.5, -160)
login.BackgroundColor3 = COLORS.BG
login.Parent = sg
Instance.new("UICorner", login)
Instance.new("UIStroke", login).Color = COLORS.Accent

local lTitle = Instance.new("TextLabel")
lTitle.Size = UDim2.new(1, 0, 0, 60)
lTitle.Text = "PRIMION KEY SYSTEM\n100 Robux - Lifetime Infinito"
lTitle.TextColor3 = COLORS.Gold
lTitle.Font = Enum.Font.GothamBold
lTitle.TextSize = 16
lTitle.BackgroundTransparency = 1
lTitle.Parent = login

local input = Instance.new("TextBox")
input.Size = UDim2.new(0.8, 0, 0, 45)
input.Position = UDim2.new(0.1, 0, 0, 100)
input.BackgroundColor3 = COLORS.Sidebar
input.PlaceholderText = "Cole a key aqui..."
input.Text = ""
input.TextColor3 = Color3.new(1,1,1)
input.Parent = login
Instance.new("UICorner", input)

local grid = Instance.new("Frame")
grid.Size = UDim2.new(0.8, 0, 0, 45)
grid.Position = UDim2.new(0.1, 0, 0, 160)
grid.BackgroundTransparency = 1
grid.Parent = login
Instance.new("UIListLayout", grid).FillDirection = Enum.FillDirection.Horizontal
Instance.new("UIListLayout", grid).Padding = UDim.new(0, 10)

local function b(n, c, f)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.31, 0, 1, 0)
    btn.BackgroundColor3 = c
    btn.Text = n
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.
    
