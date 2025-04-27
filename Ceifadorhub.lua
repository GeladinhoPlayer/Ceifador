-- Script Executor Básico para Roblox (só para fins legítimos no seu jogo)
local executorFrame = Instance.new("ScreenGui")
executorFrame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local inputBox = Instance.new("TextBox")
inputBox.Parent = executorFrame
inputBox.Size = UDim2.new(0, 400, 0, 40)
inputBox.Position = UDim2.new(0.5, -200, 0.4, 0)
inputBox.PlaceholderText = "Digite seu script Lua aqui"
inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.Font = Enum.Font.SourceSans
inputBox.TextScaled = true

local executeButton = Instance.new("TextButton")
executeButton.Parent = executorFrame
executeButton.Size = UDim2.new(0, 100, 0, 40)
executeButton.Position = UDim2.new(0.5, -50, 0.5, 0)
executeButton.Text = "Executar"
executeButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.Font = Enum.Font.SourceSans
executeButton.TextScaled = true

-- Função de execução do script
executeButton.MouseButton1Click:Connect(function()
    local userInput = inputBox.Text
    if userInput and userInput ~= "" then
        local success, result = pcall(function()
            -- Executando o código do usuário de forma controlada
            loadstring(userInput)()
        end)
        if success then
            print("Script executado com sucesso!")
        else
            print("Erro ao executar o script: " .. result)
        end
    else
        print("Nenhum código fornecido!")
    end
end)
