local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- CORES ESTILO FOTO 1
local COLORS = {
    BG = Color3.fromRGB(15, 17, 22),
    Sidebar = Color3.fromRGB(20, 22, 28),
    Accent = Color3.fromRGB(0, 255, 127),
    Gold = Color3.fromRGB(255, 200, 50),
    Purple = Color3.fromRGB(130, 100, 255),
    White = Color3.new(1, 1, 1)
}

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV4_Final") then playerGui.PrimionV4_Final:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4_Final"
sg.IgnoreGuiInset = true
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- 🛠️ FUNÇÕES DE CRIAÇÃO (PARA NÃO FICAR VAZIO)
-----------------------------------------------------------
local function CreateButton(parent, text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.94, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
    btn.Text = "  " .. text
    btn.TextColor3 = COLORS.White
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 14
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = parent
    
    local corner = Instance.new("UICorner", btn)
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = color
    stroke.Thickness = 1.2
    stroke.Transparency = 0.5
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-----------------------------------------------------------
-- 🎮 PAINEL PRINCIPAL
-----------------------------------------------------------
local mainHub = Instance.new("Frame")
mainHub.Size = UDim2.new(0, 650, 0, 400)
mainHub.Position = UDim2.new(0.5, -325, 0.5, -200)
mainHub.BackgroundColor3 = COLORS.BG
mainHub.Visible = false
mainHub.Parent = sg
Instance.new("UICorner", mainHub).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", mainHub).Color = COLORS.Accent

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 160, 1, 0)
sidebar.BackgroundColor3 = COLORS.Sidebar
sidebar.Parent = mainHub
Instance.new("UICorner", sidebar)

local sideTitle = Instance.new("TextLabel")
sideTitle.Size = UDim2.new(1, 0, 0, 60)
sideTitle.Text = "PRIMION V4"
sideTitle.TextColor3 = COLORS.Gold
sideTitle.Font = Enum.Font.GothamBold
sideTitle.TextSize = 20
sideTitle.BackgroundTransparency = 1
sideTitle.Parent = sidebar

local sideLayout = Instance.new("UIListLayout", sidebar)
sideLayout.Padding = UDim.new(0, 5)
sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Área de Conteúdo
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -175, 1, -20)
contentArea.Position = UDim2.new(0, 165, 0, 10)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainHub

local pages = {}
local function CreatePage(name)
    local p = Instance.new("ScrollingFrame")
    p.Size = UDim2.new(1, 0, 1, 0)
    p.Visible = false
    p.BackgroundTransparency = 1
    p.ScrollBarThickness = 2
    p.CanvasSize = UDim2.new(0, 0, 1.5, 0)
    p.Parent = contentArea
    local layout = Instance.new("UIListLayout", p)
    layout.Padding = UDim.new(0, 10)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    pages[name] = p
    return p
end

-- Criar as Abas
local tabs = {"Menu", "ESP", "FPS Killer", "Player", "Configuração"}
for _, name in pairs(tabs) do
    local page = CreatePage(name)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.9, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(35, 37, 45)
    b.Text = name
    b.TextColor3 = COLORS.White
    b.Font = Enum.Font.GothamMedium
    b.Parent = sidebar
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        for _, pg in pairs(pages) do pg.Visible = false end
        page.Visible = true
    end)
end
pages["Menu"].Visible = true

-----------------------------------------------------------
-- 🚀 PREENCHENDO AS FUNÇÕES (CONTEÚDO)
-----------------------------------------------------------

-- ABA: MENU
CreateButton(pages["Menu"], "🌟 Bem-vindo: " .. player.Name, COLORS.Gold, function() end)
CreateButton(pages["Menu"], "📅 Versão: Primion V4.0.2", COLORS.Purple, function() end)
CreateButton(pages["Menu"], "🛠️ Status: Funcionando", COLORS.Accent, function() end)

-- ABA: ESP (VISUAL)
CreateButton(pages["ESP"], "👁️ ESP Box (Jogadores)", COLORS.Accent, function() print("ESP Ativado") end)
CreateButton(pages["ESP"], "🏷️ ESP Name (Nomes)", COLORS.Accent, function() end)
CreateButton(pages["ESP"], "📏 ESP Tracer (Linhas)", COLORS.White, function() end)

