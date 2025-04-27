-- Definindo o jogador
local player = game.Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

-- Criando a janela principal
local Window = OrionLib:MakeWindow({
    Name = "Ceifador | V3 Blox Fruits",  -- Nome da janela (pode personalizar)
    HidePremium = false,                 -- Não esconder o status Premium
    SaveConfig = true,                   -- Salvar configurações
    ConfigFolder = "CeifadorV3",         -- Nome da pasta para salvar as configurações
    IntroEnabled = true,                 -- Animação de introdução habilitada
    IntroText = "Bem-vindo ao Ceifador | V3",  -- Texto de introdução
    Icon = "rbxassetid://1234567890",    -- Ícone do Hub
})

-- Criando as abas
local Tab1 = Window:MakeTab({
    Name = "Funções do Jogador",
    Icon = "rbxassetid://4483345998",  -- Ícone da aba
})

local Tab2 = Window:MakeTab({
    Name = "Ajustes de Jogo",
    Icon = "rbxassetid://4483345998",  -- Ícone da aba
})

local Tab3 = Window:MakeTab({
    Name = "Extras",
    Icon = "rbxassetid://4483345998",  -- Ícone da aba
})

-- Funções para a aba "Funções do Jogador"
Tab1:AddSection({
    Name = "Ações de Personagem"
})

Tab1:AddButton({
    Name = "Alta Velocidade",
    Callback = function()
        player.Character.Humanoid.WalkSpeed = 500
    end
})

Tab1:AddButton({
    Name = "Pulo Alto",
    Callback = function()
        player.Character.Humanoid.JumpPower = 100
    end
})

Tab1:AddButton({
    Name = "Gravidade Baixa",
    Callback = function()
        game.Workspace.Gravity = 10
    end
})

Tab1:AddButton({
    Name = "Gravidade Normal",
    Callback = function()
        game.Workspace.Gravity = 196.2
    end
})

-- Funções para a aba "Ajustes de Jogo"
Tab2:AddSection({
    Name = "Controle de Jogo"
})

Tab2:AddButton({
    Name = "Resetar Teleporte",
    Callback = function()
        -- Adiciona aqui seu código de teleporte ou qualquer outra ação.
        print("Teleporte resetado!")
    end
})

Tab2:AddButton({
    Name = "Mudar a Hora do Jogo",
    Callback = function()
        game.Lighting.TimeOfDay = "14:00:00"  -- Altera a hora do jogo para 14:00
    end
})

-- Funções para a aba "Extras"
Tab3:AddSection({
    Name = "Funções Extras"
})

Tab3:AddButton({
    Name = "Ativar Voo",
    Callback = function()
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = true
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.new(0, 50, 0)
            bodyVelocity.Parent = player.Character:FindFirstChild("HumanoidRootPart")
        end
    end
})

Tab3:AddButton({
    Name = "Desativar Voo",
    Callback = function()
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            local bodyVelocity = player.Character:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
                bodyVelocity:Destroy()
            end
        end
    end
})

-- Notificação de boas-vindas
OrionLib:MakeNotification({
    Name = "Bem-vindo!",
    Content = "Seja bem-vindo ao Ceifador | V3 Hub!",
    Image = "rbxassetid://4483345998",  -- Ícone de notificação
    Time = 5  -- Tempo de exibição da notificação
})

-- Função para manipular notificações adicionais
function SendCustomNotification()
    OrionLib:MakeNotification({
        Name = "Atenção!",
        Content = "O servidor foi atualizado! Verifique as novas opções no Hub.",
        Image = "rbxassetid://4483345998",  -- Ícone de notificação personalizada
        Time = 7  -- Duração personalizada
    })
end

-- Chamando a função de notificação personalizada
SendCustomNotification()
