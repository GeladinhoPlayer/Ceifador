-- Carregar a biblioteca Orion UI
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

-- Criar a janela principal do menu
local Window = OrionLib:MakeWindow({
    Name = "GeladoHub | V3",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "GeladoHubV3",
    IntroEnabled = true,
    IntroText = "Bem-vindo ao GeladoHub V3!",
    Icon = "rbxassetid://4483345998"
})

-- Variável para controlar o estado do noclip
local noclip = false

-- Criar a aba Home
local TabHome = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Adicionar informações de criador na aba Home
local SectionHome = TabHome:AddSection({
    Name = "Informações"
})

SectionHome:AddLabel("Nome do Hub: GeladoHub | V3")
SectionHome:AddLabel("Criador: Geladinho")

-- Criar a aba Scripts
local TabScripts = Window:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Adicionar seção de Ferramentas e Scripts
local SectionScripts = TabScripts:AddSection({
    Name = "Ferramentas"
})

-- Botão de Wallhack (NoClip)
SectionScripts:AddButton({
    Name = "Ativar Wallhack (NoClip)",
    Callback = function()
        noclip = not noclip
        -- Aqui você deve adicionar o código real para ativar/desativar o NoClip
        if noclip then
            -- Coloque o código que ativa o NoClip
            print("Wallhack (NoClip) Ativado!")
        else
            -- Coloque o código que desativa o NoClip
            print("Wallhack (NoClip) Desativado!")
        end
        
        -- Notificação de ativação/desativação
        OrionLib:MakeNotification({
            Name = "Wallhack",
            Content = noclip and "Wallhack Ativado" or "Wallhack Desativado",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

-- Botão de Aimbot
SectionScripts:AddButton({
    Name = "Ativar Aimbot",
    Callback = function()
        -- Coloque o código do aimbot aqui
        print("Aimbot Ativado!")
        OrionLib:MakeNotification({
            Name = "Aimbot",
            Content = "Aimbot Ativado",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

-- Botão de ESP
SectionScripts:AddButton({
    Name = "Ativar ESP",
    Callback = function()
        -- Coloque o código de ESP aqui
        print("ESP Ativado!")
        OrionLib:MakeNotification({
            Name = "ESP",
            Content = "ESP Ativado",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

-- Botão de Silent Aim
SectionScripts:AddButton({
    Name = "Ativar Silent Aim",
    Callback = function()
        -- Coloque o código do silent aim aqui
        print("Silent Aim Ativado!")
        OrionLib:MakeNotification({
            Name = "Silent Aim",
            Content = "Silent Aim Ativado",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

-- Botão de Wallhack
SectionScripts:AddButton({
    Name = "Ativar Wallhack",
    Callback = function()
        -- Coloque o código do Wallhack aqui
        print("Wallhack Ativado!")
        OrionLib:MakeNotification({
            Name = "Wallhack",
            Content = "Wallhack Ativado",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

-- Criar a aba Configuração
local TabConfig = Window:MakeTab({
    Name = "Configuração",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Adicionar configurações
local SectionConfig = TabConfig:AddSection({
    Name = "Configurações do Hub"
})

SectionConfig:AddLabel("Nome do Hub: GeladoHub | V3")
SectionConfig:AddLabel("Criador: Geladinho")

-- Mostrar a janela
Window:Show()
