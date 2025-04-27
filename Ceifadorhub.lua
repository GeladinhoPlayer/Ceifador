--// Simple Shooter Hub

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall"))()

local Window = Library:CreateWindow("Shooter Hub V1") -- título do hub
local Main = Window:CreateFolder("Games") -- aba principal

-- Botões de jogos
Main:Button("Arsenal", function()
    loadstring(game:HttpGet("COLE_AQUI_O_SCRIPT_DO_JOGO"))()
end)

Main:Button("Bad Business", function()
    loadstring(game:HttpGet("COLE_AQUI_O_SCRIPT_DO_JOGO"))()
end)

Main:Button("Phantom Forces", function()
    loadstring(game:HttpGet("COLE_AQUI_O_SCRIPT_DO_JOGO"))()
end)

Main:Button("Energy Assault", function()
    loadstring(game:HttpGet("COLE_AQUI_O_SCRIPT_DO_JOGO"))()
end)

Main:Button("Aim Trainer", function()
    loadstring(game:HttpGet("COLE_AQUI_O_SCRIPT_DO_JOGO"))()
end)

Main:DestroyGui()
