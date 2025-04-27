-- Carregar a biblioteca Orion UI
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

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

-- Criar a aba Home
local TabHome = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

TabHome:AddButton({
    Name = "Bem-vindo ao Ceifador Hub!",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Mensagem",
            Content = "Bem-vindo ao Ceifador Hub V3!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

-- Criar a aba Scripts
local TabScripts = Window:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Adicionar categoria de scripts com botões
local Section = TabScripts:AddSection({
    Name = "Ferramentas"
})

Section:AddButton({
    Name = "Ativar Aimbot",
    Callback = function()
        -- Aqui você deve adicionar o código para ativar o Aimbot
        print("Aimbot ativado!")
        OrionLib:MakeNotification({
            Name = "Aimbot",
            Content = "Aimbot ativado!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

Section:AddButton({
    Name = "Ativar ESP",
    Callback = function()
        -- Aqui você deve adicionar o código para ativar o ESP
        print("ESP ativado!")
        OrionLib:MakeNotification({
            Name = "ESP",
            Content = "ESP ativado!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

Section:AddButton({
    Name = "Ativar Silent Aim",
    Callback = function()
        -- Aqui você deve adicionar o código para ativar o Silent Aim
        print("Silent Aim ativado!")
        OrionLib:MakeNotification({
            Name = "Silent Aim",
            Content = "Silent Aim ativado!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

Section:AddButton({
    Name = "Ativar Wallhack",
    Callback = function()
        -- Aqui você deve adicionar o código para ativar o Wallhack
        print("Wallhack ativado!")
        OrionLib:MakeNotification({
            Name = "Wallhack",
            Content = "Wallhack ativado!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

-- Mostrar a janela
Window:Show()
