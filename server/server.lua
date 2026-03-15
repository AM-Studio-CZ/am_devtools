RegisterNetEvent("Weather:changeWeather", function(newWeather)
    TriggerClientEvent("Weather:updateWeather", -1, newWeather)
end)

RegisterNetEvent("Time:changeTime", function(hours, minutes)
    TriggerClientEvent("Time:updateTime", -1, hours, minutes)
end)