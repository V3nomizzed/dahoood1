local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local function setInvisible(invisible)
    local character = player.Character
    if not character then return end

    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") or part:IsA("MeshPart") then
            part.Transparency = invisible and 1 or 0
            part.CanCollide = not invisible
        elseif part:IsA("Decal") then
            part.Transparency = invisible and 1 or 0
        elseif part:IsA("Accessory") then
            -- Auch Accessory-Teile durchsichtig machen
            for _, accPart in pairs(part:GetChildren()) do
                if accPart:IsA("BasePart") or accPart:IsA("MeshPart") then
                    accPart.Transparency = invisible and 1 or 0
                    accPart.CanCollide = not invisible
                elseif accPart:IsA("Decal") then
                    accPart.Transparency = invisible and 1 or 0
                end
            end
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
