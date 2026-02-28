-- PRIMION KEY SYSTEM V2.0
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService") -- Para animações suaves de feedback

-- CONFIGURAÇÕES ORIGINAIS (Links mantidos e a chave original)
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_GET_KEY = "https://link-encurtador.com/exemplo" 
local KEY_CORRETA = "key-htpjvg" -- Chave original mantida para teste

-- Cores Modernas baseadas na imagem
local BACKGROUND_DARK = Color3.fromRGB(15, 15, 20)
local TEXT_TITLE_GOLD = Color3.fromRGB(218, 165, 32) -- Goldenrod para o título
local NEON_GREEN_GLOW = Color3.fromRGB(0, 255, 127) -- Para o botão GET KEY
local PRIMION_GOLD_LIGHT = Color3.fromRGB(255, 215, 100) -- Para o botão KEY PRIMION
local SUPPORT_PURPLE = Color3.fromRGB(100, 100, 200) -- Para o botão SUPPORTe
local FEEDBACK_GREEN = Color3.fromRGB(0, 200, 0) -- Mensagem de sucesso
local FEEDBACK_RED = Color3.fromRGB(200, 0, 0) -- Mensagem de erro

-----------------------------------------------------------
-- 1. TELA DE BLOQUEIO (KEY SYSTEM)
-----------------------------------------------------------
local screenBlock = Instance.new("ScreenGui")
screenBlock.Name = "TelaBloqueioProV2"
screenBlock.IgnoreGuiInset = true
screenBlock.ResetOnSpawn = false -- Para não sumir se o jogador renascer
screenBlock.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 480, 0, 350)
mainFrame.Position = UDim2.new(0.5, -240, 0.5, -175)
mainFrame.BackgroundColor3 = BACKGROUND_DARK
mainFrame.BorderSizePixel = 0
mainFrame.Active = true -- Para não clicar no jogo por trás
mainFrame.Parent = screenBlock

-- UICorner para o painel principal
local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 20)

-- Borda Neon sutil
local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(50, 50, 70)
mainStroke.Thickness = 2
mainStroke.Transparency = 0.5
mainStroke.Parent = mainFrame

-- Títulos no topo
local titleBlock = Instance.new("Frame")
titleBlock.Size = UDim2.new(1, 0, 0, 80)
titleBlock.BackgroundTransparency = 1
titleBlock.Parent = mainFrame

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 0, 40)
titleText.Text = "PRIMION EXECUTOR"
titleText.TextColor3 = TEXT_TITLE_GOLD
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 24
titleText.BackgroundTransparency = 1
titleText.Parent = titleBlock

local subtitleText = Instance.new("TextLabel")
subtitleText.Size = UDim2.new(1, 0, 0, 30)
subtitleText.Position = UDim2.new(0, 0, 0, 40)
subtitleText.Text = "KEY AUTHORIZATION"
subtitleText.TextColor3 = Color3.new(1, 1, 1)
subtitleText.Font = Enum.Font.GothamBold
subtitleText.TextSize = 20
subtitleText.BackgroundTransparency = 1
subtitleText.Parent = titleBlock

-- Layout principal para organizar o conteúdo
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -100)
contentFrame.Position = UDim2.new(0, 0, 0, 90)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local layoutMain = Instance.new("UIListLayout")
layoutMain.Padding = UDim.new(0, 15)
layoutMain.HorizontalAlignment = Enum.HorizontalAlignment.Center
layoutMain.VerticalAlignment = Enum.VerticalAlignment.Center
layoutMain.Parent = contentFrame

-- Botão de Suporte (Atendimento) no topo da lista
local btnDiscord = Instance.new("TextButton")
btnDiscord.Size = UDim2.new(0, 350, 0, 45)
btnDiscord.BackgroundColor3 = SUPPORT_PURPLE
btnDiscord.Text = "🎧 ATENDIMENTO / SUPORTE"
btnDiscord.TextColor3 = Color3.new(1, 1, 1)
btnDiscord.Font = Enum.Font.GothamBold
btnDiscord.TextSize = 16
btnDiscord.Parent = contentFrame
Instance.new("UICorner", btnDiscord).CornerRadius = UDim.new(0, 10)

