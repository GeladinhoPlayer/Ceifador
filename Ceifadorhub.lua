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
local aimbotEnabled = false
local espEnabled = false

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

-- Adicionar seção de Scripts
local SectionScripts = TabScripts:AddSection({
    Name = "Ferramentas"
})

-- Função para ativar/desativar o NoClip (Wallhack)
SectionScripts:AddButton({
    Name = "Ativar Wallhack (NoClip)",
    Callback = function()
        noclip = not noclip
        if noclip then
            -- Aqui você ativa o NoClip
            game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            OrionLib:MakeNotification({
                Name = "Wallhack",
                Content = "Wallhack Ativado (NoClip)",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            -- Aqui você desativa o NoClip
            game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            OrionLib:MakeNotification({
                Name = "Wallhack",
                Content = "Wallhack Desativado (NoClip)",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
    end
})

-- Função para ativar/desativar o Aimbot
SectionScripts:AddButton({
    Name = "Ativar Aimbot",
    Callback = function()
        aimbotEnabled = not aimbotEnabled
        if aimbotEnabled then
            -- Aqui você deve implementar o código do Aimbot
            print("Aimbot Ativado!")
            OrionLib:MakeNotification({
                Name = "Aimbot",
                Content = "Aimbot Ativado",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            -- Desativa o Aimbot
            print("Aimbot Desativado!")
            OrionLib:MakeNotification({
                Name = "Aimbot",
                Content = "Aimbot Desativado",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
    end
})

-- Função para ativar/desativar o ESP (Extra Sensory Perception)
SectionScripts:AddButton({
    Name = "Ativar ESP",
    Callback = function()
        espEnabled = not espEnabled
        if espEnabled then
            -- Aqui você ativa o ESP
            print("ESP Ativado!")
            OrionLib:MakeNotification({
                Name = "ESP",
                Content = "ESP Ativado",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            -- Desativa o ESP
            print("ESP Desativado!")
            OrionLib:MakeNotification({
                Name = "ESP",
                Content = "ESP Desativado",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
    end
})

-- Função para ativar/desativar o Silent Aim
SectionScripts:AddButton({
    Name = "Ativar Silent Aim",
    Callback = function()
        -- Aqui você deve colocar o código do Silent Aim
        print("Silent Aim Ativado!")
        OrionLib:MakeNotification({
            Name = "Silent Aim",
            Content = "Silent Aim Ativado",
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
