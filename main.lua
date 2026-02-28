-- PRIMION KEY SYSTEM V2.1 - CLEAN & ORGANIZED
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- CONFIGURAÇÕES ORIGINAIS
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_GET_KEY = "https://link-encurtador.com/exemplo" 
local KEY_CORRETA = "key-htpjvg"

-- CORES MODERNAS
local BG_COLOR = Color3.fromRGB(15, 15, 20)
local GOLD_NEON = Color3.fromRGB(255, 200, 50)
local GREEN_NEON = Color3.fromRGB(0, 255, 100)
local PURPLE_NEON = Color3.fromRGB(120, 120, 250)
local ERROR_RED = Color3.fromRGB(255, 60, 60)

-----------------------------------------------------------
-- 1. TELA DE BLOQUEIO (REORGANIZADA)
-----------------------------------------------------------
local screenBlock = Instance.new("ScreenGui")
screenBlock.Name = "PrimionV2_Clean"
screenBlock.IgnoreGuiInset = true
screenBlock.ResetOnSpawn = false
screenBlock.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 480, 0, 360)
mainFrame.Position = UDim2.new(0.5, -240, 0.5, -180)
mainFrame.BackgroundColor3 = BG_COLOR
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenBlock
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 20)

-- Títulos (Topo)
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 0, 40)
titleText.Position = UDim2.new(0, 0, 0, 15)
titleText.Text = "PRIMION EXECUTOR"
titleText.TextColor3 = GOLD_NEON
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 24
titleText.BackgroundTransparency = 1
titleText.Parent = mainFrame

local subtitleText = Instance.new("TextLabel")
subtitleText.Size = UDim2.new(1, 0, 0, 30)
subtitleText.Position = UDim2.new(0, 0, 0, 50)
subtitleText.Text = "KEY AUTHORIZATION"
subtitleText.TextColor3 = Color3.new(1, 1, 1)
subtitleText.Font = Enum.Font.GothamBold
subtitleText.TextSize = 20
subtitleText.BackgroundTransparency = 1
subtitleText.Parent = mainFrame

-- Layout Simétrico Central
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -120)
contentFrame.Position = UDim2.new(0, 0, 0, 100)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local layoutMain = Instance.new("UIListLayout")
layoutMain.Padding = UDim.new(0, 15)
layoutMain.HorizontalAlignment = Enum.HorizontalAlignment.Center
layoutMain.VerticalAlignment = Enum.VerticalAlignment.Center
layoutMain.Parent = contentFrame

-- Função para criar botões de ação estilizados
local function CreateActionBtn(text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 380, 0, 45)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.Parent = contentFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    
    -- Se o botão for dourado, texto preto para legibilidade
    if color == GOLD_NEON then
        btn.TextColor3 = Color3.new(0, 0, 0)
    end
    
    return btn
end

-- Botões Simétricos e Alinhados
local btnDiscord = CreateActionBtn("🎧 SUPORTE NO DISCORD", PURPLE_NEON)
local btnGet = CreateActionBtn("GET KEY (FREE)", GREEN_NEON)
local btnPrimion = CreateActionBtn("KEY PRIMION (LIFETIME)", GOLD_NEON)

-- Caixa de Entrada estilizada (Alinhada)
local inputKey = Instance.new("TextBox")
inputKey.Size = UDim2.new(0, 380, 0, 45)
inputKey.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
inputKey.Text = ""
inputKey.PlaceholderText = "Cole a sua chave aqui... I"
inputKey.TextColor3 = Color3.new(1,1,1)
inputKey.Font = Enum.Font.Gotham
inputKey.TextSize = 14
inputKey.Parent = contentFrame
Instance.new("UICorner", inputKey).CornerRadius = UDim.new(0, 10)
local strokeKey = Instance.new("UIStroke", inputKey)
strokeKey.Color = Color3.fromRGB(80, 80, 100)
strokeKey.Thickness = 1.5

-- Botão CHECK KEY (Organizado)
local btnCheck = Instance.new("TextButton")
btnCheck.Size = UDim2.new(0, 380, 0, 45)
btnCheck.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
btnCheck.Text = "CHECK KEY"
btnCheck.TextColor3 = GREEN_NEON -- Glow na cor
btnCheck.Font = Enum.Font.GothamBold
btnCheck.TextSize = 16
btnCheck.Parent = contentFrame
Instance.new("UICorner", btnCheck).CornerRadius = UDim.new(0, 10)

-- Feedback (Status de Validação)
local feedback = Instance.new("TextLabel")
feedback.Size = UDim2.new(0.8, 0, 0, 30)
feedback.BackgroundTransparency = 1
feedback.Text = "" -- Começa vazio
feedback.Font = Enum.Font.GothamBold
feedback.TextSize = 14
feedback.Parent = contentFrame

