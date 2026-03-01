local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GET_KEY = "Https://link-hub.net/3920699/Bb9WkaqTBZsg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- PALETA DE CORES PREMIUM V2.0
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
-- 1. FUNÇÃO: CRIAR BOTÃO TOGGLE (GALÁXIA)
-----------------------------------------------------------
local function CriarBotaoGalaxia(mainFrame)
    local tBtn = Instance.new("TextButton")
    tBtn.Name = "GalaxyToggle"
    tBtn.Size = UDim2.new(0, 55, 0, 55)
    tBtn.Position = UDim2.new(0, 20, 0, 20)
    tBtn.Text = "★"
    tBtn.TextColor3 = Color3.new(1,1,1)
    tBtn.Font = Enum.Font.GothamBold
    tBtn.TextSize = 28
    tBtn.Parent = sg
    
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new(COLORS.PurpleNeon, Color3.fromRGB(20, 20, 60))
    grad.Rotation = 45
    grad.Parent = tBtn
    
    Instance.new("UICorner", tBtn).CornerRadius = UDim.new(0, 15)
    local s = Instance.new("UIStroke", tBtn)
    s.Color = Color3.new(1,1,1)
    s.Thickness = 2

    -- Tornar o botão arrastável
    local dragging, dragInput, dragStart, startPos
    tBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = tBtn.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            tBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)

    tBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
        TweenService:Create(tBtn, TweenInfo.new(0.3), {Rotation = tBtn.Rotation + 90}):Play()
    end)
end

-----------------------------------------------------------
-- 2. FUNÇÃO: HUB PRINCIPAL (GUI)
-----------------------------------------------------------
local function AbrirHubPrincipal()
    local mainHub = Instance.new("Frame")
    mainHub.Size = UDim2.new(0, 600, 0, 380)
    mainHub.Position = UDim2.new(0.5, -300, 0.5, -190)
    mainHub.BackgroundColor3 = COLORS.MainBG
    mainHub.Visible = true
    mainHub.Parent = sg
    Instance.new("UICorner", mainHub).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", mainHub).Color = COLORS.BlueNeon

    local side = Instance.new("Frame")
    side.Size = UDim2.new(0, 150, 1, 0)
    side.BackgroundColor3 = COLORS.Glass
    side.Parent = mainHub
    Instance.new("UICorner", side)
    
    local layout = Instance.new("UIListLayout", side)
    layout.HorizontalAlignment = "Center"
    layout.Padding = UDim.new(0, 5)

    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -160, 1, -20)
    container.Position = UDim2.new(0, 155, 0, 10)
    container.BackgroundTransparency = 1
    container.Parent = mainHub

    local pages = {}
    local function NewPage(name)
        local p = Instance.new("ScrollingFrame")
        p.Size = UDim2.new(1, 0, 1, 0)
        p.BackgroundTransparency = 1
        p.Visible = false
        p.CanvasSize = UDim2.new(0,0,2,0)
        p.ScrollBarThickness = 3
        p.Parent = container
        Instance.new("UIListLayout", p).Padding = UDim.new(0, 10)
        pages[name] = p
        
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.9, 0, 0, 40)
        b.Text = name
        b.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.GothamMedium
        b.Parent = side
        Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function()
            for _, pg in pairs(pages) do pg.Visible = false end
            p.Visible = true
        end)
        return p
    end

    local function AddFunction(parent, text, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.95, 0, 0, 40)
        btn.BackgroundColor3 = COLORS.Glass
        btn.Text = text
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = Enum.Font.GothamSemibold
        btn.Parent = parent
        Instance.new("UICorner", btn)
        local s = Instance.new("UIStroke", btn)
        s.Color = COLORS.Border
        btn.MouseButton1Click:Connect(callback)
    end

    local pPlayer = NewPage("Player")
    AddFunction(pPlayer, "Velocidade (50)", function() player.Character.Humanoid.WalkSpeed = 50 end)
    AddFunction(pPlayer, "Pulo (120)", function() player.Character.Humanoid.JumpPower = 120 end)

    local pESP = NewPage("Visuals")
    AddFunction(pESP, "Highlight Players", function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                Instance.new("Highlight", p.Character).FillColor = COLORS.GreenNeon
            end
        end
    end)

    pages["Player"].Visible = true
    CriarBotaoGalaxia(mainHub)
