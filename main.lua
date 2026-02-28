local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- CONFIGURAÇÕES (MANTIDAS)
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_GET_KEY = "https://link-encurtador.com/exemplo" 
local KEY_CORRETA = "key-htpjvg"

-- PALETA DE CORES "NIGHT MODE"
local COLORS = {
    Background = Color3.fromRGB(20, 20, 25),
    Accent = Color3.fromRGB(0, 255, 150),
    Gold = Color3.fromRGB(255, 200, 50),
    Discord = Color3.fromRGB(88, 101, 242),
    Text = Color3.fromRGB(255, 255, 255),
    SecondaryText = Color3.fromRGB(180, 180, 180)
}

-- LIMPEZA DE GUI ANTIGA
if playerGui:FindFirstChild("PrimionSimpleV3") then
    playerGui.PrimionSimpleV3:Destroy()
end

local screen = Instance.new("ScreenGui")
screen.Name = "PrimionSimpleV3"
screen.IgnoreGuiInset = true
screen.Parent = playerGui

-- Frame Principal (Centralizado)
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 400, 0, 450)
main.Position = UDim2.new(0.5, -200, 0.5, -225)
main.BackgroundColor3 = COLORS.Background
main.BorderSizePixel = 0
main.Parent = screen

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 15)
local stroke = Instance.new("UIStroke", main)
stroke.Color = COLORS.Accent
stroke.Thickness = 1.5
stroke.Transparency = 0.6

-- Título e Subtítulo
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 20)
title.Text = "PRIMION EXECUTOR"
title.TextColor3 = COLORS.Gold
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.BackgroundTransparency = 1
title.Parent = main

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 20)
sub.Position = UDim2.new(0, 0, 0, 55)
sub.Text = "Sistema de Autenticação"
sub.TextColor3 = COLORS.SecondaryText
sub.Font = Enum.Font.GothamMedium
sub.TextSize = 14
sub.BackgroundTransparency = 1
sub.Parent = main

-- Função para Criar Botão com Efeito de Hover
local function CreateModernBtn(name, pos, color, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 45)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextSize = 14
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    -- Efeitos Visuais
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = color:Lerp(Color3.new(1,1,1), 0.2), Size = UDim2.new(0.88, 0, 0, 48)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = color, Size = UDim2.new(0.85, 0, 0, 45)}):Play()
    end)
    
    return btn
end

-- Botões de Ação
local btnGet = CreateModernBtn("OBTER CHAVE GRÁTIS", UDim2.new(0.075, 0, 0, 100), COLORS.Accent, main)
local btnPrimion = CreateModernBtn("COMPRAR KEY LIFETIME", UDim2.new(0.075, 0, 0, 155), COLORS.Gold, main)
local btnDiscord = CreateModernBtn("DISCORD SUPORTE", UDim2.new(0.075, 0, 0, 210), COLORS.Discord, main)

-- Input de Texto
local inputKey = Instance.new("TextBox")
inputKey.Size = UDim2.new(0.85, 0, 0, 50)
inputKey.Position = UDim2.new(0.075, 0, 0, 280)
inputKey.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
inputKey.PlaceholderText = "Cole sua Key aqui..."
inputKey.Text = ""
inputKey.TextColor3 = Color3.new(1,1,1)
inputKey.Font = Enum.Font.Gotham
inputKey.Parent = main
Instance.new("UICorner", inputKey).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", inputKey).Color = Color3.fromRGB(60, 60, 70)

-- Botão de Verificação (Check)
local btnCheck = CreateModernBtn("VERIFICAR ACESSO", UDim2.new(0.075, 0, 0, 345), Color3.fromRGB(40, 40, 45), main)
btnCheck.TextColor3 = COLORS.Accent

-- Label de Feedback
local feedback = Instance.new("TextLabel")
feedback.Size = UDim2.new(1, 0, 0, 30)
feedback.Position = UDim2.new(0, 0, 0, 400)
feedback.BackgroundTransparency = 1
feedback.Text = ""
feedback.Font = Enum.Font.GothamMedium
feedback.TextSize = 14
feedback.Parent = main

-----------------------------------------------------------
-- LÓGICA
-----------------------------------------------------------
local function AbrirPainel()
    screen:Destroy()
    print("Sucesso! O painel principal abriria aqui.")
    -- Aqui você chamaria a sua função AbrirPainelPrincipal() original
end

btnCheck.MouseButton1Click:Connect(function()
    if inputKey.Text == KEY_CORRETA then
        feedback.TextColor3 = COLORS.Accent
        feedback.Text = "Acesso Permitido! Carregando..."
        task.wait(1)
        AbrirPainel()
    else
        feedback.TextColor3 = Color3.fromRGB(255, 100, 100)
        feedback.Text = "Chave Inválida. Tente novamente."
        -- Efeito de Erro (Shake)
        local originalPos = main.Position
        for i = 1, 6 do
            main.Position = originalPos + UDim2.new(0, math.random(-5, 5), 0, 0)
            task.wait(0.05)
        end
        main.Position = originalPos
    end
end)

btnGet.MouseButton1Click:Connect(function() setclipboard(LINK_GET_KEY) feedback.Text = "Link da Key Copiado!" end)
btnPrimion.MouseButton1Click:Connect(function() setclipboard(LINK_GAMEPASS) feedback.Text = "Link Gamepass Copiado!" end)
btnDiscord.MouseButton1Click:Connect(function() setclipboard(LINK_DISCORD) feedback.Text = "Link Discord Copiado!" end)
