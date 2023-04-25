Pet = {}

local gameclock = require("gameclock")

function Pet:load()
    ww, wh = love.graphics.getDimensions()

    self.speed = 20
    self.state = "idle"
    self.level = 1

    self.spriteSheet = love.graphics.newImage('assets/pet.png')

    self.scale = 10
    self.spriteWidth = 13
    self.spriteHeight = 13
    self.grid = anim8.newGrid(self.spriteWidth, self.spriteHeight, self.spriteSheet:getWidth(),
        self.spriteSheet:getHeight())


    self.x = (ww / 2) - (self.spriteWidth * self.scale / 2)
    self.y = (wh / 2) - (self.spriteHeight * self.scale / 3)

    self.animationSpeed = 1

    self.animations = {}

    self.animations[1] = {}
    self.animations[2] = {}

    self.animations[1]["idle"] = anim8.newAnimation(self.grid('1-2', 14), self.animationSpeed)
    self.animations[1]["sleeping"] = anim8.newAnimation(self.grid('1-2', 13), self.animationSpeed)

    self.animations[2]["idle"] = anim8.newAnimation(self.grid('1-2', 12), self.animationSpeed)
    self.animations[2]["sleeping"] = anim8.newAnimation(self.grid('1-2', 11), self.animationSpeed)

    self.anim = self.animations[self.level].idle
end

function Pet:update(dt)
    local buttonsWidth = ww * (1 / 5)
    local hour = gameclock.game_hour
    local minute = gameclock.game_minute
    local second = gameclock.game_second

    self.move_timer = self.move_timer or 0
    self.move_state = self.move_state or "moving"
    self.move_direction = self.move_direction or 1
    self.move_delay = self.animationSpeed

    self.move_timer = self.move_timer + dt

    self.anim = self.animations[self.level][self.state]

    if self.state ~= "sleeping" then
        if self.move_state == "moving" then
            if self.move_timer >= self.move_delay then
                self.move_state = "waiting"
                self.move_timer = 0
            end

            local buttonDifference = (self.move_direction == 1 and 1 or -1) * buttonsWidth
            local next_x = self.x + (self.move_direction == 1 and 1 or -1) + buttonDifference
            local max_x = ww - self.spriteWidth - buttonsWidth


            if next_x < 0 or next_x > max_x then
                self.move_direction = 1 - self.move_direction
            end

            self.x = self.x + (self.move_direction == 1 and 1 or -1)
        elseif self.move_state == "waiting" then
            if self.move_timer >= self.move_delay then
                self.move_direction = love.math.random(0, 1)
                self.move_state = "moving"
                self.move_timer = 0
            end
        end
    end

    if second == 10 then
        self.state = "sleeping"
    end

    self.anim:update(dt)
end

function Pet:draw()
    self.anim:draw(self.spriteSheet, self.x, self.y, nil, self.scale, self.scale)
end

function Pet:evolve()
    self.level = self.level + 1
    self.anim = self.animations[self.level].idle

    self.anim:draw(self.spriteSheet, self.x, self.y, nil, self.scale, self.scale)
end

function Pet:feed()
    self.state = "sleeping"
end
