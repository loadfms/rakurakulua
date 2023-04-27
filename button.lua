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
    self.spriteSheetLight = love.graphics.newImage('assets/pet.png')
    self.spriteSheetDark = love.graphics.newImage('assets/pet_dark.png')
    self.spriteSheet = self.spriteSheetLight

    self.spriteWidth = 24
    self.spriteHeight = 24
    self.grid = anim8.newGrid(self.spriteWidth, self.spriteHeight, self.spriteSheet:getWidth(),
        self.spriteSheet:getHeight())
    self.scale = 2

    self.animations = {}
    self.animations.default = anim8.newAnimation(self.grid('1-1', self.spriteRow), 1)
end

function Button:update(dt)
    local ww, wh = love.graphics.getDimensions()

    self.width   = (self.spriteWidth * self.scale)
    self.height  = (self.spriteHeight * self.scale)
    self.y       = (self.i * (self.height + self.margin))
    self.x       = self.col == 0 and self.width / 2 or ww - self.width
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

function Button:toggleLights()
    self.spriteSheet = self.spriteSheet == self.spriteSheetLight and self.spriteSheetDark or self.spriteSheetLight
end
