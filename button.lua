Button = {}

function Button:new(col, i, margin, text)
    local o = {}

    o.x = 0
    o.y = 0
    o.i = i
    o.margin = margin
    o.color = { 0.5, 0.5, 0.5 }
    o.text = text
    o.col = col

    setmetatable(o, self)
    self.__index = self
    return o
end

function Button:load()
    local ww, wh = love.graphics.getDimensions()

    self.width   = ww * (1 / 5)
    self.height  = wh * (1 / 5)
    self.y       = self.i * (self.height + self.margin)
    self.x       = self.col * (ww - self.width)
end

function Button:update(dt)
end

function Button:draw()
    -- Draw rectangle
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    -- Write text
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(love.graphics.newFont(24))
    love.graphics.print(self.text, self.x, self.y + (self.height / 2) - 12)
end

function Button:mousepressed(x, y, buttonIndex)
    if buttonIndex == 1 and x > self.x and x < self.x + self.width and y > self.y and y < self.y + self.height then
        print("clicked on ", self.text)
    end
end
