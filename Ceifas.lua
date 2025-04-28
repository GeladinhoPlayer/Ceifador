-- Carregar Orion UI
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

-- ServiÃ§os
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- VariÃ¡veis
local AIMBOT_ENABLED = false
local ESP_ENABLED = false
local SILENT_AIM = false
local NOCLIP = false
local ESP_OBJECTS = {}
local ESP_COLOR = Color3.fromRGB(255, 0, 0)
local FOV_RADIUS = 100
local FOV_CIRCLE = nil

-- FunÃ§Ãµes
local function getClosestPlayer()
    local closest, shortestDistance = nil, math.huge
    local mouse = LocalPlayer:GetMouse()

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local pos = Camera:WorldToViewportPoint(player.Character.Head.Position)
            local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
            if distance < shortestDistance then
                closest = player
                shortestDistance = distance
            end
        end
    end
    return closest
end

local function createESP(player)
    local box = Drawing.new("Square")
    box.Color = ESP_COLOR
    box.Thickness = 2
    box.Transparency = 1
    box.Filled = false
    ESP_OBJECTS[player] = box
end

local function removeESP(player)
    if ESP_OBJECTS[player] then
        ESP_OBJECTS[player]:Remove()
        ESP_OBJECTS[player] = nil
    end
end

-- Main Loop
RunService.RenderStepped:Connect(function()
    -- Aimbot
    if AIMBOT_ENABLED and SILENT_AIM then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            if target.Team ~= LocalPlayer.Team then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
            end
        end
    end

    -- ESP
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            if not ESP_OBJECTS[player] then
                createESP(player)
            end

            local head = player.Character.Head
            local pos, visible = Camera:WorldToViewportPoint(head.Position)
            local size = (Camera:WorldToViewportPoint(head.Position + Vector3.new(2, 3, 0)) - Camera:WorldToViewportPoint(head.Position - Vector3.new(2, 3, 0))).Magnitude
            local box = ESP_OBJECTS[player]
            box.Size = Vector2.new(size, size * 1.5)
            box.Position = Vector2.new(pos.X - box.Size.X/2, pos.Y - box.Size.Y/2)
            box.Color = ESP_COLOR
            box.Visible = ESP_ENABLED and visible
        else
            removeESP(player)
        end
    end

    -- FOV Circle
    if FOV_CIRCLE then
        local mouse = LocalPlayer:GetMouse()
        FOV_CIRCLE.Position = Vector2.new(mouse.X, mouse.Y)
    end
end)

-- Noclip
RunService.Stepped:Connect(function()
    if NOCLIP and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                part.CanCollide = false
            end
        end
    end
end)

-- Criar Janela Principal
local Window = OrionLib:MakeWindow({
    Name = "HyperHub | V3",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "HyperHubV3",
    IntroEnabled = true,
    IntroText = "Bem-vindo ao HyperHub | V3!",
    Icon = "rbxassetid://4483345998"
})

-- Home
local HomeTab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

HomeTab:AddParagraph("HyperHub | V3", "Bem-vindo ao melhor Hub de Roblox!")

-- Scripts - Combat
local CombatTab = Window:MakeTab({
    Name = "Combat Scripts",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

CombatTab:AddButton({
    Name = "Ativar Aimbot",
    Callback = function()
        AIMBOT_ENABLED = not AIMBOT_ENABLED
        OrionLib:MakeNotification({
            Name = "Aimbot",
            Content = AIMBOT_ENABLED and "Aimbot Ativado!" or "Aimbot Desativado!",
            Time = 3
        })
    end
})

CombatTab:AddButton({
    Name = "Ativar Silent Aim",
    Callback = function()
        SILENT_AIM = not SILENT_AIM
        OrionLib:MakeNotification({
            Name = "Silent Aim",
            Content = SILENT_AIM and "Silent Aim Ativado!" or "Silent Aim Desativado!",
            Time = 3
        })
    end
})

-- Scripts - Visual
local VisualTab = Window:MakeTab({
    Name = "Visual Scripts",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

VisualTab:AddButton({
    Name = "Ativar ESP",
    Callback = function()
        ESP_ENABLED = not ESP_ENABLED
        OrionLib:MakeNotification({
            Name = "ESP",
            Content = ESP_ENABLED and "ESP Ativado!" or "ESP Desativado!",
            Time = 3
        })
    end
})

VisualTab:AddColorpicker({
    Name = "Cor do ESP",
    Default = ESP_COLOR,
    Callback = function(color)
        ESP_COLOR = color
    end
})

VisualTab:AddButton({
    Name = "Ativar Wallhack (Noclip)",
    Callback = function()
        NOCLIP = not NOCLIP
        OrionLib:MakeNotification({
            Name = "Wallhack",
            Content = NOCLIP and "Wallhack Ativado!" or "Wallhack Desativado!",
            Time = 3
        })
    end
})

-- Player Settings
local PlayerTab = Window:MakeTab({
    Name = "Player Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

PlayerTab:AddSlider({
    Name = "Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Increment = 1,
    ValueName = "Velocidade",
    Callback = function(value)
        if LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

PlayerTab:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 300,
    Default = 50,
    Increment = 1,
    ValueName = "Pulo",
    Callback = function(value)
        if LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
})

PlayerTab:AddSlider({
    Name = "Gravidade",
    Min = 10,
    Max = 300,
    Default = 196.2,
    Increment = 0.1,
    ValueName = "Gravidade",
    Callback = function(value)
        workspace.Gravity = value
    end
})
