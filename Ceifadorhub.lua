-- Carregar a biblioteca Orion UI
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

-- Definindo a chave para acesso
local key = "9M"

-- Criar a janela principal do menu
local Window = OrionLib:MakeWindow({
    Name = "Ceifador Hub V3",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "CeifadorHubV3",
    IntroEnabled = true,
    IntroText = "Bem-vindo ao Ceifador Hub V3!",
    Icon = "rbxassetid://4483345998"
})

-- Função de Key
local KeyFrame = Instance.new("Frame")
KeyFrame.Parent = game.CoreGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
KeyFrame.Size = UDim2.new(0, 300, 0, 200)

local TextBox = Instance.new("TextBox")
TextBox.Parent = KeyFrame
TextBox.PlaceholderText = "Digite a key aqui"
TextBox.Text = ""
TextBox.Size = UDim2.new(0, 200, 0, 40)
TextBox.Position = UDim2.new(0.15, 0, 0.2, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextScaled = true

local SubmitButton = Instance.new("TextButton")
SubmitButton.Parent = KeyFrame
SubmitButton.Text = "Entrar"
SubmitButton.Size = UDim2.new(0, 150, 0, 40)
SubmitButton.Position = UDim2.new(0.25, 0, 0.6, 0)
SubmitButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.Font = Enum.Font.SourceSans
SubmitButton.TextScaled = true

-- Função para verificar key e exibir o menu
SubmitButton.MouseButton1Click:Connect(function()
    if TextBox.Text == key then
        KeyFrame.Visible = false
        -- Criar a aba principal do menu
        local Tab = Window:MakeTab({
            Name = "Recursos",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Section = Tab:AddSection({
            Name = "Ferramentas"
        })

        -- Adicionar botões com funcionalidades
        Section:AddButton({
            Name = "Ativar Aimbot",
            Callback = function()
                print("Aimbot ativado!")
                -- Aqui você pode adicionar o código para ativar o Aimbot
            end
        })

        Section:AddButton({
            Name = "Ativar ESP",
            Callback = function()
                print("ESP ativado!")
                -- Aqui você pode adicionar o código para ativar o ESP
            end
        })

        Section:AddButton({
            Name = "Ativar Silent Aim",
            Callback = function()
                print("Silent Aim ativado!")
                -- Aqui você pode adicionar o código para ativar o Silent Aim
            end
        })

        Section:AddButton({
            Name = "Ativar Wallhack",
            Callback = function()
                print("Wallhack ativado!")
                -- Aqui você pode adicionar o código para ativar o Wallhack
            end
        })

        -- Exibir a janela do menu hub
        Window:Show()
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "Key incorreta!"
    end
end)
