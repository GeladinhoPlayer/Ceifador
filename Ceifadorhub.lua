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

-- Variável para controlar o estado do noclip
local noclip = false

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

-- Botão de Wallhack (NoClip)
Section:AddButton({
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

-- Mostrar a janela
Window:Show()
