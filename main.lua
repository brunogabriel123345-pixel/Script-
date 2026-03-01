-- [As partes de Login e Configurações permanecem as mesmas]
-- Vou focar na atualização da função dentro do AbrirHubUniversal

-- Substitua a parte do AddToggle("Boost FPS"...) por esta:

AddToggle("Super Boost FPS", COLORS.BlueNeon, function(on)
    if on then
        -- 1. Configurações de Iluminação (Remove sombras e efeitos pesados)
        local l = game:GetService("Lighting")
        l.GlobalShadows = false
        l.FogEnd = 9e9
        for _, v in pairs(l:GetChildren()) do
            if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then
                v.Enabled = false
            end
        end

        -- 2. Limpeza de Mapa e Texturas (Otimização Real)
        local function Clean(v)
            if v:IsA("BasePart") or v:IsA("CornerWedgePart") or v:IsA("WedgePart") or v:IsA("TrussPart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1 -- Esconde decalques e texturas
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = false
            elseif v:IsA("SpecialMesh") then
                v.TextureId = "" -- Remove textura de meshes
            end
        end

        -- Limpa o que já existe
        for _, v in pairs(game:GetDescendants()) do
            Clean(v)
        end

        -- Limpa o que for spawnado depois (Para evitar lag de magias/efeitos)
        game.DescendantAdded:Connect(function(v)
            if on then Clean(v) end
        end)

        -- 3. Baixa a qualidade visual do motor (Localmente)
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01
        
        print("Super Boost Ativado: Texturas e Efeitos removidos.")
    else
        print("O Boost FPS não pode ser revertido totalmente sem reiniciar o servidor devido à remoção de texturas.")
    end
end)
