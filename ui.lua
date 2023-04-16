require "button"

Ui = {}

function Ui:load()
    local ww, wh = love.graphics.getDimensions()
    self.buttons = {}
    local margin = 0

    table.insert(self.buttons, Button:new(0, 0, margin, "water"))
    table.insert(self.buttons, Button:new(0, 1, margin, "food"))
    table.insert(self.buttons, Button:new(0, 2, margin, "lights"))
    table.insert(self.buttons, Button:new(0, 3, margin, "pet"))
    table.insert(self.buttons, Button:new(0, 4, margin, "check"))


    table.insert(self.buttons, Button:new(1, 0, margin, "play games"))
    table.insert(self.buttons, Button:new(1, 1, margin, "educate"))
    table.insert(self.buttons, Button:new(1, 2, margin, "bath"))
    table.insert(self.buttons, Button:new(1, 3, margin, "cool off"))
    table.insert(self.buttons, Button:new(1, 4, margin, "medical"))
end

function Ui:update(dt)
    for _, button in ipairs(self.buttons) do
        button:update(dt)
    end
end

function Ui:draw()
    -- Draw rectangle
    for _, button in ipairs(self.buttons) do
        button:draw()
    end
end

function Ui:mousepressed(x, y, buttonIndex)
    for _, button in ipairs(self.buttons) do
        button:mousepressed(x, y, buttonIndex)
    end
end
