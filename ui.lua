require "button"
require "pet"
local gameclock = require("gameclock")

Ui = {}

function Ui:load()
    self.buttons = {}
    local margin = 0


    table.insert(self.buttons, Button:new(0, 0, margin, "water", 10))
    table.insert(self.buttons, Button:new(0, 1, margin, "food", 8))
    table.insert(self.buttons, Button:new(0, 2, margin, "lights", 9))
    table.insert(self.buttons, Button:new(0, 3, margin, "pet", 7))
    table.insert(self.buttons, Button:new(0, 4, margin, "check", 6))


    table.insert(self.buttons, Button:new(1, 0, margin, "play_games", 1))
    table.insert(self.buttons, Button:new(1, 1, margin, "educate", 2))
    table.insert(self.buttons, Button:new(1, 2, margin, "bath", 3))
    table.insert(self.buttons, Button:new(1, 3, margin, "cool_off", 4))
    table.insert(self.buttons, Button:new(1, 4, margin, "medical", 5))

    for _, button in ipairs(self.buttons) do
        button:load()
    end

    Pet:load()
end

function Ui:update(dt)
    for _, button in ipairs(self.buttons) do
        button:update(dt)
    end


    Pet:update(dt)
    gameclock.update(dt)
end

function Ui:draw()
    local red = 137 / 255
    local green = 213 / 255
    local blue = 185 / 255
    love.graphics.setBackgroundColor(red, green, blue)

    for _, button in ipairs(self.buttons) do
        button:draw()
    end

    Pet:draw()
    love.graphics.print(string.format("%02d:%02d:%02d", gameclock.game_hour, gameclock.game_minute, gameclock.game_second)
        , 10, 10)
end

function Ui:mousepressed(x, y, buttonIndex)
    for _, button in ipairs(self.buttons) do
        local action = button:mousepressed(x, y, buttonIndex)
        if action == "food" then
            Pet:feed()
        end

        if action == "pet" then
            Pet:evolve()
        end
    end
end
