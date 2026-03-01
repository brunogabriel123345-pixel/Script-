local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GET_KEY = "Https://link-hub.net/3920699/Bb9WkaqTBZsg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- PALETA DE CORES PREMIUM V2.0 (Corrigida para design mais fiel)
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
    tBtn.ZIndex = 5 -- Garante que fique por cima

    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new(COLORS.PurpleNeon, Color3.fromRGB(20, 20, 60))
    grad.Rotation = 45
    grad.Parent = tBtn
    
    Instance.new("UICorner", tBtn).CornerRadius = UDim.new(0, 15)
    local s = Instance.new("UIStroke", tBtn)
    s.Color = Color3.new(1,1,1)
    s.Thickness = 2

    -- Tornar o botão arrastável (Melhorado)
    local dragging, dragStart, startPos
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
    mainHub.Name = "MainHubFrame"
    mainHub.Size = UDim2.new(0, 600, 0, 380)
    mainHub.Position = UDim2.new(0.5, -300, 0.5, -190)
    mainHub.BackgroundColor3 = COLORS.MainBG
    mainHub.Visible = true -- Começa visível após login
    mainHub.Parent = sg
    Instance.new("UICorner", mainHub).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", mainHub).Color = COLORS.BlueNeon

    -- Sidebar lateral
    local side = Instance.new("Frame")
    side.Name = "Sidebar"
    side.Size = UDim2.new(0, 150, 1, 0)
    side.BackgroundColor3 = COLORS.Glass
    side.Parent = mainHub
    Instance.new("UICorner", side)
    
    local layout = Instance.new("UIListLayout", side)
    layout.HorizontalAlignment = "Center"
    layout.Padding = UDim.new(0, 8) -- Mais espaço

    -- Container de Páginas
    local container = Instance.new("Frame")
    container.Name = "PageContainer"
    container.Size = UDim2.new(1, -160, 1, -20)
    container.Position = UDim2.new(0, 155, 0, 10)
    container.BackgroundTransparency = 1
    container.Parent = mainHub

    local pages = {}
    local function NewPage(name)
        local p = Instance.new("ScrollingFrame")
        p.Name = name.."Page"
        p.Size = UDim2.new(1, 0, 1, 0)
        p.BackgroundTransparency = 1
        p.Visible = false
        p.CanvasSize = UDim2.new(0,0,2,0)
        p.ScrollBarThickness = 3
        p.ScrollBarImageColor3 = COLORS.Text
        p.Parent = container
        Instance.new("UIListLayout", p).Padding = UDim.new(0, 10)
        pages[name] = p
        
        -- Botão da Aba (Corrigido local do texto)
        local b = Instance.new("TextButton")
        b.Name = name.."TabBtn"
        b.Size = UDim2.new(0.9, 0, 0, 40)
        b.Text = name -- Texto definido diretamente no botão
        b.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        b.TextColor3 = COLORS.Text -- Garante cor branca
        b.Font = Enum.Font.GothamMedium
        b.TextSize = 14
        b.TextWrapped = true -- Evita que o texto saia
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
        btn.TextColor3 = COLORS.Text
        btn.Font = Enum.Font.GothamSemibold
        btn.TextSize = 14
        btn.TextWrapped = true
        btn.Parent = parent
        Instance.new("UICorner", btn)
        local s = Instance.new("UIStroke", btn)
        s.Color = COLORS.Border
        btn.MouseButton1Click:Connect(callback)
    end

    -- Criar Páginas e Funções
    local pPlayer = NewPage("Player")
    AddFunction(pPlayer, "Velocidade (50)", function() pcall(function() player.Character.Humanoid.WalkSpeed = 50 end) end)
    AddFunction(pPlayer, "Pulo (120)", function() pcall(function() player.Character.Humanoid.JumpPower = 120 end) end)

    local pESP = NewPage("Visuals")
    AddFunction(pESP, "Highlight Players", function()
        pcall(function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and not p.Character:FindFirstChild("PrimionESP") then
                    local h = Instance.new("Highlight", p.Character)
                    h.Name = "PrimionESP"
                    h.FillColor = COLORS.GreenNeon
                    h.FillTransparency = 0.5
                    h.OutlineTransparency = 0
                end
            end
        end)
    end)

    local pConfigs = NewPage("Configs")
    AddFunction(pConfigs, "Destroy GUI", function() sg:Destroy() end)

    -- Inicia na aba Player
    pages["Player"].Visible = true
    CriarBotaoGalaxia(mainHub)
