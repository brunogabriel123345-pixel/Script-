-- PRIMION EXECUTOR V2.0 - PAINEL DE FUNÇÕES (GUI)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- CORES DA FOTO V2.0
local COLORS = {
    MainBG = Color3.fromRGB(12, 18, 24),
    Stroke = Color3.fromRGB(0, 255, 127), -- Verde Neon
    Accent = Color3.fromRGB(255, 215, 100), -- Dourado
    ButtonBG = Color3.fromRGB(20, 28, 38)
}

local function CriarPainelPrincipal()
    -- Limpeza de GUI antiga
    if playerGui:FindFirstChild("PrimionHubV2") then playerGui.PrimionHubV2:Destroy() end

    local sg = Instance.new("ScreenGui")
    sg.Name = "PrimionHubV2"
    sg.ResetOnSpawn = false
    sg.Parent = playerGui

    -- BOTÃO DE TOGGLE (Aquele que fica no canto para abrir/fechar)
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 50, 0, 50)
    toggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
    toggleBtn.BackgroundColor3 = COLORS.MainBG
    toggleBtn.Text = "P" -- Ícone do Primion
    toggleBtn.TextColor3 = COLORS.Stroke
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 24
    toggleBtn.Parent = sg
    
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)
    local tStroke = Instance.new("UIStroke", toggleBtn)
    tStroke.Color = COLORS.Stroke
    tStroke.Thickness = 2

    -- PAINEL PRINCIPAL
    local mainHub = Instance.new("Frame")
    mainHub.Size = UDim2.new(0, 500, 0, 350)
    mainHub.Position = UDim2.new(0.5, -250, 0.5, -175)
    mainHub.BackgroundColor3 = COLORS.MainBG
    mainHub.Visible = false -- Começa fechado
    mainHub.ClipsDescendants = true
    mainHub.Parent = sg

    Instance.new("UICorner", mainHub).CornerRadius = UDim.new(0, 15)
    local hStroke = Instance.new("UIStroke", mainHub)
    hStroke.Color = COLORS.Stroke
    hStroke.Thickness = 2
    hStroke.Transparency = 0.4

    -- CABEÇALHO DO PAINEL
    local header = Instance.new("TextLabel")
    header.Size = UDim2.new(1, 0, 0, 50)
    header.Text = "PRIMION EXECUTOR - HUB V2.0"
    header.TextColor3 = COLORS.Accent
    header.Font = Enum.Font.GothamBold
    header.TextSize = 18
    header.BackgroundTransparency = 1
    header.Parent = mainHub

    -- CONTAINER DE SCROLL PARA AS FUNÇÕES
    local container = Instance.new("ScrollingFrame")
    container.Size = UDim2.new(1, -20, 1, -60)
    container.Position = UDim2.new(0, 10, 0, 55)
    container.BackgroundTransparency = 1
    container.ScrollBarThickness = 4
    container.ScrollBarImageColor3 = COLORS.Stroke
    container.CanvasSize = UDim2.new(0, 0, 0, 500) -- Aumente se tiver muitos botões
    container.Parent = mainHub

    local layout = Instance.new("UIListLayout", container)
    layout.Padding = UDim.new(0, 10)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    -- FUNÇÃO PARA CRIAR BOTÕES DE CHEAT (Estilo Premium)
    local function AddCheat(name, desc, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.95, 0, 0, 60)
        btn.BackgroundColor3 = COLORS.ButtonBG
        btn.Text = ""
        btn.Parent = container
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
        
        local s = Instance.new("UIStroke", btn)
        s.Color = Color3.fromRGB(50, 60, 75)
        s.Thickness = 1

        local tName = Instance.new("TextLabel")
        tName.Size = UDim2.new(1, -20, 0, 30)
        tName.Position = UDim2.new(0, 15, 0, 5)
        tName.Text = name
        tName.TextColor3 = Color3.new(1,1,1)
        tName.Font = Enum.Font.GothamBold
        tName.TextSize = 16
        tName.TextXAlignment = Enum.TextXAlignment.Left
        tName.BackgroundTransparency = 1
        tName.Parent = btn

        local tDesc = Instance.new("TextLabel")
        tDesc.Size = UDim2.new(1, -20, 0, 20)
        tDesc.Position = UDim2.new(0, 15, 0, 30)
        tDesc.Text = desc
        tDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
        tDesc.Font = Enum.Font.Gotham
        tDesc.TextSize = 12
        tDesc.TextXAlignment = Enum.TextXAlignment.Left
        tDesc.BackgroundTransparency = 1
        tDesc.Parent = btn

        btn.MouseButton1Click:Connect(function()
            -- Efeito de clique
            s.Color = COLORS.Stroke
            task.wait(0.1)
            s.Color = Color3.fromRGB(50, 60, 75)
            callback()
        end)
    end

    -----------------------------------------------------------
    -- ADICIONE SUAS FUNÇÕES AQUI
    -----------------------------------------------------------
    AddCheat("FLY / VOAR", "Permite voar pelo mapa livremente", function()
        print("Ativando Fly...")
        -- Coloque seu script de voar aqui
    end)

    AddCheat("SPEED HACK", "Aumenta a velocidade do personagem", function()
        player.Character.Humanoid.WalkSpeed = 50
    end)

    AddCheat("INFINITE JUMP", "Pule quantas vezes quiser no ar", function()
        print("Jump ativado!")
    end)

    AddCheat("NOCLIP", "Atravessar paredes e objetos", function()
        print("Noclip ativado!")
    end)

    -----------------------------------------------------------
    -- LÓGICA DE ABRIR/FECHAR
    -----------------------------------------------------------
    toggleBtn.MouseButton1Click:Connect(function()
        mainHub.Visible = not mainHub.Visible
    end)

    -- Permitir arrastar o painel
    local dragging, dragInput, dragStart, startPos
    mainHub.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainHub.Position
        end
    end)
    mainHub.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            mainHub.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- Para testar direto, você pode chamar a função:
-- CriarPainelPrincipal()

-- No seu script original, você deve chamar essa função dentro do botão de "Check Key" quando a senha estiver certa.
