local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- CONFIGURAÇÕES
local KEY_CORRETA = "key-htpjvg"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"

-- CORES ESTILO FOTO 1
local COLORS = {
    BG = Color3.fromRGB(15, 17, 22),
    Sidebar = Color3.fromRGB(20, 22, 28),
    Green = Color3.fromRGB(0, 255, 127),
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
-- 🔑 TELA DE LOGIN (BASEADO NA FOTO 1)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 500, 0, 280) -- Mais compacto
loginFrame.Position = UDim2.new(0.5, -250, 0.5, -140)
loginFrame.BackgroundColor3 = COLORS.BG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame).CornerRadius = UDim.new(0, 15)

-- Borda brilhante suave
local stroke = Instance.new("UIStroke", loginFrame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(40, 45, 55)

-- TÍTULO COMPACTO
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.Text = "PRIMION KEY SYSTEM V2.0"
title.TextColor3 = COLORS.Gold
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.BackgroundTransparency = 1
title.Parent = loginFrame

-- BARRA LATERAL DE BOTÕES (ESQUERDA)
local sideButtons = Instance.new("Frame")
sideButtons.Size = UDim2.new(0, 180, 0, 180)
sideButtons.Position = UDim2.new(0, 20, 0, 60)
sideButtons.BackgroundTransparency = 1
sideButtons.Parent = loginFrame

local layout = Instance.new("UIListLayout", sideButtons)
layout.Padding = UDim.new(0, 8)

local function CreateLoginBtn(name, color, icon, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(25, 28, 35)
    btn.Text = icon .. "  " .. name
    btn.TextColor3 = color
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Parent = sideButtons
    
    local bCorner = Instance.new("UICorner", btn)
    local bStroke = Instance.new("UIStroke", btn)
    bStroke.Color = color
    bStroke.Transparency = 0.6
    
    btn.MouseButton1Click:Connect(callback)
end

CreateLoginBtn("GET KEY", COLORS.Green, "📥", function() setclipboard("LINK_DA_KEY") end)
CreateLoginBtn("KEY PRIMION", COLORS.Gold, "🔑", function() setclipboard(LINK_GAMEPASS) end)
CreateLoginBtn("SUPPORTe", COLORS.Purple, "💬", function() setclipboard("LINK_DISCORD") end)

-- ÁREA DE INPUT (DIREITA)
local inputArea = Instance.new("Frame")
inputArea.Size = UDim2.new(0, 260, 0, 180)
inputArea.Position = UDim2.new(0, 215, 0, 60)
inputArea.BackgroundTransparency = 1
inputArea.Parent = loginFrame

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, 0, 0, 45)
input.Position = UDim2.new(0, 0, 0, 0)
input.BackgroundColor3 = Color3.fromRGB(25, 28, 35)
input.PlaceholderText = "Cole sua chave aqui..."
input.Text = ""
input.TextColor3 = COLORS.White
input.Font = Enum.Font.GothamMedium
input.Parent = inputArea
Instance.new("UICorner", input)
Instance.new("UIStroke", input).Color = Color3.fromRGB(60, 60, 60)

local checkBtn = Instance.new("TextButton")
checkBtn.Size = UDim2.new(1, 0, 0, 50)
checkBtn.Position = UDim2.new(0, 0, 0, 60)
checkBtn.BackgroundColor3 = Color3.fromRGB(30, 50, 40)
checkBtn.Text = "CHECK KEY"
checkBtn.TextColor3 = COLORS.Green
checkBtn.Font = Enum.Font.GothamBold
checkBtn.TextSize = 16
checkBtn.Parent = inputArea
Instance.new("UICorner", checkBtn)
Instance.new("UIStroke", checkBtn).Color = COLORS.Green

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 120)
status.BackgroundTransparency = 1
status.Text = ""
status.Font = Enum.Font.GothamMedium
status.TextSize = 12
status.Parent = inputArea

-----------------------------------------------------------
-- LÓGICA DE VERIFICAÇÃO
-----------------------------------------------------------
checkBtn.MouseButton1Click:Connect(function()
    if input.Text == KEY_CORRETA then
        status.TextColor3 = COLORS.Green
        status.Text = "✅ Key Válida! Autorizando..."
        task.wait(1)
        loginFrame:Destroy()
        -- Aqui você chamaria a função para abrir o seu MainHub
        print("Acesso Liberado")
    else
        status.TextColor3 = Color3.fromRGB(255, 80, 80)
        status.Text = "❌ Key Incorreta!"
        task.wait(2)
        status.Text = ""
    end
end)
