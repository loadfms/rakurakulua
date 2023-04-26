local gameclock = {}

gameclock.timer = 0
gameclock.game_hour = 0
gameclock.game_minute = 0
gameclock.game_second = 0
gameclock.game_day = 0

function gameclock.update(dt)
    gameclock.timer = gameclock.timer + dt

    if gameclock.timer >= 1 then
        gameclock.game_second = gameclock.game_second + 1
        gameclock.timer = gameclock.timer - 1

        if gameclock.game_second >= 60 then
            gameclock.game_minute = gameclock.game_minute + 1
            gameclock.game_second = 0

            if gameclock.game_minute >= 60 then
                gameclock.game_hour = gameclock.game_hour + 1
                gameclock.game_minute = 0

                if gameclock.game_hour >= 24 then
                    gameclock.game_day = gameclock.game_day + 1
                    gameclock.game_hour = 0
                end
            end
        end
    end
end

function gameclock.save()
    local file = io.open("data", "w")
    file:write(gameclock.game_hour .. "\n")
    file:write(gameclock.game_minute .. "\n")
    file:write(gameclock.game_second .. "\n")
    file:write(gameclock.game_day .. "\n")
    file:close()
end

function gameclock.load()
    local file = io.open("data", "r")
    if file then
        gameclock.game_hour = tonumber(file:read("*line"))
        gameclock.game_minute = tonumber(file:read("*line"))
        gameclock.game_second = tonumber(file:read("*line"))
        gameclock.game_day = tonumber(file:read("*line"))
        file:close()
    else
        gameclock.game_hour = 8
    end
end

return gameclock
