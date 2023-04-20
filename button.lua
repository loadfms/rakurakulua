Button = {}

function Button:new(col, i, margin, slug, spriteRow)
    local o = {}

    o.x = 0
    o.y = 0
    o.i = i
    o.margin = margin
    o.color = { 0.5, 0.5, 0.5 }
    o.slug = slug
    o.col = col
    o.spriteRow = spriteRow

    setmetatable(o, self)
    self.__index = self
    return o
end

function Button:load()
    self.spriteSheet = love.graphics.newImage('assets/pet.png')

    self.spriteWidth = 13
    self.spriteHeight = 13
    self.grid = anim8.newGrid(self.spriteWidth, self.spriteHeight, self.spriteSheet:getWidth(),
        self.spriteSheet:getHeight())
    self.scale = 2

    self.animations = {}
    self.animations.default = anim8.newAnimation(self.grid('1-1', self.spriteRow), 1)
end

function Button:update(dt)
    local ww, wh = love.graphics.getDimensions()

    self.width   = ww * (1 / 7)
    self.height  = wh * (1 / 5)
    self.y       = (self.i * (self.height + self.margin)) + 13
    self.x       = (self.col * (ww - self.width)) + 13
end

function Button:draw()
    self.animations.default:draw(self.spriteSheet, self.x, self.y, nil, self.scale, self.scale)
end

function Button:mousepressed(x, y, buttonIndex)
    if buttonIndex == 1 and x > self.x and x < self.x + self.width and y > self.y and y < self.y + self.height then
        print("clicked on ", self.slug)
        return self.slug
    end
end
