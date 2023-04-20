require("ui")

function love.load()
    anim8 = require 'libraries/anim8'

    love.window.setMode(400, 300)

    love.graphics.setDefaultFilter("nearest", "nearest")

    Ui:load()
end

function love.update(dt)
    Ui:update(dt)
end

function love.draw()
    Ui:draw()

    --love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
end

function love.mousepressed(x, y, buttonIndex)
    Ui:mousepressed(x, y, buttonIndex)
end
