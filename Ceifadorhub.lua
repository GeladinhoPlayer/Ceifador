-- LocalScript: Menu Interativo (Arrastar e Minimizar)
local player = game.Players.LocalPlayer
local screenGui = script.Parent
local frame = screenGui:WaitForChild("Frame")
local minimizeButton = frame:WaitForChild("MinimizeButton")

-- Variáveis para arrastar
local dragging = false
local dragStart = nil
local startPosition = nil

-- Função para começar o arrasto
frame.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPosition = frame.Position
    end
end)

-- Função para arrastar
frame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
    end
end)

-- Função para parar o arrasto
frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Minimizar/Maximizar o Menu
local isMinimized = false
minimizeButton.MouseButton1Click:Connect(function()
    if isMinimized then
        frame.Size = UDim2.new(0, 200, 0, 200)  -- Tamanho original
        isMinimized = false
    else
        frame.Size = UDim2.new(0, 50, 0, 50)   -- Tamanho minimizado
        isMinimized = true
    end
end)
