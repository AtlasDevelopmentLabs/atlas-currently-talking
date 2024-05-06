local startingHeight = 0.01 -- How far it is from top of screen. Limit is 0.10
local titleColor = '~b~' -- Currently Talking Text
local outerIdColor = '~w~' -- [] Brackets 
local innerIdColor = '~w~' -- PlayerID
local defaultNameColor = '~w~' -- PlayerName

function drawTxt(x, y, width, height, scale, text, r, g, b, a)
    SetTextFont(6)
    SetTextScale(scale, scale)
    SetTextCentre(true)
    SetTextOutline()
    SetTextJustification(0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for _, player in ipairs(GetActivePlayers()) do
            local talking = NetworkIsPlayerTalking(player)
            local playerId = GetPlayerServerId(player)
            local playerName = GetPlayerName(player)
            local name = outerIdColor .. '[' .. innerIdColor .. playerId .. outerIdColor .. '] ' .. defaultNameColor .. playerName
            if talking then
                drawTxt(0.5, startingHeight, 1.0, 1.0, 0.35, titleColor .. "Currently Talking: \n" .. name, 255, 255, 255, 255)
            end
        end
    end
end)