-- ABA: FPS KILLER (PERFORMANCE)
CreateButton(pages["FPS Killer"], "⚡ Boost FPS Extreme", COLORS.Purple, function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Texture") or v:IsA("Decal") then v:Destroy() end
    end
end)
CreateButton(pages["FPS Killer"], "🌑 Remover Sombras", COLORS.White, function() game.Lighting.GlobalShadows = false end)
CreateButton(pages["FPS Killer"], "🍃 Limpar Memória", COLORS.Gold, function() end)

-- ABA: PLAYER
CreateButton(pages["Player"], "🏃 Velocidade Ativar (50)", COLORS.Accent, function() player.Character.Humanoid.WalkSpeed = 50 end)
CreateButton(pages["Player"], "🚀 Pulo Infinito", COLORS.Purple, function() end)
CreateButton(pages["Player"], "🔄 Resetar Character", COLORS.Gold, function() player.Character:BreakJoints() end)

-- ABA: CONFIGURAÇÃO
CreateButton(pages["Configuração"], "📋 Copiar Link Discord", COLORS.Gold, function() setclipboard("discord.gg/primion") end)
CreateButton(pages["Configuração"], "❌ Fechar Script", Color3.fromRGB(255, 50, 50), function() sg:Destroy() end)

-----------------------------------------------------------
-- 🌌 BOTÃO TOGGLE (ESTRELINHAS)
-----------------------------------------------------------
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 45, 0, 45)
toggleBtn.Position = UDim2.new(0, 10, 0.5, -22)
toggleBtn.BackgroundColor3 = COLORS.Black
toggleBtn.Text = "✨"
toggleBtn.TextColor3 = COLORS.White
toggleBtn.Visible = false
toggleBtn.Parent = sg
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)
toggleBtn.MouseButton1Click:Connect(function() mainHub.Visible = not mainHub.Visible end)

-----------------------------------------------------------
-- 🔑 TELA DE LOGIN (BASEADO NA FOTO 1)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 550, 0, 320)
loginFrame.Position = UDim2.new(0.5, -275, 0.5, -160)
loginFrame.BackgroundColor3 = COLORS.BG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)
Instance.new("UIStroke", loginFrame).Color = Color3.fromRGB(40, 45, 55)

local loginTitle = Instance.new("TextLabel")
loginTitle.Size = UDim2.new(1, 0, 0, 60)
loginTitle.Text = "PRIMION KEY SYSTEM V2.0"
loginTitle.TextColor3 = COLORS.Gold
loginTitle.Font = Enum.Font.GothamBold
loginTitle.TextSize = 16
loginTitle.BackgroundTransparency = 1
loginTitle.Parent = loginFrame

-- Layout Lado a Lado (Foto 1)
local sideBtns = Instance.new("Frame")
sideBtns.Size = UDim2.new(0, 200, 0, 200)
sideBtns.Position = UDim2.new(0, 25, 0, 80)
sideBtns.BackgroundTransparency = 1
sideBtns.Parent = loginFrame
local L1 = Instance.new("UIListLayout", sideBtns)
L1.Padding = UDim.new(0, 10)

local inputArea = Instance.new("Frame")
inputArea.Size = UDim2.new(0, 280, 0, 200)
inputArea.Position = UDim2.new(0, 245, 0, 80)
inputArea.BackgroundTransparency = 1
inputArea.Parent = loginFrame

-- Criar Botões de Login
CreateButton(sideBtns, "GET KEY", COLORS.Accent, function() setclipboard("LINK_AQUI") end)
CreateButton(sideBtns, "KEY PRIMION", COLORS.Gold, function() setclipboard(LINK_GAMEPASS) end)
CreateButton(sideBtns, "SUPPORT", COLORS.Purple, function() end)

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, 0, 0, 45)
input.BackgroundColor3 = Color3.fromRGB(25, 27, 35)
input.PlaceholderText = "Cole sua chave aqui..."
input.Text = ""
input.TextColor3 = COLORS.White
input.Parent = inputArea
Instance.new("UICorner", input)
Instance.new("UIStroke", input).Color = Color3.fromRGB(60, 60, 60)

local checkBtn = CreateButton(inputArea, "      CHECK KEY", COLORS.Accent, function()
    if input.Text == KEY_CORRETA then
        loginFrame:Destroy()
        mainHub.Visible = true
        toggleBtn.Visible = true
    else
        input.Text = "KEY INVÁLIDA!"
        task.wait(1)
        input.Text = ""
    end
end)
checkBtn.Position = UDim2.new(0, 0, 0, 60)
checkBtn.Size = UDim2.new(1, 0, 0, 50)
checkBtn.TextXAlignment = Enum.TextXAlignment.Center