end

-----------------------------------------------------------
-- 3. TELA DE LOGIN V2.0 (CORREÇÃO DE LOCAL DO TEXTO)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Name = "LoginFrame"
loginFrame.Size = UDim2.new(0, 650, 0, 380)
loginFrame.Position = UDim2.new(0.5, -325, 0.5, -190)
loginFrame.BackgroundColor3 = COLORS.MainBG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)
local lStroke = Instance.new("UIStroke", loginFrame)
lStroke.Thickness = 1.5
lStroke.Color = COLORS.Border

-- Títulos
local t1 = Instance.new("TextLabel")
t1.Size = UDim2.new(1, 0, 0, 40)
t1.Position = UDim2.new(0, 0, 0, 15)
t1.Text = "PRIMION EXECUTOR"
t1.TextColor3 = COLORS.GoldNeon
t1.Font = Enum.Font.GothamBold
t1.TextSize = 26
t1.BackgroundTransparency = 1
t1.Parent = loginFrame

local t2 = Instance.new("TextLabel")
t2.Size = UDim2.new(1, 0, 0, 20)
t2.Position = UDim2.new(0, 0, 0, 45)
t2.Text = "KEY AUTHORIZATION"
t2.TextColor3 = COLORS.BlueNeon
t2.Font = Enum.Font.GothamBold
t2.TextSize = 16
t2.BackgroundTransparency = 1
t2.Parent = loginFrame

-- Painel Lateral Esquerdo (Botões com Texto Corrigido)
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
    b.Text = "" -- TEXTO DO BOTÃO REMOVIDO PARA CORREÇÃO
    b.Parent = lp
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", b).Color = color

    -- Ícone (Quadrado Colorido)
    local il = Instance.new("TextLabel")
    il.Size = UDim2.new(0, 35, 0, 35)
    il.Position = UDim2.new(0, 10, 0.5, -17)
    il.BackgroundColor3 = color
    il.Text = icon
    il.TextColor3 = Color3.new(1,1,1)
    il.Font = Enum.Font.GothamBold
    il.TextSize = 18
    il.Parent = b
    Instance.new("UICorner", il)

    -- NOVO TextLabel para o Nome (Centralizado corretamente)
    local tl = Instance.new("TextLabel")
    tl.Size = UDim2.new(1, -60, 1, 0) -- Ocupa o resto do botão
    tl.Position = UDim2.new(0, 55, 0, 0) -- Começa após o ícone
    tl.Text = name
    tl.TextColor3 = COLORS.Text
    tl.Font = Enum.Font.GothamBold
    tl.TextSize = 14
    tl.TextXAlignment = Enum.TextXAlignment.Left -- Alinhado à esquerda
    tl.BackgroundTransparency = 1
    tl.Parent = b

    return b
end

-- Criar os botões (Usando a nova função com texto corrigido)
local btnGet = CreateLoginBtn("GET KEY", COLORS.GreenNeon, "📥", UDim2.new(0,0,0,0))
local btnPremium = CreateLoginBtn("KEY PRIMION", COLORS.GoldNeon, "⭐", UDim2.new(0,0,0,65))
local btnSupport = CreateLoginBtn("SUPPORT", COLORS.PurpleNeon, "💬", UDim2.new(0,0,0,130))

-- Painel Direito (Input e Check)
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
input.TextColor3 = COLORS.Text
input.Font = Enum.Font.Gotham
input.TextSize = 15
input.Parent = rp
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", input).Color = COLORS.Border

local check = Instance.new("TextButton")
check.Name = "CheckKeyBtn"
check.Size = UDim2.new(1, 0, 0, 60)
check.Position = UDim2.new(0, 0, 0, 70)
check.BackgroundColor3 = Color3.fromRGB(15, 30, 20)
check.Text = "CHECK KEY" -- Texto do Check Key já estava correto
check.TextColor3 = COLORS.GreenNeon
check.Font = Enum.Font.GothamBold
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
status.Font = Enum.Font.GothamMedium
status.TextSize = 14
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
