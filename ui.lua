require "button"
require "pet"

Ui = {}

function Ui:load()
    self.buttons = {}
    local margin = 0


    table.insert(self.buttons, Button:new(0, 0, margin, "water"))
    table.insert(self.buttons, Button:new(0, 1, margin, "food"))
    table.insert(self.buttons, Button:new(0, 2, margin, "lights"))
    table.insert(self.buttons, Button:new(0, 3, margin, "pet"))
    table.insert(self.buttons, Button:new(0, 4, margin, "check"))


    table.insert(self.buttons, Button:new(1, 0, margin, "play_games"))
    table.insert(self.buttons, Button:new(1, 1, margin, "educate"))
    table.insert(self.buttons, Button:new(1, 2, margin, "bath"))
    table.insert(self.buttons, Button:new(1, 3, margin, "cool_off"))
    table.insert(self.buttons, Button:new(1, 4, margin, "medical"))

    Pet:load()
end

function Ui:update(dt)
    for _, button in ipairs(self.buttons) do
        button:update(dt)
    end


    Pet:update(dt)
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
end

function Ui:mousepressed(x, y, buttonIndex)
    for _, button in ipairs(self.buttons) do
        local action = button:mousepressed(x, y, buttonIndex)
        if action == "food" then
            Pet:feed()
        end
    end
end
