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
        local TabHome = Window:MakeTab({
            Name = "Home",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        -- Adicionar categoria Home
        TabHome:AddButton({
            Name = "Bem-vindo ao Ceifador Hub!",
            Callback = function()
                print("Bem-vindo ao Ceifador Hub V3!")
            end
        })

        -- Criar aba de Scripts
        local TabScripts = Window:MakeTab({
            Name = "Scripts",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        -- Adicionar categoria de Scripts
        local Section = TabScripts:AddSection({
            Name = "Ferramentas"
        })

        Section:AddButton({
            Name = "Ativar Aimbot",
            Callback = function()
                print("Aimbot ativado!")
                -- Ação de ativar o Aimbot (substitua com seu código específico de Aimbot)
            end
        })

        Section:AddButton({
            Name = "Ativar ESP",
            Callback = function()
                print("ESP ativado!")
                -- Ação de ativar o ESP (substitua com seu código específico de ESP)
            end
        })

        Section:AddButton({
            Name = "Ativar Silent Aim",
            Callback = function()
                print("Silent Aim ativado!")
                -- Ação de ativar o Silent Aim (substitua com seu código específico de Silent Aim)
            end
        })

        Section:AddButton({
            Name = "Ativar Wallhack",
            Callback = function()
                print("Wallhack ativado!")
                -- Ação de ativar o Wallhack (substitua com seu código específico de Wallhack)
            end
        })

        -- Mostrar a janela
        Window:Show()
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "Key incorreta!"
    end
end)
