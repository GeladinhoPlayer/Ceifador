-- Carregar Orion UI
local success, OrionLib = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
end)
if not success then
    warn("Erro ao carregar OrionLib")
    return
end

-- Serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Variáveis
local AIMBOT_ENABLED = false
local ESP_ENABLED = false
local SILENT_AIM = false
local NOCLIP = false
local GODMODE = false
local ESP_OBJECTS = {}
local ESP_COLOR = Color3.fromRGB(255, 0, 0)
local FOV_RADIUS = 100
local FOV_CIRCLE = nil
local ballSpeed = 50
local Ball = workspace:FindFirstChild("BladeBall")

-- Funções
local function getClosestPlayer()
    local closest, shortestDistance = nil, math.huge
    local mouse = LocalPlayer:GetMouse()

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local pos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            if onScreen then
                local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
                if distance < shortestDistance then
                    closest = player
                    shortestDistance = distance
                end
            end
        end
    end
    return closest
end

local function createESP(player)
    if not Drawing then return end
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

local function kickBall()
    if Ball then
        local direction = Camera.CFrame.LookVector
        Ball.AssemblyLinearVelocity = direction * ballSpeed
    end
end

local function applyGodMode()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid.MaxHealth = math.huge
        LocalPlayer.Character.Humanoid.Health = math.huge
    end
end

-- Atualizar
RunService.RenderStepped:Connect(function()
    if AIMBOT_ENABLED and SILENT_AIM then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.HumanoidRootPart.Position)
        end
    end

    if ESP_ENABLED and Drawing then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if not ESP_OBJECTS[player] then
                    createESP(player)
                end

                local root = player.Character.HumanoidRootPart
                local pos, visible = Camera:WorldToViewportPoint(root.Position)
                local size = (Camera:WorldToViewportPoint(root.Position + Vector3.new(2, 3, 0)) - Camera:WorldToViewportPoint(root.Position - Vector3.new(2, 3, 0))).Magnitude
                local box = ESP_OBJECTS[player]
                box.Size = Vector2.new(size, size * 1.5)
                box.Position = Vector2.new(pos.X - box.Size.X/2, pos.Y - box.Size.Y/2)
                box.Color = ESP_COLOR
                box.Visible = visible
            else
                removeESP(player)
            end
        end
    end

    if GODMODE then
        applyGodMode()
    end
end)

RunService.Stepped:Connect(function()
    if NOCLIP and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Criar Janela Principal
local Window = OrionLib:MakeWindow({
    Name = "BladeBall Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "BladeBall",
    IntroEnabled = true,
    IntroText = "Bem-vindo ao BladeBall!",
    Icon = "rbxassetid://4483345998"
})

local HomeTab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
HomeTab:AddParagraph("BladeBall", "Jogue futebol com espadas!")

local CombatTab = Window:MakeTab({
    Name = "Combate",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
CombatTab:AddButton({
    Name = "Chutar Bola",
    Callback = function()
        kickBall()
        OrionLib:MakeNotification({
            Name = "Ação",
            Content = "Você chutou a bola!",
            Time = 3
        })
    end
})

local PlayerTab = Window:MakeTab({
    Name = "Jogador",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
PlayerTab:AddSlider({
    Name = "Velocidade da Bola",
    Min = 10,
    Max = 100,
    Default = 50,
    Increment = 1,
    Callback = function(value)
        ballSpeed = value
    end
})

PlayerTab:AddToggle({
    Name = "Aimbot",
    Default = false,
    Callback = function(value)
        AIMBOT_ENABLED = value
    end
})

PlayerTab:AddToggle({
    Name = "Silent Aim",
    Default = false,
    Callback = function(value)
        SILENT_AIM = value
    end
})

PlayerTab:AddToggle({
    Name = "ESP",
    Default = false,
    Callback = function(value)
        ESP_ENABLED = value
    end
})

PlayerTab:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(value)
        NOCLIP = value
    end
})

PlayerTab:AddToggle({
    Name = "GodMode",
    Default = false,
    Callback = function(value)
        GODMODE = value
    end
})
