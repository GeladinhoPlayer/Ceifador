-- Carregar Orion UI
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

-- Serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Ball = workspace:WaitForChild("BladeBall") -- A bola do BladeBall
local swordEquipped = false
local immortal = false

-- Variáveis
local AIMBOT_ENABLED = false
local ESP_ENABLED = false
local SILENT_AIM = false
local NOCLIP = false
local FOV_RADIUS = 100
local FOV_CIRCLE = nil
local ESP_COLOR = Color3.fromRGB(255, 0, 0)
local ballVelocity = Vector3.new(0, 0, 0)
local ballSpeed = 50

-- Funções
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

local function toggleSword()
    if swordEquipped then
        -- Desaparecer espada
        LocalPlayer.Character:FindFirstChild("Sword"):Destroy()
        swordEquipped = false
    else
        -- Criar espada
        local sword = Instance.new("Tool")
        sword.Name = "Sword"
        sword.Parent = LocalPlayer.Backpack
        swordEquipped = true
    end
end

local function kickBall()
    if swordEquipped and Ball then
        -- Acionar o movimento da bola com a espada
        local sword = LocalPlayer.Backpack:FindFirstChild("Sword")
        if sword then
            local direction = (Camera.CFrame.LookVector)  -- Direção para onde o jogador está olhando
            ballVelocity = direction * ballSpeed  -- Velocidade da bola ao ser golpeada
            Ball.Velocity = ballVelocity
        end
    end
end

-- A função de atualizar a posição da bola
local function updateBall()
    if Ball then
        Ball.CFrame = Ball.CFrame + ballVelocity * RunService.Heartbeat:Wait()
    end
end

-- Loop de atualização para a bola
RunService.RenderStepped:Connect(function()
    updateBall()

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

-- Imortalidade
RunService.Heartbeat:Connect(function()
    if immortal then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.Health -- Imortalidade
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

-- Home
local HomeTab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

HomeTab:AddParagraph("BladeBall", "Jogue futebol com espadas!")

-- Scripts - Combat
local CombatTab = Window:MakeTab({
    Name = "Combate",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

CombatTab:AddButton({
    Name = "Equipar Espada",
    Callback = function()
        toggleSword()
        OrionLib:MakeNotification({
            Name = "Espada",
            Content = swordEquipped and "Espada Equipada!" or "Espada Descartada!",
            Time = 3
        })
    end
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

-- Configurações de Player
local PlayerTab = Window:MakeTab({
    Name = "Configurações do Jogador",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

PlayerTab:AddSlider({
    Name = "Velocidade da Bola",
    Min = 10,
    Max = 100,
    Default = 50,
    Increment = 1,
    ValueName = "Velocidade",
    Callback = function(value)
        ballSpeed = value
    end
})

PlayerTab:AddSlider({
    Name = "Força do Pulo",
    Min = 50,
    Max = 300,
    Default = 50,
    Increment = 1,
    ValueName = "Força do Pulo",
    Callback = function(value)
        if LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
})

PlayerTab:AddToggle({
    Name = "Imortalidade",
    Default = false,
    Callback = function(value)
        immortal = value
    end
})

PlayerTab:AddSlider({
    Name = "Raio do FOV",
    Min = 50,
    Max = 200,
    Default = 100,
    Increment = 1,
    ValueName = "Raio",
    Callback = function(value)
        FOV_RADIUS = value
        if FOV_CIRCLE then
            FOV_CIRCLE.Radius = FOV_RADIUS
        end
    end
})

-- Adicionar a Bola e a Arena no Workspace
local function createArena()
    -- Bola
    local ball = Instance.new("Part")
    ball.Size = Vector3.new(5, 5, 5)  -- Tamanho da bola
    ball.Shape = Enum.PartType.Ball
    ball.Position = Vector3.new(0, 5, 0)  -- Posição inicial da bola
    ball.Anchored = false
    ball.CanCollide = true
    ball.BrickColor = BrickColor.new("Bright red")
    ball.Name = "BladeBall"
    ball.Parent = workspace

    -- Adicionar efeito de física à bola
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = ball
end

-- Inicializar Arena
createArena()
