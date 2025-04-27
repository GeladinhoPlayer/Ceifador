-- Função para detectar cliques do mouse
local function isMouseButtonPressed()
    return game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
end

-- Função de AutoShoot
local function autoShoot()
    while true do
        if isMouseButtonPressed() then
            -- Aqui simula o tiro, você pode colocar a lógica real de tiro
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.Health = humanoid.Health - 1
            end
            wait(0.1)  -- Ajuste a frequência do tiro
        end
    end
end

-- Função para criar a interface de menu simples
local function createMenu()
    -- Criar um painel com botões simples
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer.PlayerGui
    screenGui.Name = "MenuHub"

    -- Painel principal
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainFrame.Parent = screenGui

    -- Título
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 40)
    titleLabel.Text = "Exploit Hub"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.Parent = mainFrame

    -- Botão de AutoShoot
    local autoShootButton = Instance.new("TextButton")
    autoShootButton.Size = UDim2.new(0, 280, 0, 50)
    autoShootButton.Position = UDim2.new(0.5, -140, 0, 50)
    autoShootButton.Text = "Ativar AutoShoot"
    autoShootButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    autoShootButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    autoShootButton.Parent = mainFrame

    autoShootButton.MouseButton1Click:Connect(function()
        -- Lógica para alternar entre ativar e desativar
        local isAutoShootEnabled = false
        isAutoShootEnabled = not isAutoShootEnabled
        if isAutoShootEnabled then
            autoShootButton.Text = "Desativar AutoShoot"
            autoShoot()
        else
            autoShootButton.Text = "Ativar AutoShoot"
            print("AutoShoot Desativado")
        end
    end)

    -- Botão para ativar a função de Aimbot (apenas exemplo, lógica de aimbot precisa ser adicionada)
    local aimbotButton = Instance.new("TextButton")
    aimbotButton.Size = UDim2.new(0, 280, 0, 50)
    aimbotButton.Position = UDim2.new(0.5, -140, 0, 120)
    aimbotButton.Text = "Ativar Aimbot"
    aimbotButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    aimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    aimbotButton.Parent = mainFrame

    aimbotButton.MouseButton1Click:Connect(function()
        -- Lógica para alternar entre ativar e desativar o aimbot
        local isAimbotEnabled = false
        isAimbotEnabled = not isAimbotEnabled
        if isAimbotEnabled then
            aimbotButton.Text = "Desativar Aimbot"
            print("Aimbot Ativado")
            -- Aqui seria a lógica para o Aimbot, exemplo de código a ser ajustado
        else
            aimbotButton.Text = "Ativar Aimbot"
            print("Aimbot Desativado")
        end
    end)
end

-- Chama a função para criar o menu
createMenu()
