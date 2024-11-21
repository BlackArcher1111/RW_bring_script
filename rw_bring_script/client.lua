
RegisterNetEvent('bring:teleport')
AddEventHandler('bring:teleport', function(coords)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, coords.x, coords.y, coords.z)
end)


RegisterNetEvent('alam:notify')
AddEventHandler('alam:notify', function(title, message)
   
    exports['alam']:SendNotification({
        title = title,
        message = message,
        type = 'info' 
    })
end)
