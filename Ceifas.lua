-- HyperHub | Arsenal -- Feito para Orion Executor

-- Carregar a OrionLib local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({Name = "HyperHub | Arsenal", HidePremium = false, SaveConfig = true, ConfigFolder = "HyperHubConfig"})

-- Aba principal local Tab = Window:MakeTab({ Name = "Scripts", Icon = "rbxassetid://4483345998", PremiumOnly = false })

-- Loader BETA botão Tab:AddButton({ Name = "Loader BETA", Callback = function() -- Script do BETAv1.3 wait(1)

local Camera = workspace.CurrentCamera
    local uis = game:GetService("UserInputService")
    local ts = game:GetService("TweenService")
    local Main = Instance.new("ScreenGui")
    local Loader = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Blur = Instance.new("ImageLabel")
    local UICorner_2 = Instance.new("UICorner")
    local quotasloader = Instance.new("TextLabel")
    local Bar = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local Loaded = Instance.new("Frame")
    local UICorner_4 = Instance.new("UICorner")

    Main.Name = "Main"
    Main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Main.ResetOnSpawn = false
    Main.DisplayOrder = 9999

    Loader.Name = "Loader"
    Loader.Parent = Main
    Loader.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
    Loader.BackgroundTransparency = 0.200
    Loader.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Loader.BorderSizePixel = 0
    Loader.Position = UDim2.new(0.436969697, 0, 0.455082744, 0)
    Loader.Size = UDim2.new(0, 280, 0, 150)

    -- (Aqui continuaria com o restante da construção da GUI...)
    -- Para não ficar gigante, se quiser, posso mandar o script completo também.

end

})

-- Notificação que o Hub foi carregado OrionLib:MakeNotification({ Name = "HyperHub", Content = "Bem-vindo ao HyperHub!", Image = "rbxassetid://4483345998", Time = 5 })

