--[[
    Ceifador | V3
    Script para Hub de Scripts no Roblox
]]

-- Criar GUI Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CeifadorHub"
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Título do Hub
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "Ceifador | V3"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 30
Title.TextStrokeTransparency = 0.5
Title.Parent = MainFrame

-- Criar as Páginas
local Page1 = Instance.new("Frame")
Page1.Size = UDim2.new(1, 0, 1, -60)
Page1.Position = UDim2.new(0, 0, 0, 60)
Page1.BackgroundTransparency = 1
Page1.Parent = MainFrame

local Page2 = Instance.new("Frame")
Page2.Size = UDim2.new(1, 0, 1, -60)
Page2.Position = UDim2.new(0, 0, 0, 60)
Page2.BackgroundTransparency = 1
Page2.Visible = false
Page2.Parent = MainFrame

-- Botões de Navegação
local NextPageBtn = Instance.new("TextButton")
NextPageBtn.Size = UDim2.new(0, 100, 0, 40)
NextPageBtn.Position = UDim2.new(1, -120, 1, -50)
NextPageBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
NextPageBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NextPageBtn.Font = Enum.Font.Gotham
NextPageBtn.Text = "Próxima"
NextPageBtn.Parent = MainFrame

local BackPageBtn = Instance.new("TextButton")
BackPageBtn.Size = UDim2.new(0, 100, 0, 40)
BackPageBtn.Position = UDim2.new(0, 20, 1, -50)
BackPageBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BackPageBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BackPageBtn.Font = Enum.Font.Gotham
BackPageBtn.Text = "Voltar"
BackPageBtn.Visible = false
BackPageBtn.Parent = MainFrame

-- Função para Criar Botões
local function createButton(parent, text, position, scriptUrl)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.8, 0, 0, 40)
    Button.Position = UDim2.new(0.1, 0, 0, position)
    Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 18
    Button.Text = text
    Button.Parent = parent

    -- Animação no botão (Hover)
    Button.MouseEnter:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    end)

    Button.MouseLeave:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)

    -- Quando o botão é clicado, executa o script
    Button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
end

-- Botões da Página 1 (Aimbot, ESP, No Recoil)
createButton(Page1, "Aimbot", 30, "https://raw.githubusercontent.com/SEUNOME/ceifadorhub/main/aimbot.lua")
createButton(Page1, "ESP (Ver Inimigos)", 100, "https://raw.githubusercontent.com/SEUNOME/ceifadorhub/main/esp.lua")
createButton(Page1, "No Recoil", 170, "https://raw.githubusercontent.com/SEUNOME/ceifadorhub/main/norecoil.lua")

-- Botões da Página 2 (Wallbang, Fly Hack, Speed Hack)
createButton(Page2, "Wallbang (Atirar nas Paredes)", 30, "https://raw.githubusercontent.com/SEUNOME/ceifadorhub/main/wallbang.lua")
createButton(Page2, "Fly Hack", 100, "https://raw.githubusercontent.com/SEUNOME/ceifadorhub/main/fly.lua")
createButton(Page2, "Speed Hack", 170, "https://raw.githubusercontent.com/SEUNOME/ceifadorhub/main/speed.lua")

-- Lógica dos Botões de Navegação
NextPageBtn.MouseButton1Click:Connect(function()
    -- Transição suave para a próxima página
    Page1.Visible = false
    Page2.Visible = true
    NextPageBtn.Visible = false
    BackPageBtn.Visible = true
end)

BackPageBtn.MouseButton1Click:Connect(function()
    -- Transição suave de volta para a página anterior
    Page1.Visible = true
    Page2.Visible = false
    NextPageBtn.Visible = true
    BackPageBtn.Visible = false
end)
