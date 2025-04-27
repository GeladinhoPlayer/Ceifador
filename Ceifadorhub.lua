-- Orion UI Setup
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/OhYea9/Orion/main/OrionLib.lua"))()
local Window = OrionLib:MakeWindow({Name = "GeladoHub | V3", HidePremium = false, SaveConfig = true, ConfigFolder = "GeladoHub"})

-- Variables
local noclip = false
local aimbotEnabled = false
local espEnabled = false
local silentAimEnabled = false

-- Function to toggle NoClip
local function toggleNoClip()
    noclip = not noclip
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = noclip
        end
        -- Handle walking through walls
        if noclip then
            for _, v in pairs(character:GetChildren()) do
                if v:IsA("Part") then
                    v.CanCollide = false
                end
            end
        else
            for _, v in pairs(character:GetChildren()) do
                if v:IsA("Part") then
                    v.CanCollide = true
                end
            end
        end
    end
end

-- Function to handle Aimbot (simplified version)
local function aimbot()
    local character = game.Players.LocalPlayer.Character
    if not character then return end
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    -- Basic aimbot logic (just for demonstration)
    if aimbotEnabled then
        for _, target in pairs(game.Players:GetPlayers()) do
            if target ~= game.Players.LocalPlayer then
                local targetHumanoidRootPart = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
                if targetHumanoidRootPart then
                    -- Calculate the direction towards the target
                    local direction = (targetHumanoidRootPart.Position - humanoidRootPart.Position).unit
                    humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, targetHumanoidRootPart.Position)
                end
            end
        end
    end
end

-- ESP (Extra Sensory Perception) - Display enemy boxes
local function esp()
    if espEnabled then
        for _, target in pairs(game.Players:GetPlayers()) do
            if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local targetHRP = target.Character.HumanoidRootPart
                local box = Instance.new("BoxHandleAdornment")
                box.Parent = targetHRP
                box.Adornee = targetHRP
                box.Size = Vector3.new(4, 6, 4)
                box.Color3 = Color3.fromRGB(255, 0, 0) -- Red for enemies
                box.Transparency = 0.5
                box.AlwaysOnTop = true
                box.ZIndex = 5
            end
        end
    end
end

-- Silent Aim - Aimbot without visual aim lock
local function silentAim()
    if silentAimEnabled then
        for _, target in pairs(game.Players:GetPlayers()) do
            if target ~= game.Players.LocalPlayer and target.Character then
                local targetHumanoidRootPart = target.Character:FindFirstChild("HumanoidRootPart")
                if targetHumanoidRootPart then
                    -- Here you can add your shooting logic (to make the gun shoot where the target is)
                    -- Example: Fire bullet automatically when aiming at a target
                    -- You'd need to connect it to your weapon's firing mechanism
                end
            end
        end
    end
end

-- Orion UI Window Setup
local homeTab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://5012544611",
    PremiumOnly = false
})

homeTab:AddParagraph("GeladoHub V3", "Criado por Geladinho")
homeTab:AddParagraph("ID do Criador", "Geladinho#1234")

local scriptTab = Window:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://5012544611",
    PremiumOnly = false
})

-- Home Button Actions
scriptTab:AddButton({
    Name = "Ativar Wallhack (NoClip)",
    Callback = function()
        print("Toggling NoClip")  -- Debug message
        toggleNoClip()
        OrionLib:MakeNotification({
            Name = "Wallhack",
            Content = noclip and "Wallhack Ativado" or "Wallhack Desativado",
            Time = 3
        })
    end
})

scriptTab:AddButton({
    Name = "Ativar Aimbot",
    Callback = function()
        aimbotEnabled = not aimbotEnabled
        print("Aimbot Toggled: " .. tostring(aimbotEnabled))  -- Debug message
        OrionLib:MakeNotification({
            Name = "Aimbot",
            Content = aimbotEnabled and "Aimbot Ativado" or "Aimbot Desativado",
            Time = 3
        })
    end
})

scriptTab:AddButton({
    Name = "Ativar ESP",
    Callback = function()
        espEnabled = not espEnabled
        print("ESP Toggled: " .. tostring(espEnabled))  -- Debug message
        OrionLib:MakeNotification({
            Name = "ESP",
            Content = espEnabled and "ESP Ativado" or "ESP Desativado",
            Time = 3
        })
        esp()  -- Run the ESP function
    end
})

scriptTab:AddButton({
    Name = "Ativar Silent Aim",
    Callback = function()
        silentAimEnabled = not silentAimEnabled
        print("Silent Aim Toggled: " .. tostring(silentAimEnabled))  -- Debug message
        OrionLib:MakeNotification({
            Name = "Silent Aim",
            Content = silentAimEnabled and "Silent Aim Ativado" or "Silent Aim Desativado",
            Time = 3
        })
    end
})

-- Configurations (Create Configuration Tab)
local configTab = Window:MakeTab({
    Name = "Configurações",
    Icon = "rbxassetid://5012544611",
    PremiumOnly = false
})

configTab:AddParagraph("Nome do Hub", "GeladoHub | V3")
configTab:AddParagraph("Criador", "Geladinho#1234")

-- Refresh the menu and start listening for user actions
OrionLib:Init()

-- Keep the aimbot, esp, and silent aim functions running in a loop
game:GetService("RunService").RenderStepped:Connect(function()
    -- Make sure each function is continuously updated
    aimbot()
    silentAim()
end)