end

-----------------------------------------------------------
-- 3. TELA DE LOGIN V2.0 (COM O SEU LINK ATUALIZADO)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 650, 0, 380)
loginFrame.Position = UDim2.new(0.5, -325, 0.5, -190)
loginFrame.BackgroundColor3 = COLORS.MainBG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)
Instance.new("UIStroke", loginFrame).Color = COLORS.Border

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

local t2 = Instance.new("TextLabel")
t2.Size = UDim2.new(1, 0, 0, 20)
t2.Position = UDim2.new(0, 0, 0, 45)
t2.Text = "KEY AUTHORIZATION"
t2.TextColor3 = COLORS.BlueNeon
t2.Font = "GothamBold"
t2.TextSize = 16
t2.BackgroundTransparency = 1
t2.Parent = loginFrame

-- Painel Lateral Esquerdo
local lp = Instance.new("Frame")
lp.Size = UDim2.new(0, 240, 0, 180)
lp.Position = UDim2.new(0, 30, 0, 160)
lp.BackgroundTransparency = 1
lp.Parent = loginFrame

local function CreateLoginBtn(name, color, icon, pos)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 55)
    b.Position = pos
    b.BackgroundColor3 = COLORS.Glass
    b.Text = "          " .. name
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = "GothamBold"
    b.TextXAlignment = "Left"
    b.Parent = lp
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", b).Color = color

    local il = Instance.new("TextLabel")
    il.Size = UDim2.new(0, 35, 0, 35)
    il.Position = UDim2.new(0, 10, 0.5, -17)
    il.BackgroundColor3 = color
    il.Text = icon
    il.TextColor3 = Color3.new(1,1,1)
    il.Parent = b
    Instance.new("UICorner", il)

    return b
end

local btnGet = CreateLoginBtn("GET KEY", COLORS.GreenNeon, "📥", UDim2.new(0,0,0,0))
local btnPremium = CreateLoginBtn("KEY PRIMION", COLORS.GoldNeon, "⭐", UDim2.new(0,0,0,65))
local btnSupport = CreateLoginBtn("SUPPORT", COLORS.PurpleNeon, "💬", UDim2.new(0,0,0,130))

-- Painel Direito
local rp = Instance.new("Frame")
rp.Size = UDim2.new(0, 330, 0, 180)
rp.Position = UDim2.new(0, 290, 0, 160)
rp.BackgroundTransparency = 1
rp.Parent = loginFrame

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, 0, 0, 50)
input.BackgroundColor3 = COLORS.Glass
input.PlaceholderText = "Insira a chave..."
input.Text = ""
input.TextColor3 = Color3.new(1,1,1)
input.Parent = rp
Instance.new("UICorner", input)

local check = Instance.new("TextButton")
check.Size = UDim2.new(1, 0, 0, 60)
check.Position = UDim2.new(0, 0, 0, 70)
check.BackgroundColor3 = Color3.fromRGB(15, 30, 20)
check.Text = "CHECK KEY"
check.TextColor3 = COLORS.GreenNeon
check.Font = "GothamBold"
check.TextSize = 20
check.Parent = rp
Instance.new("UICorner", check).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", check).Color = COLORS.GreenNeon

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 140)
status.BackgroundTransparency = 1
status.Text = "Aguardando chave..."
status.TextColor3 = Color3.fromRGB(150, 150, 150)
status.Parent = rp

-- LÓGICA DOS BOTÕES
btnGet.MouseButton1Click:Connect(function()
    setclipboard(LINK_GET_KEY)
    status.Text = "✅ Link de Key copiado!"
    status.TextColor3 = COLORS.GreenNeon
end)

btnPremium.MouseButton1Click:Connect(function()
    setclipboard(LINK_GAMEPASS)
    status.Text = "⭐ Link Premium copiado!"
    status.TextColor3 = COLORS.GoldNeon
end)

check.MouseButton1Click:Connect(function()
    if input.Text:gsub("%s+", "") == KEY_CORRETA then
        status.Text = "✅ Autorizado!"
        status.TextColor3 = COLORS.GreenNeon
        task.wait(1)
        loginFrame:Destroy()
        AbrirHubPrincipal()
    else
        status.Text = "❌ Chave Errada!"
        status.TextColor3 = Color3.new(1, 0, 0)
        input.Text = ""
    end
end)