-----------------------------------------------------------
-- 2. PAINEL DE FUNÇÕES (MANTIDO)
-----------------------------------------------------------
local function AbrirPainelPrincipal()
    screenBlock:Destroy() 

    local mainGui = Instance.new("ScreenGui")
    mainGui.Name = "PrimionHub"
    mainGui.Parent = playerGui

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 100, 0, 40)
    toggleBtn.Position = UDim2.new(0, 10, 0.5, 0)
    toggleBtn.BackgroundColor3 = BG_COLOR
    toggleBtn.Text = "ABRIR/FECHAR"
    toggleBtn.TextColor3 = Color3.new(1, 1, 1)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 12
    toggleBtn.Parent = mainGui
    Instance.new("UICorner", toggleBtn)

    local hubFrame = Instance.new("Frame")
    hubFrame.Size = UDim2.new(0, 300, 0, 350)
    hubFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
    hubFrame.BackgroundColor3 = BG_COLOR
    hubFrame.Visible = false
    hubFrame.Active = true
    hubFrame.Draggable = true
    hubFrame.Parent = mainGui
    Instance.new("UICorner", hubFrame)

    local titleHub = Instance.new("TextLabel")
    titleHub.Size = UDim2.new(1, 0, 0, 50)
    titleHub.Text = "PRIMION EXECUTOR"
    titleHub.TextColor3 = GOLD_NEON
    titleHub.Font = Enum.Font.GothamBold
    titleHub.TextSize = 20
    titleHub.BackgroundTransparency = 1
    titleHub.Parent = hubFrame

    local listHub = Instance.new("UIListLayout")
    listHub.Padding = UDim.new(0, 10)
    listHub.HorizontalAlignment = Enum.HorizontalAlignment.Center
    listHub.Parent = hubFrame

    local function CreateCheatBtn(name, color)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.9, 0, 0, 45)
        btn.BackgroundColor3 = color
        btn.Text = name
        btn.Font = Enum.Font.GothamBold
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Parent = hubFrame
        Instance.new("UICorner", btn)
        return btn
    end

    local flyBtn = CreateCheatBtn("FLY (VOAR)", Color3.fromRGB(52, 152, 219))
    local fpsBtn = CreateCheatBtn("FPS KILLER", Color3.fromRGB(231, 76, 60))
    local noclipBtn = CreateCheatBtn("NOCLIP (ATRAVESSAR)", Color3.fromRGB(155, 89, 182))
    local crasherBtn = CreateCheatBtn("SERVER CRASHER", Color3.fromRGB(0, 0, 0))

    toggleBtn.MouseButton1Click:Connect(function()
        hubFrame.Visible = not hubFrame.Visible
    end)

    flyBtn.MouseButton1Click:Connect(function() print("Fly Ativado") end)
    fpsBtn.MouseButton1Click:Connect(function() print("FPS Killer Ativado") end)
    noclipBtn.MouseButton1Click:Connect(function() print("Noclip Ativado") end)
    crasherBtn.MouseButton1Click:Connect(function() print("Crasher Ativado") end)
end

-----------------------------------------------------------
-- LÓGICA DO KEY SYSTEM (MANTIDA)
-----------------------------------------------------------
btnGet.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_GET_KEY) end
    feedback.TextColor3 = GREEN_NEON
    feedback.Text = "Link copiado! Cole no seu navegador."
end)

btnCheck.MouseButton1Click:Connect(function()
    if inputKey.Text == KEY_CORRETA then
        feedback.TextColor3 = GREEN_NEON
        feedback.Text = "✅ Key Válida! Carregando..." -- Mensagem baseada na imagem
        task.wait(1)
        AbrirPainelPrincipal()
    else
        feedback.TextColor3 = ERROR_RED
        feedback.Text = "❌ Key Incorreta!" -- Mensagem baseada na imagem
        -- Efeito simples de tremer na caixa de texto
        local posOriginal = inputKey.Position
        local pos1 = posOriginal + UDim2.new(0, 5, 0, 0)
        local pos2 = posOriginal + UDim2.new(0, -5, 0, 0)
        local tInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        
        for i = 1, 5 do
            TweenService:Create(inputKey, tInfo, {Position = pos1}):Play()
            task.wait(0.05)
            TweenService:Create(inputKey, tInfo, {Position = pos2}):Play()
            task.wait(0.05)
        end
        inputKey.Position = posOriginal
    end
end)

btnPrimion.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_GAMEPASS) end
    feedback.TextColor3 = GOLD_NEON
    feedback.Text = "Link copiado! Apoie o desenvolvedor."
end)

btnDiscord.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_DISCORD) end
    feedback.TextColor3 = PURPLE_NEON
    feedback.Text = "Link do Discord copiado!"
end)
