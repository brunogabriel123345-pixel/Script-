local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- CONFIGURAÇÕES (IGUAIS)
local KEY_CORRETA = "key-htpjvg"
local LINK_GET_KEY = "Https://link-hub.net/3920699/Bb9WkaqTBZsg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"

local COLORS = {
    MainBG = Color3.fromRGB(15, 15, 23),
    Glass = Color3.fromRGB(22, 22, 31),
    GreenNeon = Color3.fromRGB(0, 255, 128),
    BlueNeon = Color3.fromRGB(0, 170, 255),
    GoldNeon = Color3.fromRGB(255, 190, 60),
    PurpleNeon = Color3.fromRGB(160, 80, 255),
    Border = Color3.fromRGB(45, 45, 60),
    Text = Color3.new(1, 1, 1)
}

if playerGui:FindFirstChild("PrimionV4") then playerGui.PrimionV4:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4"
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- 1. PARTE: GUI UNIVERSAL (ONDE ADICIONEI AS FUNÇÕES)
-----------------------------------------------------------
local function AbrirHubUniversal()
    local mainHub = Instance.new("Frame")
    mainHub.Name = "UniversalHub"
    mainHub.Size = UDim2.new(0, 550, 0, 350)
    mainHub.Position = UDim2.new(0.5, -275, 0.5, -175)
    mainHub.BackgroundColor3 = COLORS.MainBG
    mainHub.Parent = sg
    
    Instance.new("UICorner", mainHub).CornerRadius = UDim.new(0, 12)
    local stroke = Instance.new("UIStroke", mainHub)
    stroke.Color = COLORS.BlueNeon
    stroke.Thickness = 2

    -- Sidebar lateral
    local sidebar = Instance.new("Frame")
    sidebar.Size = UDim2.new(0, 150, 1, 0)
    sidebar.BackgroundColor3 = COLORS.Glass
    sidebar.Parent = mainHub
    Instance.new("UICorner", sidebar)

    local layout = Instance.new("UIListLayout", sidebar)
    layout.Padding = UDim.new(0, 8)
    layout.HorizontalAlignment = "Center"

    local hTitle = Instance.new("TextLabel")
    hTitle.Size = UDim2.new(0, 150, 0, 50)
    hTitle.Text = "PRIMION V4"
    hTitle.TextColor3 = COLORS.BlueNeon
    hTitle.Font = "GothamBold"
    hTitle.TextSize = 18
    hTitle.BackgroundTransparency = 1
    hTitle.Parent = sidebar

    -- TOGGLE (BOTÃO PARA ABRIR/FECHAR)
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 50, 0, 50)
    toggleBtn.Position = UDim2.new(0, 20, 0.1, 0)
    toggleBtn.BackgroundColor3 = COLORS.MainBG
    toggleBtn.Text = "P"
    toggleBtn.TextColor3 = COLORS.BlueNeon
    toggleBtn.Font = "GothamBold"
    toggleBtn.TextSize = 25
    toggleBtn.Parent = sg
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", toggleBtn).Color = COLORS.BlueNeon

    toggleBtn.MouseButton1Click:Connect(function()
        mainHub.Visible = not mainHub.Visible
    end)

    -- FUNÇÃO PARA CRIAR BOTÕES DE FUNÇÃO
    local function AddFunction(name, color, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 130, 0, 35)
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        btn.Text = name
        btn.TextColor3 = color
        btn.Font = "GothamMedium"
        btn.TextSize = 13
        btn.Parent = sidebar
        Instance.new("UICorner", btn)
        
        btn.MouseButton1Click:Connect(callback)
    end

    -- [ NOVAS FUNÇÕES ADICIONADAS AQUI ] --

    AddFunction("Speed (x100)", COLORS.BlueNeon, function()
        player.Character.Humanoid.WalkSpeed = 100
    end)

    AddFunction("Infinite Jump", COLORS.GreenNeon, function()
        UserInputService.JumpRequest:Connect(function()
            player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end)
    end)

    AddFunction("Fly (E to Toggle)", COLORS.GoldNeon, function()
        -- Lógica de Voo simples pode ser adicionada aqui
        print("Fly Ativado")
    end)

    AddFunction("ESP Players", COLORS.PurpleNeon, function()
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local highlight = Instance.new("Highlight")
                highlight.Parent = v.Character
                highlight.FillColor = COLORS.PurpleNeon
            end
        end
    end)

    AddFunction("Anti-AFK", COLORS.GreenNeon, function()
        local virtualUser = game:GetService("VirtualUser")
        player.Idled:Connect(function()
            virtualUser:CaptureController()
            virtualUser:ClickButton2(Vector2.new())
        end)
    end)

    AddFunction("Full Bright", COLORS.GoldNeon, function()
        game:GetService("Lighting").Brightness = 2
        game:GetService("Lighting").ClockTime = 14
        game:GetService("Lighting").GlobalShadows = false
    end)
