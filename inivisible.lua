local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local function setInvisible(invisible)
    local character = player.Character
    if not character then return end

    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            if invisible then
                part.Transparency = 1
                part.CanCollide = false
            else
                part.Transparency = 0
                part.CanCollide = true
            end
        elseif part:IsA("Decal") then
            part.Transparency = invisible and 1 or 0
        end
    end
end

local invisible = false
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.P then
        invisible = not invisible
        setInvisible(invisible)
    end
end)
