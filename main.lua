local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- CORES PREMIUM
local COLORS = {
    BG = Color3.fromRGB(15, 17, 22),
    Sidebar = Color3.fromRGB(20, 22, 28),
    Accent = Color3.fromRGB(0, 255, 127),
    Gold = Color3.fromRGB(255, 200, 50),
    Text = Color3.fromRGB(255, 255, 255)
}

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV4") then playerGui.PrimionV4:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4"
sg.IgnoreGuiInset = true
sg.Parent = playerGui

-----------------------------------------------------------
-- FUNÇÃO: CRIAR GUI DE FUNÇÕES (ABAS LATERAIS)
-----------------------------------------------------------
local function AbrirHubPrincipal()
    local mainHub = Instance.new("Frame")
    mainHub.Size = UDim2.new(0, 650, 0, 400)
    mainHub.Position = UDim2.new(0.5, -325, 0.5, -200)
    mainHub.BackgroundColor3 = COLORS.BG
    mainHub.Parent = sg
    Instance.new("UICorner", mainHub).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", mainHub).Color = COLORS.Accent

    -- Sidebar (Menu Esquerdo)
    local sidebar = Instance.new("Frame")
    sidebar.Size = UDim2.new(0, 150, 1, 0)
    sidebar.BackgroundColor3 = COLORS.Sidebar
    sidebar.Parent = mainHub
    Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

    local sideLayout = Instance.new("UIListLayout", sidebar)
    sideLayout.Padding = UDim.new(0, 5)
    sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    -- Título na Sidebar
    local sideTitle = Instance.new("TextLabel")
    sideTitle.Size = UDim2.new(1, 0, 0, 50)
    sideTitle.Text = "PRIMION V4"
    sideTitle.TextColor3 = COLORS.Gold
    sideTitle.Font = Enum.Font.GothamBold
    sideTitle.TextSize = 18
    sideTitle.BackgroundTransparency = 1
    sideTitle.Parent = sidebar

    -- Área de Conteúdo (Direita)
    local contentArea = Instance.new("Frame")
    contentArea.Size = UDim2.new(1, -160, 1, -20)
    contentArea.Position = UDim2.new(0, 155, 0, 10)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = mainHub

    -- Páginas das Abas
    local pages = {}
    local function CreatePage(name)
        local page = Instance.new("ScrollingFrame")
        page.Size = UDim2.new(1, 0, 1, 0)
        page.Visible = false
        page.BackgroundTransparency = 1
        page.ScrollBarThickness = 2
        page.Parent = contentArea
        pages[name] = page
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, 30)
        label.Text = "--- SEÇÃO: " .. name:upper() .. " ---"
        label.TextColor3 = COLORS.Accent
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.Parent = page
        
        return page
    end

    -- Criando as 5 abas solicitadas
    local pMenu = CreatePage("Menu")
    local pESP = CreatePage("ESP")
    local pFPS = CreatePage("FPS Killer")
    local pPlayer = CreatePage("Player")
    local pConfig = CreatePage("Configuração")

    -- Função para trocar de aba
    local function ShowPage(name)
        for _, p in pairs(pages) do p.Visible = false end
        pages[name].Visible = true
    end

    local function AddTab(name)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.9, 0, 0, 40)
        btn.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
        btn.Text = name
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = Enum.Font.GothamMedium
        btn.TextSize = 14
        btn.Parent = sidebar
        Instance.new("UICorner", btn)
        
        btn.MouseButton1Click:Connect(function()
            ShowPage(name)
        end)
    end

    AddTab("Menu")
    AddTab("ESP")
    AddTab("FPS Killer")
    AddTab("Player")
    AddTab("Configuração")

    ShowPage("Menu") -- Começa no Menu
end

-----------------------------------------------------------
-- TELA DE KEY (VISUAL DA FOTO + MENSAGEM LIFETIME)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 550, 0, 350)
loginFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
loginFrame.BackgroundColor3 = COLORS.BG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)
Instance.new("UIStroke", loginFrame).Color = COLORS.Accent

-- Mensagem do Robux e Lifetime
local promoMsg = Instance.new("TextLabel")
promoMsg.Size = UDim2.new(1, 0, 0, 30)
promoMsg.Position = UDim2.new(0, 0, 0, 60)
promoMsg.Text = "⭐ Primion Lifetime: 100 Robux - Acesso Infinito ⭐"
promoMsg.TextColor3 = COLORS.Gold
promoMsg.Font = Enum.Font.GothamBold
promoMsg.TextSize = 14
promoMsg.BackgroundTransparency = 1
promoMsg.Parent = loginFrame

-- Barra de Input
local input = Instance.new("TextBox")
input.Size = UDim2.new(0.8, 0, 0, 45)
input.Position = UDim2.new(0.1, 0, 0, 110)
input.BackgroundColor3 = COLORS.Sidebar
input.PlaceholderText = "Cole sua chave aqui..."
input.Text = ""
input.TextColor3 = Color3.new(1,1,1)
input.Parent = loginFrame
Instance.new("UICorner", input)

-- Botões Lado a Lado
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(0.8, 0, 0, 50)
btnContainer.Position = UDim2.new(0.1, 0, 0, 170)
btnContainer.BackgroundTransparency = 1
btnContainer.Parent = loginFrame
Instance.new("UIListLayout", btnContainer).FillDirection = Enum.FillDirection.Horizontal
Instance.new("UIListLayout", btnContainer).Padding = UDim.new(0, 10)

local function QuickBtn(name, color, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.32, 0, 1, 0)
    b.BackgroundColor3 = color
    b.Text = name
    b.Font = Enum.Font.GothamBold
    b.TextColor3 = Color3.new(1,1,1)
    b.Parent = btnContainer
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(callback)
end

QuickBtn("GET KEY", Color3.fromRGB(255, 100, 0), function() setclipboard("link") end)
QuickBtn("CHECK KEY", COLORS.Accent, function()
    if input.Text == KEY_CORRETA then
        loginFrame:Destroy()
        AbrirHubPrincipal()
    end
end)
QuickBtn("PREMIUM", COLORS.Gold, function() setclipboard(LINK_GAMEPASS) end)
