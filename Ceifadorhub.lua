-- Definir as variáveis
local hubKey = "1234"  -- Chave de acesso do hub
local userInput = ""  -- Variável para armazenar o input do usuário

-- Criação da interface
local ScreenGui = Instance.new("ScreenGui")
local HubFrame = Instance.new("Frame")
local KeyInput = Instance.new("TextBox")
local SubmitButton = Instance.new("TextButton")
local ActionFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")

-- Configuração do GUI
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.Name = "CustomHub"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Tela do Hub
HubFrame.Name = "HubFrame"
HubFrame.Parent = ScreenGui
HubFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
HubFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
HubFrame.Size = UDim2.new(0, 300, 0, 250)

UICorner.Parent = HubFrame

-- Caixa de texto para a chave
KeyInput.Parent = HubFrame
KeyInput.PlaceholderText = "Digite a chave aqui"
KeyInput.Size = UDim2.new(0, 200, 0, 40)
KeyInput.Position = UDim2.new(0.15, 0, 0.2, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.TextScaled = true

-- Botão de submissão da chave
SubmitButton.Parent = HubFrame
SubmitButton.Text = "Entrar"
SubmitButton.Size = UDim2.new(0, 150, 0, 40)
SubmitButton.Position = UDim2.new(0.25, 0, 0.6, 0)
SubmitButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.Font = Enum.Font.SourceSans
SubmitButton.TextScaled = true

-- Tela de ações após a validação
ActionFrame.Name = "ActionFrame"
ActionFrame.Parent = ScreenGui
ActionFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ActionFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
ActionFrame.Size = UDim2.new(0, 300, 0, 200)
ActionFrame.Visible = false  -- Inicialmente invisível

-- Função do botão de chave
SubmitButton.MouseButton1Click:Connect(function()
    if KeyInput.Text == hubKey then
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "Key correta!"
        ActionFrame.Visible = true
        HubFrame.Visible = false
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "Key incorreta!"
    end
end)

-- Ações do Hub (após a chave correta)
local ChangeSkyButton = Instance.new("TextButton")
ChangeSkyButton.Parent = ActionFrame
ChangeSkyButton.Text = "Mudar céu"
ChangeSkyButton.Size = UDim2.new(0, 200, 0, 40)
ChangeSkyButton.Position = UDim2.new(0.5, -100, 0.2, 0)
ChangeSkyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
ChangeSkyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChangeSkyButton.Font = Enum.Font.SourceSans
ChangeSkyButton.TextScaled = true

ChangeSkyButton.MouseButton1Click:Connect(function()
    -- Muda o céu para uma cor aleatória
    local sky = game.Lighting:FindFirstChild("Sky") or Instance.new("Sky", game.Lighting)
    sky.SkyboxBk = "rbxassetid://123456"  -- Use seu próprio asset aqui
    sky.SkyboxDn = "rbxassetid://123456"
    sky.SkyboxFt = "rbxassetid://123456"
    sky.SkyboxLf = "rbxassetid://123456"
    sky.SkyboxRt = "rbxassetid://123456"
    sky.SkyboxUp = "rbxassetid://123456"
end)

-- Outro exemplo de ação - mudar a cor de uma parte
local ChangePartColorButton = Instance.new("TextButton")
ChangePartColorButton.Parent = ActionFrame
ChangePartColorButton.Text = "Mudar Cor da Parte"
ChangePartColorButton.Size = UDim2.new(0, 200, 0, 40)
ChangePartColorButton.Position = UDim2.new(0.5, -100, 0.5, 0)
ChangePartColorButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
ChangePartColorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChangePartColorButton.Font = Enum.Font.SourceSans
ChangePartColorButton.TextScaled = true

ChangePartColorButton.MouseButton1Click:Connect(function()
    -- Muda a cor da parte selecionada
    local part = game.Workspace:FindFirstChild("Part") or Instance.new("Part", game.Workspace)
    part.Color = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
end)
