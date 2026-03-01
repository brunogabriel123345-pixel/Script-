local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

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
sg.ResetOnSpawn = false
sg.IgnoreGuiInset = true
sg.Parent = playerGui

-----------------------------------------------------------
-- FUNÇÃO: CRIAR BOTÃO DE TOGGLE
-----------------------------------------------------------
local function CriarToggleButton(mainHub)
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "Toggle"
    toggleBtn.Size = UDim2.new(0, 40, 0, 40)
    toggleBtn.Position = UDim2.new(0, 10, 0, 10)
    toggleBtn.BackgroundColor3 = COLORS.BG
    toggleBtn.Text = "P"
    toggleBtn.TextColor3 = COLORS.Accent
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 20
    toggleBtn.Parent = sg
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", toggleBtn).Color = COLORS.Accent

    toggleBtn.MouseButton1Click:Connect(function()
        mainHub.Visible = not mainHub.Visible
    end)
end

-----------------------------------------------------------
-- FUNÇÃO: HUB PRINCIPAL
-----------------------------------------------------------
local function AbrirHubPrincipal()
    local mainHub = Instance.new("Frame")
    mainHub.Name = "MainFrame"
    mainHub.Size = UDim2.new(0, 650, 0, 400)
    mainHub.Position = UDim2.new(0.5, -325, 0.5, -200)
    mainHub.BackgroundColor3 = COLORS.BG
    mainHub.Parent = sg
    Instance.new("UICorner", mainHub).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", mainHub).Color = COLORS.Accent

    -- Arrastar GUI (Draggable)
    local dragging, dragInput, dragStart, startPos
    mainHub.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = mainHub.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainHub.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)

    -- Sidebar
    local sidebar = Instance.new("Frame")
    sidebar.Size = UDim2.new(0, 150, 1, 0)
    sidebar.BackgroundColor3 = COLORS.Sidebar
    sidebar.Parent = mainHub
    Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

    local sideLayout = Instance.new("UIListLayout", sidebar)
    sideLayout.Padding = UDim.new(0, 5)
    sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    sideLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local sideTitle = Instance.new("TextLabel")
    sideTitle.Size = UDim2.new(1, 0, 0, 50)
    sideTitle.Text = "PRIMION V4"
    sideTitle.TextColor3 = COLORS.Gold
    sideTitle.Font = Enum.Font.GothamBold
    sideTitle.TextSize = 18
    sideTitle.BackgroundTransparency = 1
    sideTitle.Parent = sidebar

    local contentArea = Instance.new("Frame")
    contentArea.Size = UDim2.new(1, -160, 1, -20)
    contentArea.Position = UDim2.new(0, 155, 0, 10)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = mainHub

    local pages = {}
    local function CreatePage(name)
        local page = Instance.new("ScrollingFrame")
        page.Size = UDim2.new(1, 0, 1, 0)
        page.Visible = false
        page.BackgroundTransparency = 1
        page.ScrollBarThickness = 2
        page.Parent = contentArea
        pages[name] = page
        
        local layout = Instance.new("UIListLayout", page)
        layout.Padding = UDim.new(0, 8)
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, 30)
        label.Text = "--- SEÇÃO: " .. name:upper() .. " ---"
        label.TextColor3 = COLORS.Accent
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.Parent = page
        
        return page
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
            for _, p in pairs(pages) do p.Visible = false end
            pages[name].Visible = true
        end)
    end

    CreatePage("Menu"); CreatePage("ESP"); CreatePage("FPS Killer"); CreatePage("Player"); CreatePage("Configuração")
    AddTab("Menu"); AddTab("ESP"); AddTab("FPS Killer"); AddTab("Player"); AddTab("Configuração")

    pages["Menu"].Visible = true
    CriarToggleButton(mainHub) -- Ativa o toggle após o login
end

-----------------------------------------------------------
-- TELA DE LOGIN
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 550, 0, 350)
loginFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
loginFrame.BackgroundColor3 = COLORS.BG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)
Instance.new("UIStroke", loginFrame).Color = COLORS.Accent

local promoMsg = Instance.new("TextLabel")
promoMsg.Size = UDim2.new(1, 0, 0, 30)
promoMsg.Position = UDim2.new(0, 0, 0, 60)
promoMsg.Text = "⭐ Primion Lifetime: 100 Robux - Acesso Infinito ⭐"
promoMsg.TextColor3 = COLORS.Gold
promoMsg.Font = Enum.Font.GothamBold
promoMsg.TextSize = 14
promoMsg.BackgroundTransparency = 1
promoMsg.Parent = loginFrame

local input = Instance.new("TextBox")
input.Size = UDim2.new(0.8, 0, 0, 45)
input.Position = UDim2.new(0.1, 0, 0, 110)
input.BackgroundColor3 = COLORS.Sidebar
input.PlaceholderText = "Cole sua chave aqui..."
input.Text = ""
input.TextColor3 = Color3.new(1,1,1)
input.Parent = loginFrame
Instance.new("UICorner", input)

local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(0.8, 0, 0, 50)
btnContainer.Position = UDim2.new(0.1, 0, 0, 170)
btnContainer.BackgroundTransparency = 1
btnContainer.Parent = loginFrame

local hLayout = Instance.new("UIListLayout", btnContainer)
hLayout.FillDirection = Enum.FillDirection.Horizontal
hLayout.Padding = UDim.new(0, 10)
hLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function QuickBtn(name, color, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.3, 0, 1, 0)
    b.BackgroundColor3 = color
    b.Text = name
    b.Font = Enum.Font.GothamBold
    b.TextColor3 = Color3.new(1,1,1)
    b.Parent = btnContainer
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(callback)
end

QuickBtn("GET KEY", Color3.fromRGB(255, 100, 0), function() setclipboard("SEU_LINK_DE_KEY_AQUI") end)
QuickBtn("CHECK KEY", COLORS.Accent, function()
    -- Correção: string.gsub remove espaços extras que o usuário possa colar sem querer
    if input.Text:gsub("%s+", "") == KEY_CORRETA then
        loginFrame:Destroy()
        AbrirHubPrincipal()
    else
        input.Text = ""
        input.PlaceholderText = "CHAVE INCORRETA!"
        task.wait(2)
        input.PlaceholderText = "Cole sua chave aqui..."
    end
end)
QuickBtn("PREMIUM", COLORS.Gold, function() setclipboard(LINK_GAMEPASS) end)
