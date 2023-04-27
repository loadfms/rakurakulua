require "button"
require "pet"
local gameclock = require("gameclock")

Ui = {}

function Ui:load()
    self.buttons = {}
    local margin = 6

    self.bgRed = 137 / 255
    self.bgGreen = 213 / 255
    self.bgBlue = 185 / 255

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
    love.graphics.setBackgroundColor(self.bgRed, self.bgGreen, self.bgBlue)

    for _, button in ipairs(self.buttons) do
        button:draw()
    end

    Pet:draw()
    love.graphics.print(
        string.format("%02d:%02d:%02d", gameclock.game_hour, gameclock.game_minute, gameclock.game_second)
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

        if action == "lights" then
            Ui:toggleLights()
            Pet:toggleLights()
            for _, item in ipairs(self.buttons) do
                item:toggleLights()
            end
        end
    end
end

function Ui:toggleLights()
    self.bgRed = self.bgRed == 0 and 137 / 255 or 0
    self.bgGreen = self.bgGreen == 0 and 213 / 255 or 0
    self.bgBlue = self.bgBlue == 0 and 185 / 255 or 0
end
