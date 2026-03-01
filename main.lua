local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- CONFIGURAÇÕES
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

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV4") then playerGui.PrimionV4:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4"
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- 1. PARTE: GUI UNIVERSAL PROFISSIONAL (O HUB)
-----------------------------------------------------------
local function AbrirHubUniversal()
    local mainHub = Instance.new("Frame")
    mainHub.Name = "UniversalHub"
    mainHub.Size = UDim2.new(0, 550, 0, 350)
    mainHub.Position = UDim2.new(0.5, -275, 0.5, -175)
    mainHub.BackgroundColor3 = COLORS.MainBG
    mainHub.Visible = true
    mainHub.Parent = sg
    
    Instance.new("UICorner", mainHub).CornerRadius = UDim.new(0, 12)
    local stroke = Instance.new("UIStroke", mainHub)
    stroke.Color = COLORS.BlueNeon
    stroke.Thickness = 2

    -- Sidebar lateral elegante
    local sidebar = Instance.new("Frame")
    sidebar.Size = UDim2.new(0, 140, 1, 0)
    sidebar.BackgroundColor3 = COLORS.Glass
    sidebar.Parent = mainHub
    Instance.new("UICorner", sidebar)

    local layout = Instance.new("UIListLayout", sidebar)
    layout.Padding = UDim.new(0, 5)
    layout.HorizontalAlignment = "Center"

    -- Título no Hub
    local hTitle = Instance.new("TextLabel")
    hTitle.Size = UDim2.new(0, 140, 0, 50)
    hTitle.Text = "PRIMION UNI"
    hTitle.TextColor3 = COLORS.BlueNeon
    hTitle.Font = "GothamBold"
    hTitle.BackgroundTransparency = 1
    hTitle.Parent = sidebar

    -----------------------------------------------------------
    -- TOGGLE DE ABRIR/FECHAR (BOTÃO FLUTUANTE)
    -----------------------------------------------------------
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 50, 0, 50)
    toggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
    toggleBtn.BackgroundColor3 = COLORS.MainBG
    toggleBtn.Text = "P" -- Letra do seu script
    toggleBtn.TextColor3 = COLORS.BlueNeon
    toggleBtn.Font = "GothamBold"
    toggleBtn.TextSize = 20
    toggleBtn.Parent = sg
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", toggleBtn).Color = COLORS.BlueNeon

    -- Arrastar o Toggle
    local dragging, dragStart, startPos
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
        mainHub.Visible = not mainHub.Visible
    end)

    -- Funções Universais Exemplo (Pode expandir aqui)
    local function AddBtn(txt, callback)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.9, 0, 0, 35)
        b.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        b.Text = txt
        b.TextColor3 = Color3.new(1,1,1)
        b.Font = "GothamMedium"
        b.Parent = sidebar
        Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(callback)
    end

    AddBtn("Speed Hack", function() player.Character.Humanoid.WalkSpeed = 60 end)
    AddBtn("Infinite Jump", function()
        UserInputService.JumpRequest:Connect(function()
            player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end)
    end)
    AddBtn("Full Bright", function() game:GetService("Lighting").Brightness = 2; game:GetService("Lighting").ClockTime = 14 end)
end

-----------------------------------------------------------
-- 2. PARTE: TELA DE LOGIN (ESTÉTICA V2.0)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 650, 0, 380)
loginFrame.Position = UDim2.new(0.5, -325, 0.5, -190)
loginFrame.BackgroundColor3 = COLORS.MainBG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)
Instance.new("UIStroke", loginFrame).Color = COLORS.Border

-- [Títulos e Botões Laterais Esquerda - Iguais ao anterior]
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

-- PAINEL DIREITO (ENTRADA)
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

-- LÓGICA DE TRANSIÇÃO
btnGet.MouseButton1Click:Connect(function() setclipboard(LINK_GET_KEY); status.Text = "✅ Link copiado!" end)
btnSupport.MouseButton1Click:Connect(function() setclipboard(LINK_DISCORD); status.Text = "💬 Discord copiado!" end)

check.MouseButton1Click:Connect(function()
    if input.Text:gsub("%s+", "") == KEY_CORRETA then
        status.Text = "✅ Autorizado!"
        task.wait(0.5)
        loginFrame:Destroy() -- Deleta o login
        AbrirHubUniversal() -- Cria a GUI Profissional e o Toggle
    else
        status.Text = "❌ Chave Errada!"
        input.Text = ""
    end
end)
