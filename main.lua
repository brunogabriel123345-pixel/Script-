local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- CORES PREMIUM E GALAXY
local COLORS = {
    BG = Color3.fromRGB(15, 17, 22),
    Sidebar = Color3.fromRGB(20, 22, 28),
    Accent = Color3.fromRGB(0, 255, 127),
    Gold = Color3.fromRGB(255, 200, 50),
    Galaxy1 = Color3.fromRGB(75, 0, 130),
    Galaxy2 = Color3.fromRGB(25, 25, 112)
}

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV4") then playerGui.PrimionV4:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4"
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- FUNÇÕES DE UTILIDADE
-----------------------------------------------------------
local function CriarBotaoLista(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(35, 38, 47)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 14
    btn.Parent = parent
    Instance.new("UICorner", btn)
    
    btn.MouseButton1Click:Connect(callback)
end

-----------------------------------------------------------
-- HUB PRINCIPAL E BOTÃO GALAXY
-----------------------------------------------------------
local function AbrirHubPrincipal()
    local mainHub = Instance.new("Frame")
    mainHub.Size = UDim2.new(0, 600, 0, 380)
    mainHub.Position = UDim2.new(0.5, -300, 0.5, -190)
    mainHub.BackgroundColor3 = COLORS.BG
    mainHub.Parent = sg
    Instance.new("UICorner", mainHub).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", mainHub).Color = COLORS.Accent

    -- Botão Galáxia (Toggle)
    local tBtn = Instance.new("TextButton")
    tBtn.Size = UDim2.new(0, 50, 0, 50)
    tBtn.Position = UDim2.new(0, 20, 0, 20)
    tBtn.Text = "★"
    tBtn.TextColor3 = Color3.new(1,1,1)
    tBtn.Font = Enum.Font.GothamBold
    tBtn.TextSize = 24
    tBtn.Parent = sg
    
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new(COLORS.Galaxy1, COLORS.Galaxy2)
    grad.Rotation = 45
    grad.Parent = tBtn
    Instance.new("UICorner", tBtn).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", tBtn).Color = Color3.new(1,1,1)

    tBtn.MouseButton1Click:Connect(function()
        mainHub.Visible = not mainHub.Visible
    end)

    -- Sidebar
    local side = Instance.new("Frame")
    side.Size = UDim2.new(0, 140, 1, 0)
    side.BackgroundColor3 = COLORS.Sidebar
    side.Parent = mainHub
    Instance.new("UICorner", side)
    
    local layout = Instance.new("UIListLayout", side)
    layout.HorizontalAlignment = "Center"
    layout.Padding = UDim.new(0, 5)

    -- Container de Páginas
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -150, 1, -20)
    container.Position = UDim2.new(0, 145, 0, 10)
    container.BackgroundTransparency = 1
    container.Parent = mainHub

    local pages = {}
    local function NewPage(name)
        local p = Instance.new("ScrollingFrame")
        p.Size = UDim2.new(1, 0, 1, 0)
        p.BackgroundTransparency = 1
        p.Visible = false
        p.ScrollBarThickness = 2
        p.Parent = container
        Instance.new("UIListLayout", p).Padding = UDim.new(0, 8)
        pages[name] = p
        
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.9, 0, 0, 40)
        b.Text = name
        b.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
        b.TextColor3 = Color3.new(1,1,1)
        b.Parent = side
        Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function()
            for _, pg in pairs(pages) do pg.Visible = false end
            p.Visible = true
        end)
        return p
    end

    -- Adicionando Funções
    local pPlayer = NewPage("Player")
    CriarBotaoLista(pPlayer, "Velocidade: 50", function() player.Character.Humanoid.WalkSpeed = 50 end)
    CriarBotaoLista(pPlayer, "Pulo: 120", function() player.Character.Humanoid.JumpPower = 120 end)
    
    local pESP = NewPage("ESP")
    CriarBotaoLista(pESP, "Ativar Highlight", function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local h = Instance.new("Highlight", p.Character)
                h.FillColor = COLORS.Accent
            end
        end
    end)

    local pFPS = NewPage("FPS")
    CriarBotaoLista(pFPS, "Boost FPS (Remover Texturas)", function()
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Texture") or v:IsA("Decal") then v:Destroy() end
        end
    end)

    pages["Player"].Visible = true
end

-----------------------------------------------------------
-- TELA DE LOGIN (ESTILO ORIGINAL RESTAURADO)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 550, 0, 350)
loginFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
loginFrame.BackgroundColor3 = COLORS.BG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)
Instance.new("UIStroke", loginFrame).Color = COLORS.Accent

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "PRIMION V4 - LOGIN"
title.TextColor3 = COLORS.Text
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1
title.Parent = loginFrame

-- Promoção/Lifetime
local promoMsg = Instance.new("TextLabel")
promoMsg.Size = UDim2.new(1, 0, 0, 30)
promoMsg.Position = UDim2.new(0, 0, 0, 60)
promoMsg.Text = "⭐ Primion Lifetime: 100 Robux - Acesso Infinito ⭐"
promoMsg.TextColor3 = COLORS.Gold
promoMsg.Font = Enum.Font.GothamBold
promoMsg.TextSize = 14
promoMsg.BackgroundTransparency = 1
promoMsg.Parent = loginFrame

-- TextBox Estilizada
local input = Instance.new("TextBox")
input.Size = UDim2.new(0.8, 0, 0, 45)
input.Position = UDim2.new(0.1, 0, 0, 110)
input.BackgroundColor3 = COLORS.Sidebar
input.PlaceholderText = "Cole sua chave aqui..."
input.Text = ""
input.TextColor3 = Color3.new(1,1,1)
input.Font = Enum.Font.Gotham
input.TextSize = 16
input.Parent = loginFrame
Instance.new("UICorner", input)

-- Botões Inferiores
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(0.8, 0, 0, 50)
btnContainer.Position = UDim2.new(0.1, 0, 0, 175)
btnContainer.BackgroundTransparency = 1
btnContainer.Parent = loginFrame

local hLayout = Instance.new("UIListLayout", btnContainer)
hLayout.FillDirection = Enum.FillDirection.Horizontal
hLayout.Padding = UDim.new(0, 10)

local function QuickBtn(name, color, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.32, 0, 1, 0)
    b.BackgroundColor3 = color
    b.Text = name
    b.Font = Enum.Font.GothamBold
    b.TextColor3 = Color3.new(1,1,1)
    b.TextSize = 12
    b.Parent = btnContainer
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(callback)
end

QuickBtn("GET KEY", Color3.fromRGB(255, 100, 0), function() setclipboard("LINK_DA_KEY") end)
QuickBtn("CHECK KEY", COLORS.Accent, function()
    if input.Text:gsub("%s+", "") == KEY_CORRETA then
        loginFrame:Destroy()
        AbrirHubPrincipal()
    end
end)
QuickBtn("PREMIUM", COLORS.Gold, function() setclipboard(LINK_GAMEPASS) end)
