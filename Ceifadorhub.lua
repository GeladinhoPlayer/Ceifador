-- Ceifador | V3 Hub - By Você

-- Função para criar a tela de Key
local function createKeySystem()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local KeyBox = Instance.new("TextBox")
    local ConfirmButton = Instance.new("TextButton")

    -- Configurações básicas
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.Position = UDim2.new(0.35, 0, 0.3, 0)
    Frame.Size = UDim2.new(0, 300, 0, 200)
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.Draggable = true

    Title.Parent = Frame
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Ceifador | V3"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 24

    KeyBox.Parent = Frame
    KeyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    KeyBox.Position = UDim2.new(0.1, 0, 0.4, 0)
    KeyBox.Size = UDim2.new(0, 240, 0, 40)
    KeyBox.Font = Enum.Font.Gotham
    KeyBox.PlaceholderText = "Digite a Key..."
    KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.TextScaled = true
    KeyBox.Text = ""

    ConfirmButton.Parent = Frame
    ConfirmButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    ConfirmButton.Position = UDim2.new(0.1, 0, 0.7, 0)
    ConfirmButton.Size = UDim2.new(0, 240, 0, 40)
    ConfirmButton.Font = Enum.Font.GothamBold
    ConfirmButton.Text = "Verificar"
    ConfirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ConfirmButton.TextScaled = true

    -- Quando clicar no botão:
    ConfirmButton.MouseButton1Click:Connect(function()
        if KeyBox.Text == "9M" then
            ScreenGui:Destroy()
            loadHub()
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Erro",
                Text = "Key incorreta!",
                Duration = 3
            })
        end
    end)
end

-- Função para criar o Hub depois da Key
function loadHub()
    local HubGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local ArsenalButton = Instance.new("TextButton")
    local BadBusinessButton = Instance.new("TextButton")
    local PhantomButton = Instance.new("TextButton")
    local EnergyButton = Instance.new("TextButton")

    HubGui.Parent = game.CoreGui
    HubGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = HubGui
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.Position = UDim2.new(0.35, 0, 0.25, 0)
    Frame.Size = UDim2.new(0, 320, 0, 400)
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.Draggable = true

    Title.Parent = Frame
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Ceifador | V3 - Jogos"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 22

    ArsenalButton.Parent = Frame
    ArsenalButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    ArsenalButton.Position = UDim2.new(0.1, 0, 0.2, 0)
    ArsenalButton.Size = UDim2.new(0, 250, 0, 50)
    ArsenalButton.Font = Enum.Font.GothamBold
    ArsenalButton.Text = "Arsenal"
    ArsenalButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ArsenalButton.TextScaled = true
    ArsenalButton.MouseButton1Click:Connect(function()
        -- Script do Arsenal
        loadstring(game:HttpGet("SEU_SCRIPT_AQUI"))()
    end)

    BadBusinessButton.Parent = Frame
    BadBusinessButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    BadBusinessButton.Position = UDim2.new(0.1, 0, 0.4, 0)
    BadBusinessButton.Size = UDim2.new(0, 250, 0, 50)
    BadBusinessButton.Font = Enum.Font.GothamBold
    BadBusinessButton.Text = "Bad Business"
    BadBusinessButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    BadBusinessButton.TextScaled = true
    BadBusinessButton.MouseButton1Click:Connect(function()
        -- Script do Bad Business
        loadstring(game:HttpGet("SEU_SCRIPT_AQUI"))()
    end)

    PhantomButton.Parent = Frame
    PhantomButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    PhantomButton.Position = UDim2.new(0.1, 0, 0.6, 0)
    PhantomButton.Size = UDim2.new(0, 250, 0, 50)
    PhantomButton.Font = Enum.Font.GothamBold
    PhantomButton.Text = "Phantom Forces"
    PhantomButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    PhantomButton.TextScaled = true
    PhantomButton.MouseButton1Click:Connect(function()
        -- Script do Phantom Forces
        loadstring(game:HttpGet("SEU_SCRIPT_AQUI"))()
    end)

    EnergyButton.Parent = Frame
    EnergyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    EnergyButton.Position = UDim2.new(0.1, 0, 0.8, 0)
    EnergyButton.Size = UDim2.new(0, 250, 0, 50)
    EnergyButton.Font = Enum.Font.GothamBold
    EnergyButton.Text = "Energy Assault"
    EnergyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    EnergyButton.TextScaled = true
    EnergyButton.MouseButton1Click:Connect(function()
        -- Script do Energy Assault
        loadstring(game:HttpGet("SEU_SCRIPT_AQUI"))()
    end)
end

-- Iniciar o sistema de Key
createKeySystem()