-- Borda Neon no botão
Instance.new("UIStroke", btnDiscord).Color = Color3.fromRGB(150, 150, 255)

-- Container central para os 3 botões grátis/primion
local container = Instance.new("Frame")
container.Size = UDim2.new(0, 400, 0, 60)
container.BackgroundTransparency = 1
container.Parent = contentFrame

local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0.31, 0, 1, 0)
grid.CellPadding = UDim2.new(0.02, 0, 0, 0)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.Parent = container

-- Função para criar botões estilizados
local function CreateStyledButton(text, color)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1, 1, 1) -- Texto branco por padrão
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    
    -- Se o fundo for claro (como ouro), texto preto
    if color == PRIMION_GOLD_LIGHT then
        btn.TextColor3 = Color3.new(0, 0, 0)
    end
    
    -- Borda Neon baseada na cor do botão
    local strokeBtn = Instance.new("UIStroke", btn)
    strokeBtn.Color = Color3.new(color.R * 1.5, color.G * 1.5, color.B * 1.5)
    strokeBtn.Thickness = 1.5
    
    return btn
end

local btnGet = CreateStyledButton("GET KEY", NEON_GREEN_GLOW)
btnGet.Parent = container

local btnCheck = CreateStyledButton("CHECK KEY", Color3.fromRGB(50, 180, 50)) -- Mais escuro, como na imagem
btnCheck.Parent = container

local btnPrimion = CreateStyledButton("KEY PRIMION", PRIMION_GOLD_LIGHT)
btnPrimion.Parent = container

-- Campo de Entrada de Texto estilizado
local inputKey = Instance.new("TextBox")
inputKey.Size = UDim2.new(0, 400, 0, 45)
inputKey.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
inputKey.PlaceholderText = "Insira sua chave aqui..." -- Placeholder mais curto
inputKey.Text = ""
inputKey.TextColor3 = Color3.new(1, 1, 1)
inputKey.Font = Enum.Font.Gotham
inputKey.TextSize = 14
inputKey.Parent = contentFrame
Instance.new("UICorner", inputKey).CornerRadius = UDim.new(0, 10)

-- Borda para a entrada de texto
Instance.new("UIStroke", inputKey).Color = Color3.fromRGB(80, 80, 100)

-- TextLabel para Feedback (✅/❌)
local feedback = Instance.new("TextLabel")
feedback.Size = UDim2.new(0.8, 0, 0, 30)
feedback.BackgroundTransparency = 1
feedback.Text = "" -- Começa vazio
feedback.Font = Enum.Font.GothamBold
feedback.TextSize = 14
feedback.Parent = contentFrame

-- Rodapé com a versão (como na imagem)
local footerText = Instance.new("TextLabel")
footerText.Size = UDim2.new(1, 0, 0, 20)
footerText.Position = UDim2.new(0, 0, 1, -25)
footerText.Text = "PRIMION KEY SYSTEM V2.0"
footerText.TextColor3 = Color3.fromRGB(150, 150, 150)
footerText.Font = Enum.Font.GothamBold
footerText.TextSize = 12
footerText.BackgroundTransparency = 1
footerText.Parent = mainFrame

