-- Carregar a biblioteca OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/OhYea9/Orion/main/OrionLib.lua"))()
if not OrionLib then
    warn("OrionLib não pôde ser carregado corretamente!")
    return
end

-- Criação da janela do menu
local Window = OrionLib:MakeWindow({
    Name = "GeladoHub | V3",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "GeladoHub"
})

-- Variáveis
local noclip = false
local aimbotEnabled = false
local espEnabled = false

-- Função para NoClip
local function toggleNoClip()
    noclip = not noclip
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = noclip
        end
        -- Modificar CanCollide para atravessar paredes
        if noclip then
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("Part") then
                    part.CanCollide = false
                end
            end
        else
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("Part") then
                    part.CanCollide = true
                end
            end
        end
    end
end

-- Função de Aimbot
local function aimbot()
    local character = game.Players.LocalPlayer.Character
    if not character then return end
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    if aimbotEnabled then
        for _, target in pairs(game.Players:GetPlayers()) do
            if target ~= game.Players.LocalPlayer then
                local targetHRP = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
                if targetHRP then
                    humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, targetHRP.Position)
                end
            end
        end
    end
end

-- Função para ESP
local function esp()
    if espEnabled then
        for _, target in pairs(game.Players:GetPlayers()) do
            if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local targetHRP = target.Character.HumanoidRootPart
                local box = Instance.new("BoxHandleAdornment")
                box.Parent = targetHRP
                box.Adornee = targetHRP
                box.Size = Vector3.new(4, 6, 4)
                box.Color3 = Color3.fromRGB(255, 0, 0) -- Cor vermelha para inimigos
                box.Transparency = 0.5
                box.AlwaysOnTop = true
                box.ZIndex = 5
            end
        end
    end
end

-- Criar a aba de "Home"
local homeTab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://5012544611",
    PremiumOnly = false
})

homeTab:AddParagraph("GeladoHub V3", "Criado por Geladinho")
homeTab:AddParagraph("ID do Criador", "Geladinho#1234")

-- Criar a aba de "Scripts"
local scriptTab = Window:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://5012544611",
    PremiumOnly = false
})

-- Botão para ativar NoClip
scriptTab:AddButton({
    Name = "Ativar Wallhack (NoClip)",
    Callback = function()
        print("Toggling NoClip")
        toggleNoClip()
        OrionLib:MakeNotification({
            Name = "Wallhack",
            Content = noclip and "Wallhack Ativado" or "Wallhack Desativado",
            Time = 3
        })
    end
})

-- Botão para ativar Aimbot
scriptTab:AddButton({
    Name = "Ativar Aimbot",
    Callback = function()
        aimbotEnabled = not aimbotEnabled
        print("Aimbot Toggled: " .. tostring(aimbotEnabled))
        OrionLib:MakeNotification({
            Name = "Aimbot",
            Content = aimbotEnabled and "Aimbot Ativado" or "Aimbot Desativado",
            Time = 3
        })
    end
})

-- Botão para ativar ESP
scriptTab:AddButton({
    Name = "Ativar ESP",
    Callback = function()
        espEnabled = not espEnabled
        print("ESP Toggled: " .. tostring(espEnabled))
        OrionLib:MakeNotification({
            Name = "ESP",
            Content = espEnabled and "ESP Ativado" or "ESP Desativado",
            Time = 3
        })
        esp()
    end
})

-- Criar a aba de "Configurações"
local configTab = Window:MakeTab({
    Name = "Configurações",
    Icon = "rbxassetid://5012544611",
    PremiumOnly = false
})

configTab:AddParagraph("Nome do Hub", "GeladoHub | V3")
configTab:AddParagraph("Criador", "Geladinho#1234")

-- Inicializar o menu
OrionLib:Init()

-- Atualizar as funcionalidades continuamente
game:GetService("RunService").RenderStepped:Connect(function()
    aimbot()
    esp()
end)