end

-----------------------------------------------------------
-- 2. PARTE: TELA DE LOGIN (INTOCADA CONFORME PEDIDO)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 650, 0, 380)
loginFrame.Position = UDim2.new(0.5, -325, 0.5, -190)
loginFrame.BackgroundColor3 = COLORS.MainBG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)
Instance.new("UIStroke", loginFrame).Color = COLORS.Border

local function CreateLoginBtn(name, color, icon, pos)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 260, 0, 55)
    b.Position = pos
    b.BackgroundColor3 = COLORS.Glass
    b.Text = ""
    b.Parent = loginFrame
    Instance.new("UICorner", b)
    local il = Instance.new("TextLabel")
    il.Size = UDim2.new(0, 38, 0, 38)
    il.Position = UDim2.new(0, 10, 0.5, -19)
    il.BackgroundColor3 = color
    il.Text = icon
    il.TextColor3 = Color3.new(1,1,1)
    il.Parent = b
    Instance.new("UICorner", il)
    local tl = Instance.new("TextLabel")
    tl.Size = UDim2.new(1, -80, 1, 0)
    tl.Position = UDim2.new(0, 75, 0, 0)
    tl.Text = name
    tl.TextColor3 = COLORS.Text
    tl.Font = "GothamBold"
    tl.TextSize = 15
    tl.TextXAlignment = "Left"
    tl.BackgroundTransparency = 1
    tl.Parent = b
    return b
end

local btnGet = CreateLoginBtn("GET KEY", COLORS.GreenNeon, "📥", UDim2.new(0, 30, 0, 140))
local btnPremium = CreateLoginBtn("KEY PRIMION", COLORS.GoldNeon, "⭐", UDim2.new(0, 30, 0, 205))
local btnSupport = CreateLoginBtn("SUPPORT", COLORS.PurpleNeon, "💬", UDim2.new(0, 30, 0, 270))

local input = Instance.new("TextBox")
input.Size = UDim2.new(0, 310, 0, 50)
input.Position = UDim2.new(0, 310, 0, 140)
input.BackgroundColor3 = COLORS.Glass
input.PlaceholderText = "Cole a sua chave aqui..."
input.Text = ""
input.TextColor3 = COLORS.Text
input.Parent = loginFrame
Instance.new("UICorner", input)

local check = Instance.new("TextButton")
check.Size = UDim2.new(0, 310, 0, 60)
check.Position = UDim2.new(0, 310, 0, 205)
check.BackgroundColor3 = Color3.fromRGB(15, 30, 20)
check.Text = "CHECK KEY"
check.TextColor3 = COLORS.GreenNeon
check.Font = "GothamBold"
check.TextSize = 22
check.Parent = loginFrame
Instance.new("UICorner", check)
Instance.new("UIStroke", check).Color = COLORS.GreenNeon

local status = Instance.new("TextLabel")
status.Size = UDim2.new(0, 310, 0, 30)
status.Position = UDim2.new(0, 310, 0, 275)
status.BackgroundTransparency = 1
status.Text = "Aguardando chave..."
status.TextColor3 = Color3.fromRGB(150, 150, 150)
status.Parent = loginFrame

btnGet.MouseButton1Click:Connect(function() setclipboard(LINK_GET_KEY); status.Text = "✅ Link copiado!" end)
btnSupport.MouseButton1Click:Connect(function() setclipboard(LINK_DISCORD); status.Text = "💬 Discord copiado!" end)

check.MouseButton1Click:Connect(function()
    if input.Text:gsub("%s+", "") == KEY_CORRETA then
        status.Text = "✅ Autorizado!"
        task.wait(0.5)
        loginFrame:Destroy()
        AbrirHubUniversal() -- Inicia a GUI com as novas funções
    else
        status.Text = "❌ Chave Errada!"
        input.Text = ""
    end
end)
