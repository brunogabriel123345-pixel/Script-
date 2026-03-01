local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- CONFIGURAÇÕES (MANTIDAS)
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

if playerGui:FindFirstChild("PrimionV4") then playerGui.PrimionV4:Destroy() end
local sg = Instance.new("ScreenGui")
sg.Name = "PrimionV4"
sg.ResetOnSpawn = false
sg.Parent = playerGui

-----------------------------------------------------------
-- 1. PARTE: GUI UNIVERSAL (COM SUPER BOOST FPS E FLY)
-----------------------------------------------------------
local function AbrirHubUniversal()
    local mainHub = Instance.new("Frame")
    mainHub.Name = "UniversalHub"
    mainHub.Size = UDim2.new(0, 450, 0, 350)
    mainHub.Position = UDim2.new(0.5, -225, 0.5, -175)
    mainHub.BackgroundColor3 = COLORS.MainBG
    mainHub.BorderSizePixel = 0
    mainHub.Parent = sg
    
    Instance.new("UICorner", mainHub).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", mainHub)
    stroke.Color = COLORS.BlueNeon
    stroke.Thickness = 2

    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1, 0, 0, 40)
    topBar.BackgroundColor3 = COLORS.Glass
    topBar.Parent = mainHub
    Instance.new("UICorner", topBar)

    local hTitle = Instance.new("TextLabel")
    hTitle.Size = UDim2.new(1, 0, 1, 0)
    hTitle.BackgroundTransparency = 1
    hTitle.Text = "PRIMION UNIVERSAL V4"
    hTitle.TextColor3 = COLORS.BlueNeon
    hTitle.Font = Enum.Font.GothamBold
    hTitle.TextSize = 16
    hTitle.Parent = topBar

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, -20, 1, -55)
    scroll.Position = UDim2.new(0, 10, 0, 45)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.CanvasSize = UDim2.new(0, 0, 0, 550)
    scroll.ScrollBarThickness = 3
    scroll.ScrollBarImageColor3 = COLORS.BlueNeon
    scroll.Parent = mainHub

    local layout = Instance.new("UIListLayout", scroll)
    layout.Padding = UDim.new(0, 8)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 50, 0, 50)
    toggleBtn.Position = UDim2.new(0, 20, 0, 20)
    toggleBtn.BackgroundColor3 = COLORS.MainBG
    toggleBtn.Text = "P"
    toggleBtn.TextColor3 = COLORS.BlueNeon
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 25
    toggleBtn.Parent = sg
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", toggleBtn).Color = COLORS.BlueNeon

    toggleBtn.MouseButton1Click:Connect(function()
        mainHub.Visible = not mainHub.Visible
    end)

    local function AddToggle(name, defaultColor, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.95, 0, 0, 45)
        btn.BackgroundColor3 = COLORS.Glass
        btn.Text = name .. " [OFF]"
        btn.TextColor3 = defaultColor
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.Parent = scroll
        Instance.new("UICorner", btn)
        local s = Instance.new("UIStroke", btn)
        s.Color = COLORS.Border
        
        local state = false
        btn.MouseButton1Click:Connect(function()
            state = not state
            btn.Text = name .. (state and " [ON]" or " [OFF]")
            btn.TextColor3 = state and COLORS.GreenNeon or defaultColor
            s.Color = state and COLORS.GreenNeon or COLORS.Border
            callback(state)
        end)
    end

    -----------------------------------------------------------
    -- FUNÇÕES DO HUB
    -----------------------------------------------------------

    -- SUPER BOOST FPS (AGRESSIVO)
    AddToggle("Super Boost FPS", COLORS.BlueNeon, function(on)
        if on then
            -- Remove efeitos de iluminação
            local l = game:GetService("Lighting")
            l.GlobalShadows = false
            for _, v in pairs(l:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") then
                    v.Enabled = false
                end
            end

            -- Função de limpeza de texturas e partículas
            local function Optimize(v)
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                elseif v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Fire") or v:IsA("Sparkles") then
                    v.Enabled = false
                elseif v:IsA("SpecialMesh") then
                    v.TextureId = ""
                end
            end

            for _, v in pairs(game:GetDescendants()) do Optimize(v) end
            settings().Rendering.QualityLevel = 1
        end
    end)

    -- FLY SYSTEM
    local flying = false
    local flySpeed = 50
    AddToggle("Fly", COLORS.GoldNeon, function(on)
        flying = on
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        if flying then
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Name = "FlyBV"
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            task.spawn(function()
                while flying do
                    local cam = workspace.CurrentCamera.CFrame
                    local moveDir = Vector3.new(0,0,0)
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.RightVector end
                    bv.Velocity = moveDir * flySpeed
                    RunService.RenderStepped:Wait()
                end
                bv:Destroy()
            end)
        end
    end)

    AddToggle("Speed Hack", COLORS.BlueNeon, function(on)
        player.Character.Humanoid.WalkSpeed = on and 100 or 16
    end)

    AddToggle("Super Jump", COLORS.GreenNeon, function(on)
        player.Character.Humanoid.JumpPower = on and 150 or 50
        player.Character.Humanoid.UseJumpPower = true
    end)

    AddToggle("ESP Players", COLORS.PurpleNeon, function(on)
        if on then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character then
                    local h = Instance.new("Highlight", p.Character)
                    h.Name = "PrimionESP"
                    h.FillColor = COLORS.PurpleNeon
                end
            end
        else
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("PrimionESP") then
                    p.Character.PrimionESP:Destroy()
                end
            end
        end
    end)

    AddToggle("Full Bright", COLORS.GoldNeon, function(on)
        game:GetService("Lighting").Brightness = on and 2 or 1
        game:GetService("Lighting").ClockTime = on and 14 or 12
    end)
end

-----------------------------------------------------------
-- 2. PARTE: TELA DE LOGIN (MANTIDA IGUAL)
-----------------------------------------------------------
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(0, 650, 0, 380)
loginFrame.Position = UDim2.new(0.5, -325, 0.5, -190)
loginFrame.BackgroundColor3 = COLORS.MainBG
loginFrame.Parent = sg
Instance.new("UICorner", loginFrame)
Instance.new("UIStroke", loginFrame).Color = COLORS.Border

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

btnGet.MouseButton1Click:Connect(function() setclipboard(LINK_GET_KEY); status.Text = "✅ Link copiado!" end)
btnSupport.MouseButton1Click:Connect(function() setclipboard(LINK_DISCORD); status.Text = "💬 Discord copiado!" end)

check.MouseButton1Click:Connect(function()
    if input.Text:gsub("%s+", "") == KEY_CORRETA then
        status.Text = "✅ Autorizado!"
        task.wait(0.5)
        loginFrame:Destroy()
        AbrirHubUniversal()
    else
        status.Text = "❌ Chave Errada!"
        input.Text = ""
    end
end)
