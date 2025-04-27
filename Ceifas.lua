-- Carregar a biblioteca Orion UI
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

-- Variáveis iniciais
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = LocalPlayer:GetMouse()

-- Variáveis de controle
local AIMBOT_ENABLED = false
local ESP_ENABLED = false
local SNOW_FOV = false
local noclip = false
local shooting = false
local ESP_OBJECTS = {}
local ESP_COLOR = Color3.fromRGB(255, 0, 0)
local FOV_RADIUS = 100
local AUTO_SHOOT = false
local FOV_CIRCLE = false
local isMobile = game:GetService("UserInputService").TouchEnabled

-- Verificar se estamos no PC
local isPC = not isMobile

-- Função para detectar cliques no PC
local function isMouseButtonPressed()
    if isPC then
        return game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
    else
        return false
    end
end

-- Função para encontrar o jogador mais próximo
local function getClosestValidPlayer()
    local closest, shortestDistance = nil, math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local headPos, onScreen = camera:WorldToViewportPoint(player.Character.Head.Position)
            local distance = (Vector2.new(headPos.X, headPos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
            
            -- Verificar se está acima do mapa e vivo
            if onScreen and headPos.Z > 0 and player.Character:FindFirstChildWhichIsA("Humanoid") and player.Character:FindFirstChildWhichIsA("Humanoid").Health > 0 then
                if distance < shortestDistance then
                    closest = player
                    shortestDistance = distance
                end
            end
        end
    end
    return closest
end

-- Função para criar ESP no jogador
local function createESP(player)
    local box = Drawing.new("Square")
    box.Color = ESP_COLOR
    box.Thickness = 2
    box.Transparency = 1
    box.Filled = false
    ESP_OBJECTS[player] = box
end

-- Função para remover o ESP do jogador
local function removeESP(player)
    if ESP_OBJECTS[player] then
        ESP_OBJECTS[player]:Remove()
        ESP_OBJECTS[player] = nil
    end
end

-- Atualização do loop de execução
RunService.RenderStepped:Connect(function()
    -- Aimbot
    if AIMBOT_ENABLED then
        local target = getClosestValidPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            camera.CFrame = CFrame.new(camera.CFrame.Position, target.Character.Head.Position)

            -- Atirar automaticamente se Auto Shoot estiver ativado
            if AUTO_SHOOT and isMouseButtonPressed() then
                mouse1press()
                task.wait(0.1)
                mouse1release()
            end
        end
    end

    -- ESP
    if ESP_ENABLED then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                if not ESP_OBJECTS[player] then
                    createESP(player)
                end
                local head = player.Character.Head
                local pos, visible = camera:WorldToViewportPoint(head.Position)
                local size = (camera:WorldToViewportPoint(head.Position + Vector3.new(2, 3, 0)) - camera:WorldToViewportPoint(head.Position - Vector3.new(2, 3, 0))).Magnitude
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

    -- FOV Circle
    if SNOW_FOV then
        if not FOV_CIRCLE then
            FOV_CIRCLE = Drawing.new("Circle")
            FOV_CIRCLE.Color = Color3.fromRGB(200, 200, 255)
            FOV_CIRCLE.Thickness = 1.5
            FOV_CIRCLE.Radius = FOV_RADIUS
            FOV_CIRCLE.Transparency = 0.6
            FOV_CIRCLE.Filled = false
        end
        local mousePos = LocalPlayer:GetMouse()
        FOV_CIRCLE.Position = Vector2.new(mousePos.X, mousePos.Y)
        FOV_CIRCLE.Visible = true
    elseif FOV_CIRCLE then
        FOV_CIRCLE.Visible = false
    end

    -- NoClip
    if noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                part.CanCollide = false
            end
        end
    end
end)

-- Criar a janela principal do menu
local Window = OrionLib:MakeWindow({
    Name = "HyperHub | V3 (PC)",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "HyperHub | V3",
    IntroEnabled = true,
    IntroText = "Bem-vindo ao HyperHub | V3!",
    Icon = "rbxassetid://4483345998"
})

-- Criar a aba principal do menu
local Tab = Window:MakeTab({
    Name = "Menu",
    Icon
