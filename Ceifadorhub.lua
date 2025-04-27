--[[
    Ceifador Hub V3
    Feito para mobile/PC
    Key: 9M
]]

local key = "9M"

-- Interface Services
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local KeyFrame = Instance.new("Frame")
local MenuFrame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local SubmitButton = Instance.new("TextButton")
local SideBar = Instance.new("Frame")
local MainArea = Instance.new("Frame")
local UICorner1 = Instance.new("UICorner")
local UICorner2 = Instance.new("UICorner")

-- Configuração da Tela
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- KeyFrame (Tela de Key)
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = ScreenGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
KeyFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
KeyFrame.Size = UDim2.new(0, 300, 0, 200)

UICorner1.Parent = KeyFrame

TextBox.Parent = KeyFrame
TextBox.PlaceholderText = "Digite a key aqui"
TextBox.Text = ""
TextBox.Size = UDim2.new(0, 200, 0, 40)
TextBox.Position = UDim2.new(0.15, 0, 0.2, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
TextBox.TextColor3 = Color3.fromRGB(255,255,255)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextScaled = true

SubmitButton.Parent = KeyFrame
SubmitButton.Text = "Entrar"
SubmitButton.Size = UDim2.new(0, 150, 0, 40)
SubmitButton.Position = UDim2.new(0.25, 0, 0.6, 0)
SubmitButton.BackgroundColor3 = Color3.fromRGB(50,150,50)
SubmitButton.TextColor3 = Color3.fromRGB(255,255,255)
SubmitButton.Font = Enum.Font.SourceSans
SubmitButton.TextScaled = true

-- Menu (depois da key)
MenuFrame.Name = "MenuFrame"
MenuFrame.Parent = ScreenGui
MenuFrame.Visible = false
MenuFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
MenuFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
MenuFrame.Size = UDim2.new(0, 500, 0, 400)

UICorner2.Parent = MenuFrame

SideBar.Name = "SideBar"
SideBar.Parent = MenuFrame
SideBar.BackgroundColor3 = Color3.fromRGB(20,20,20)
SideBar.Size = UDim2.new(0, 120, 1, 0)

MainArea.Name = "MainArea"
MainArea.Parent = MenuFrame
MainArea.BackgroundColor3 = Color3.fromRGB(35,35,35)
MainArea.Position = UDim2.new(0.24, 0, 0, 0)
MainArea.Size = UDim2.new(0.76, 0, 1, 0)

-- SideBar Buttons (categorias)
local categories = {"Aimbot", "ESP", "Silent Aim", "Wallhack"}

for i, name in ipairs(categories) do
    local button = Instance.new("TextButton")
    button.Parent = SideBar
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = UDim2.new(0, 0, 0, (i-1)*50)
    button.BackgroundColor3 = Color3.fromRGB(30,30,30)
    button.TextColor3 = Color3.fromRGB(255,255,255)
    button.Text = name
    button.Font = Enum.Font.SourceSans
    button.TextScaled = true

    button.MouseButton1Click:Connect(function()
        print("Ativado: "..name)
        -- Aqui você coloca o código de cada hack
    end)
end

-- Função do botão de key
SubmitButton.MouseButton1Click:Connect(function()
    if TextBox.Text == key then
        KeyFrame.Visible = false
        MenuFrame.Visible = true
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "Key incorreta!"
    end
end)
