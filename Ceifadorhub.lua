-- Variáveis principais
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.Name = "CeifadorHub"

-- Função para criar uma janela
local function createWindow(name, size, position)
    local frame = Instance.new("Frame")
    frame.Parent = screenGui
    frame.Size = UDim2.new(0, size.X, 0, size.Y)
    frame.Position = UDim2.new(0, position.X, 0, position.Y)
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.BorderSizePixel = 0
    frame.Name = name

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Text = name
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 20
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center

    return frame
end

-- Função para criar um botão
local function createButton(parent, name, size, position, callback)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Size = UDim2.new(0, size.X, 0, size.Y)
    button.Position = UDim2.new(0, position.X, 0, position.Y)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18

    button.MouseButton1Click:Connect(callback)

    return button
end

-- Criando o Hub
local window = createWindow("Ceifador | V3 Hub", Vector2.new(400, 400), Vector2.new(200, 100))

-- Seções do Hub
local sections = {
    {name = "Funções do Jogador", buttons = {
        {"Alta Velocidade", Vector2.new(360, 40), Vector2.new(20, 40), function() player.Character.Humanoid.WalkSpeed = 500 end},
        {"Pulo Alto", Vector2.new(360, 40), Vector2.new(20, 90), function() player.Character.Humanoid.JumpPower = 100 end},
        {"Gravidade Baixa", Vector2.new(360, 40), Vector2.new(20, 140), function() game.Workspace.Gravity = 10 end},
        {"Gravidade Normal", Vector2.new(360, 40), Vector2.new(20, 190), function() game.Workspace.Gravity = 196.2 end}
    }},
    {name = "Farming", buttons = {
        {"Auto Farm", Vector2.new(360, 40), Vector2.new(20, 40), function() print("Auto Farm Ativado") end},
        {"Farmar Frutas", Vector2.new(360, 40), Vector2.new(20, 90), function() print("Farmando Frutas") end}
    }},
    {name = "Teleporte", buttons = {
        {"Teleportar para Ilha 1", Vector2.new(360, 40), Vector2.new(20, 40), function() print("Teleportando para Ilha 1") end},
        {"Teleportar para Ilha 2", Vector2.new(360, 40), Vector2.new(20, 90), function() print("Teleportando para Ilha 2") end}
    }},
    {name = "Raids", buttons = {
        {"Iniciar Raid", Vector2.new(360, 40), Vector2.new(20, 40), function() print("Raid Iniciada") end},
        {"Parar Raid", Vector2.new(360, 40), Vector2.new(20, 90), function() print("Raid Parada") end}
    }},
    {name = "Créditos", buttons = {
        {"Mostrar Créditos", Vector2.new(360, 40), Vector2.new(20, 40), function() print("Créditos: Desenvolvedor - Seu Nome") end}
    }}
}

-- Criando as seções e botões
for _, section in ipairs(sections) do
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Parent = window
    sectionFrame.Size = UDim2.new(1, 0, 0, 100)
    sectionFrame.Position = UDim2.new(0, 0, 0, 30)
    sectionFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    sectionFrame.BorderSizePixel = 0

    for _, buttonData in ipairs(section.buttons) do
        createButton(sectionFrame, buttonData[1], buttonData[2], buttonData[3], buttonData[4])
    end
end

-- Notificação de boas-vindas
local notification = Instance.new("Frame")
notification.Parent = screenGui
notification.Size = UDim2.new(0, 300, 0, 100)
notification.Position = UDim2.new(0, 100, 0, 50)
notification.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
notification.BorderSizePixel = 0

local message = Instance.new("TextLabel")
message.Parent = notification
message.Size = UDim2.new(1, 0, 1, 0)
message.BackgroundTransparency = 1
message.Text = "Bem-vindo ao Ceifador | V3 Hub!"
message.TextColor3 = Color3.fromRGB(255, 255, 255)
message.TextSize = 18
message.TextXAlignment = Enum.TextXAlignment.Center
message.TextYAlignment = Enum.TextYAlignment.Center

-- Remover a notificação após 5 segundos
wait(5)
notification:Destroy()
