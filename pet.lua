Pet = {}

function Pet:load()
    self.x = 0
    self.y = 0
    self.speed = 100

    self.spriteSheet = love.graphics.newImage('assets/player.png')

    self.scale = 4
    self.spriteWidth = self.spriteSheet:getWidth() / 7
    self.spriteHeight = self.spriteSheet:getHeight()
    self.grid = anim8.newGrid(self.spriteWidth, self.spriteHeight, self.spriteSheet:getWidth(),
        self.spriteSheet:getHeight())

    self.animations = {}
    self.animations.idle = anim8.newAnimation(self.grid('1-7', 1), 0.2)
end

function Pet:update(dt)
    local ww, wh = love.graphics.getDimensions()

    self.x = (ww / 2) - (self.spriteWidth * self.scale / 2)
    self.y = wh - self.spriteHeight * self.scale

    self.animations.idle:update(dt)
end

function Pet:draw()
    self.animations.idle:draw(self.spriteSheet, self.x, self.y, nil, self.scale, self.scale)
end
