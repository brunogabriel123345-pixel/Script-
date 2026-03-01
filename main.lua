local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- CORES
local COLORS = {
    BG = Color3.fromRGB(15, 17, 22),
    Sidebar = Color3.fromRGB(20, 22, 28),
    Accent = Color3.fromRGB(0, 255, 127),
    Gold = Color3.fromRGB(255, 200, 50),
    Black = Color3.fromRGB(0, 0, 0),
    White = Color3.new(1,1,1)
}

-- LIMPEZA
if playerGui:FindFirstChild("PrimionV4_Final") then playerGui.PrimionV4_Final:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4_Final"
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- 🛠️ UTILITÁRIOS DE INTERFACE
-----------------------------------------------------------
local function CreateButton(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(40, 44, 52)
    btn.Text = text
    btn.TextColor3 = COLORS.White
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 14
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function CreateToggle(parent, text, callback)
    local state = false
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(30, 33, 40)
    btn.Text = text .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(200, 50, 50)
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = parent
    Instance.new("UICorner", btn)
    
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. (state and ": ON" or ": OFF")
        btn.TextColor3 = state and COLORS.Accent or Color3.fromRGB(200, 50, 50)
        callback(state)
    end)
end

-----------------------------------------------------------
-- 🌌 BOTÃO TOGGLE (ESCONDER/MOSTRAR)
-----------------------------------------------------------
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 45, 0, 45)
toggleBtn.Position = UDim2.new(0, 10, 0.5, -22)
toggleBtn.BackgroundColor3 = COLORS.Black
toggleBtn.Text = "✨\n. * . "
toggleBtn.TextColor3 = COLORS.White
toggleBtn.Visible = false
toggleBtn.Parent = sg
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)

-----------------------------------------------------------
-- 🎮 PAINEL PRINCIPAL
-----------------------------------------------------------
local mainHub = Instance.new("Frame")
mainHub.Size = UDim2.new(0, 650, 0, 400)
mainHub.Position = UDim2.new(0.5, -325, 0.5, -200)
mainHub.BackgroundColor3 = COLORS.BG
mainHub.Visible = false
mainHub.Parent = sg
Instance.new("UICorner", mainHub)
Instance.new("UIStroke", mainHub).Color = COLORS.Accent

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 150, 1, 0)
sidebar.BackgroundColor3 = COLORS.Sidebar
sidebar.Parent = mainHub
Instance.new("UICorner", sidebar)

local sideLayout = Instance.new("UIListLayout", sidebar)
sideLayout.Padding = UDim.new(0, 5)
sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -165, 1, -20)
contentArea.Position = UDim2.new(0, 155, 0, 10)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainHub

local pages = {}
local function CreatePage(name)
    local p = Instance.new("ScrollingFrame")
    p.Size = UDim2.new(1, 0, 1, 0)
    p.Visible = false
    p.CanvasSize = UDim2.new(0,0,2,0)
    p.ScrollBarThickness = 3
    p.BackgroundTransparency = 1
    p.Parent = contentArea
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 10)
    pages[name] = p
    return p
end

local tabs = {"Menu", "ESP", "FPS Killer", "Player", "Configuração"}
for _, name in pairs(tabs) do
    local p = CreatePage(name)
    local b = CreateButton(sidebar, name, function()
        for _, pg in pairs(pages) do pg.Visible = false end
        p.Visible = true
    end)
end
pages["Menu"].Visible = true

-----------------------------------------------------------
-- 📝 FUNÇÕES DAS ABAS
-----------------------------------------------------------

-- ABRA: MENU (INFO)
local info = Instance.new("TextLabel", pages["Menu"])
info.Size = UDim2.new(1,0,0,100)
info.Text = "Bem-vindo ao Primion V4\nStatus: Online\nUser: "..player.Name
info.TextColor3 = COLORS.Gold
info.BackgroundTransparency = 1

-- ABRA: ESP (VER JOGADORES)
CreateToggle(pages["ESP"], "Esp Box", function(val)
    _G.EspBox = val
    while _G.EspBox do
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                if not v.Character.HumanoidRootPart:FindFirstChild("Box") then
                    local b = Instance.new("BoxHandleAdornment", v.Character.HumanoidRootPart)
                    b.Name = "Box"
                    b.AlwaysOnTop = true
                    b.ZIndex = 10
                    b.Size = Vector3.new(4, 5, 1)
                    b.Transparency = 0.5
                    b.Color3 = COLORS.Accent
                    b.Adornee = v.Character.HumanoidRootPart
                end
            end
        end
        task.wait(1)
    end
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v.Character.HumanoidRootPart:FindFirstChild("Box") then
            v.Character.HumanoidRootPart.Box:Destroy()
        end
    end
end)

-- ABRA: FPS KILLER (OTIMIZAÇÃO)
CreateButton(pages["FPS Killer"], "Remover Texturas (Boost FPS)", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Texture") or v:IsA("Decal") then
            v:Destroy()
        end
    end
end)
CreateToggle(pages["FPS Killer"], "Sombras (On/Off)", function(val)
    game:GetService("Lighting").GlobalShadows = val
end)

-- ABRA: PLAYER (MOVIMENTAÇÃO)
CreateButton(pages["Player"], "Velocidade Correr (50)", function()
    player.Character.Humanoid.WalkSpeed = 50
end)
CreateButton(pages["Player"], "Pulo Infinito", function()
    UserInputService.JumpRequest:Connect(function()
        player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end)
end)
CreateButton(pages["Player"], "Resetar Status", function()
    player.Character.Humanoid.WalkSpeed = 16
    player.Character.Humanoid.JumpPower = 50
end)

-- ABRA: CONFIGURAÇÃO
CreateButton(pages["Configuração"], "Copiar Link Discord", function()
    setclipboard("https://discord.gg/primion")
end)
CreateButton(pages["Configuração"], "Destruir Script", function()
    sg:Destroy()
end)

-----------------------------------------------------------
-- 🔑 TELA DE LOGIN
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 550, 0, 350)
loginFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
loginFrame.BackgroundColor3 = COLORS.BG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)

local input = Instance.new("TextBox")
input.Size = UDim2.new(0.8, 0, 0, 45)
input.Position = UDim2.new(0.1, 0, 0, 100)
input.BackgroundColor3 = COLORS.Sidebar
input.PlaceholderText = "Cole sua key aqui..."
input.TextColor3 = COLORS.White
input.Parent = loginFrame
Instance.new("UICorner", input)

local btnGrid = Instance.new("Frame")
btnGrid.Size = UDim2.new(0.8, 0, 0, 50)
btnGrid.Position = UDim2.new(0.1, 0, 0, 160)
btnGrid.BackgroundTransparency = 1
btnGrid.Parent = loginFrame
Instance.new("UIListLayout", btnGrid).FillDirection = Enum.FillDirection.Horizontal

CreateButton(btnGrid, "CHECK KEY", function()
    if input.Text == KEY_CORRETA then
        loginFrame:Destroy()
        mainHub.Visible = true
        toggleBtn.Visible = true
    else
        input.Text = "ERRO!"
        task.wait(1)
        input.Text = ""
    end
end).Size = UDim2.new(0.5, -5, 1, 0)

-- LOGICA FINAL
toggleBtn.MouseButton1Click:Connect(function()
    mainHub.Visible = not mainHub.Visible
end)