-----------------------------------------------------------
-- 2. PAINEL DE FUNÇÕES (MANTIDO O ORIGINAL)
-----------------------------------------------------------
local function AbrirPainelPrincipal()
    -- Animação de fade out para a tela de bloqueio
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(mainFrame, tweenInfo, {BackgroundTransparency = 1})
    tween:Play()
    
    -- Remove todos os elementos da tela de bloqueio para o efeito de fade
    for _, item in ipairs(contentFrame:GetChildren()) do if not item:IsA("UIListLayout") then item:Destroy() end end
    titleBlock:Destroy()
    
    tween.Completed:Connect(function()
        screenBlock:Destroy() -- Deleta a tela de bloqueio após animação
    end)

    local mainGui = Instance.new("ScreenGui")
    mainGui.Name = "PrimionHub"
    mainGui.Parent = playerGui

    -- Botão de Toggle (Abrir/Fechar)
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 100, 0, 40)
    toggleBtn.Position = UDim2.new(0, 10, 0.5, 0)
    toggleBtn.BackgroundColor3 = BACKGROUND_DARK -- Usa a nova cor de fundo
    toggleBtn.Text = "ABRIR/FECHAR"
    toggleBtn.TextColor3 = Color3.new(1, 1, 1)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 12
    toggleBtn.Parent = mainGui
    Instance.new("UICorner", toggleBtn)

    -- Frame do Painel
    local hubFrame = Instance.new("Frame")
    hubFrame.Name = "MainFrame"
    hubFrame.Size = UDim2.new(0, 300, 0, 350)
    hubFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
    hubFrame.BackgroundColor3 = BACKGROUND_DARK
    hubFrame.Visible = false -- Começa fechado
    hubFrame.Active = true
    hubFrame.Draggable = true -- Permite arrastar o painel
    hubFrame.Parent = mainGui
    Instance.new("UICorner", hubFrame)

    local titleHub = Instance.new("TextLabel")
    titleHub.Size = UDim2.new(1, 0, 0, 50)
    titleHub.Text = "PRIMION EXECUTOR"
    titleHub.TextColor3 = TEXT_TITLE_GOLD -- Usa a cor dourada do título
    titleHub.Font = Enum.Font.GothamBold
    titleHub.TextSize = 20
    titleHub.BackgroundTransparency = 1
    titleHub.Parent = hubFrame

    local listHub = Instance.new("UIListLayout")
    listHub.Padding = UDim.new(0, 10)
    listHub.HorizontalAlignment = Enum.HorizontalAlignment.Center
    listHub.Parent = hubFrame

    -- Função para criar botões de cheat (MANTIDA ORIGINAL)
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

    -- Toggle Lógica
    toggleBtn.MouseButton1Click:Connect(function()
        hubFrame.Visible = not hubFrame.Visible
    end)

    -- Ações dos Botões
    flyBtn.MouseButton1Click:Connect(function() print("Fly Ativado") end)
    fpsBtn.MouseButton1Click:Connect(function() print("FPS Killer Ativado") end)
    noclipBtn.MouseButton1Click:Connect(function() print("Noclip Ativado") end)
    crasherBtn.MouseButton1Click:Connect(function() print("Crasher Ativado") end)
end

-----------------------------------------------------------
-- LÓGICA DO KEY SYSTEM (VERIFICAÇÃO MANTIDA)
-----------------------------------------------------------
btnGet.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_GET_KEY) end
    feedback.TextColor3 = NEON_GREEN_GLOW
    feedback.Text = "Link da chave copiado para a área de transferência!"
end)

btnCheck.MouseButton1Click:Connect(function()
    if inputKey.Text == KEY_CORRETA then
        feedback.TextColor3 = FEEDBACK_GREEN
        feedback.Text = "✅ Key Válida! Autorizando..." -- Mensagem igual à da imagem
        task.wait(1)
        AbrirPainelPrincipal()
    else
        feedback.TextColor3 = FEEDBACK_RED
        feedback.Text = "❌ Key Incorreta! Tente novamente." -- Mensagem baseada na imagem
        -- Efeito de tremer na caixa de texto
        local currentPos = inputKey.Position
        local tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween1 = TweenService:Create(inputKey, tweenInfo, {Position = currentPos + UDim2.new(0, 5, 0, 0)})
        local tween2 = TweenService:Create(inputKey, tweenInfo, {Position = currentPos + UDim2.new(0, -5, 0, 0)})
        
        for i = 1, 5 do
            tween1:Play()
            task.wait(0.05)
            tween2:Play()
            task.wait(0.05)
        end
        inputKey.Position = currentPos -- Reseta a posição
    end
end)

btnPrimion.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_GAMEPASS) end
    feedback.TextColor3 = PRIMION_GOLD_LIGHT
    feedback.Text = "Link do Gamepass Lifetime copiado!"
end)

btnDiscord.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_DISCORD) end
    feedback.TextColor3 = SUPPORT_PURPLE
    feedback.Text = "Link do suporte no Discord copiado!"
end)
