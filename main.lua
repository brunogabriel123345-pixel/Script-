local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- CORES E ESTILO
local COLORS = {
    BG = Color3.fromRGB(10, 10, 15),
    Sidebar = Color3.fromRGB(15, 15, 25),
    Accent = Color3.fromRGB(0, 255, 127),
    Gold = Color3.fromRGB(255, 200, 50),
    Galaxy1 = Color3.fromRGB(48, 25, 82), -- Roxo Galáxia
    Galaxy2 = Color3.fromRGB(10, 10, 35)  -- Azul Profundo
}

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV4") then playerGui.PrimionV4:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4"
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- FUNÇÃO: BOTÃO QUADRADO GALÁXIA (TOGGLE)
-----------------------------------------------------------
local function CriarBotaoGalaxia(mainFrame)
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "GalaxyToggle"
    toggleBtn.Size = UDim2.new(0, 50, 0, 50)
    toggleBtn.Position = UDim2.new(0, 20, 0, 20)
    toggleBtn.BackgroundColor3 = Color3.new(1,1,1)
    toggleBtn.Text = "★"
    toggleBtn.TextColor3 = Color3.new(1,1,1)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 25
    toggleBtn.Parent = sg
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, COLORS.Galaxy1),
        ColorSequenceKeypoint.new(1, COLORS.Galaxy2)
    })
    gradient.Rotation = 45
    gradient.Parent = toggleBtn
    
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", toggleBtn)
    stroke.Color = Color3.fromRGB(150, 50, 255)
    stroke.Thickness = 2

    -- Arrastar o botão
    local dragging, dragInput, dragStart, startPos
    toggleBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = toggleBtn.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            toggleBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)

    toggleBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
        TweenService:Create(toggleBtn, TweenInfo.new(0.3), {Rotation = toggleBtn.Rotation + 90}):Play()
    end)
end

-----------------------------------------------------------
-- FUNÇÕES DO HUB (EXEMPLOS REAIS)
-----------------------------------------------------------
local function AddButton(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = parent
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
end

-----------------------------------------------------------
-- HUB PRINCIPAL
-----------------------------------------------------------
local function AbrirHubPrincipal()
    local mainHub = Instance.new("Frame")
    mainHub.Size = UDim2.new(0, 600, 0, 380)
    mainHub.Position = UDim2.new(0.5, -300, 0.5, -190)
    mainHub.BackgroundColor3 = COLORS.BG
    mainHub.Parent = sg
    Instance.new("UICorner", mainHub)
    Instance.new("UIStroke", mainHub).Color = Color3.fromRGB(80, 80, 255)

    -- Sidebar
    local sidebar = Instance.new("Frame")
    sidebar.Size = UDim2.new(0, 140, 1, 0)
    sidebar.BackgroundColor3 = COLORS.Sidebar
    sidebar.Parent = mainHub
    Instance.new("UICorner", sidebar)
    
    local sideLayout = Instance.new("UIListLayout", sidebar)
    sideLayout.Padding = UDim.new(0, 5)
    sideLayout.HorizontalAlignment = "Center"

    local contentArea = Instance.new("Frame")
    contentArea.Size = UDim2.new(1, -150, 1, -20)
    contentArea.Position = UDim2.new(0, 145, 0, 10)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = mainHub

    local pages = {}
    local function CreatePage(name)
        local p = Instance.new("ScrollingFrame")
        p.Size = UDim2.new(1, 0, 1, 0)
        p.BackgroundTransparency = 1
        p.Visible = false
        p.ScrollBarThickness = 2
        p.Parent = contentArea
        local l = Instance.new("UIListLayout", p)
        l.Padding = UDim.new(0, 10)
        l.HorizontalAlignment = "Center"
        pages[name] = p
        return p
    end

    -- Criação das Abas e Funções
    local pPlayer = CreatePage("Player")
    AddButton(pPlayer, "Velocidade Correr (50)", function() player.Character.Humanoid.WalkSpeed = 50 end)
    AddButton(pPlayer, "Velocidade Normal (16)", function() player.Character.Humanoid.WalkSpeed = 16 end)
    AddButton(pPlayer, "Pulo Alto (100)", function() player.Character.Humanoid.JumpPower = 100 end)

    local pESP = CreatePage("ESP")
    AddButton(pESP, "Ativar ESP (Highlight)", function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local h = Instance.new("Highlight", p.Character)
                h.FillColor = COLORS.Accent
            end
        end
    end)

    local pFPS = CreatePage("FPS Killer")
    AddButton(pFPS, "Remover Texturas (Boost FPS)", function()
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Texture") or v:IsA("Decal") then v:Destroy() end
        end
    end)

    local function AddTabBtn(name)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.9, 0, 0, 40)
        b.Text = name
        b.BackgroundColor3 = Color3.fromRGB(40,40,60)
        b.TextColor3 = Color3.new(1,1,1)
        b.Parent = sidebar
        Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function()
            for _, pg in pairs(pages) do pg.Visible = false end
            pages[name].Visible = true
        end)
    end

    AddTabBtn("Player")
    AddTabBtn("ESP")
    AddTabBtn("FPS Killer")
    
    pages["Player"].Visible = true
    CriarBotaoGalaxia(mainHub)
end

-----------------------------------------------------------
-- LOGIN (SIMPLIFICADO PARA O TESTE)
-----------------------------------------------------------
local login = Instance.new("Frame")
login.Size = UDim2.new(0, 400, 0, 250)
login.Position = UDim2.new(0.5, -200, 0.5, -125)
login.BackgroundColor3 = COLORS.BG
login.Parent = sg
Instance.new("UICorner", login)

local input = Instance.new("TextBox")
input.Size = UDim2.new(0.8, 0, 0, 40)
input.Position = UDim2.new(0.1, 0, 0, 80)
input.PlaceholderText = "Cole a Key aqui..."
input.Parent = login

AddButton(login, "Entrar", function()
    if input.Text == KEY_CORRETA then
        login:Destroy()
        AbrirHubPrincipal()
    end
end)
