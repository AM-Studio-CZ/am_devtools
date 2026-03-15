RegisterCommand("setweather", function(source, args, rawCommand)
    if #args <1 then
        TriggerEvent("chat:addMessage", {args = {"^*^1DEVTOOLS: " .. "^r^7Please specify the weather type."}})
    end

    local newWeather = args[1]

    if Config.validWeatherTypes[newWeather] then
        TriggerServerEvent("Weather:changeWeather", newWeather)
        TriggerEvent("chat:addMessage", {args = {"^*^1DEVTOOLS: " .. "^r^7You changed the weather to: " .. newWeather}})
        return
    end
end, false)


RegisterCommand("settime", function(source, args, rawCommand)
    if #args <2 then
        TriggerEvent("chat:addMessage", {args = {"^*^1Admin: " .. "^r^7Please specify the time. (<hours> <minutes>)"}})
    end

    local hours = tonumber(args[1])
    local minutes = tonumber(args[2])

    if hours > 23 or minutes > 59 then
        TriggerEvent("chat:addMessage", {args = {"^*^1Admin: " .. "^r^7Please select the numbers between 0-23 (Hours) or 0-59 (minutes)"}})
        return
    end
    TriggerServerEvent("Time:changeTime", hours, minutes)
end, false)

RegisterCommand("coords", function(source)
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)

    print("X: " .. coords.x .. " Y: " .. coords.y .. " Z: " .. coords.z .. " H: " .. heading)
    return
end, false)

RegisterCommand("gvehhash", function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped)
    local vehHash GetHashKey(vehicle)

    print("Vehicle hash: " .. vehHash)
end, false)





RegisterNetEvent("Weather:updateWeathereventName", function(newWeather)
    SetWeatherTypeOvertimePersist(newWeather, 10)
end)

RegisterNetEvent("Time:updateTime", function(hours, minutes)
    NetworkOverrideClockTime(hours, minutes , 0)
end)