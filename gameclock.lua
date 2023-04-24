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

return gameclock
