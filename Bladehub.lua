-- Serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Ball = workspace:WaitForChild("BladeBall")  -- A bola do Blade Ball (crie um objeto 'BladeBall' no Workspace)
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local swordEquipped = false

-- Variáveis de movimento da bola
local ballVelocity = Vector3.new(0, 0, 0)
local ballSpeed = 50

-- Função para equipar/descarregar a espada
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

-- Função para chutar a bola
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
end)

-- Criar Janela de UI com Orion
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

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

-- Adicionando a Bola e a Arena no Workspace
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
