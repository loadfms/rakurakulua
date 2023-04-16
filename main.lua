require("ui")

function love.load()
    Ui:load()
end

function love.update(dt)
    Ui:update(dt)
end

function love.draw()
    Ui:draw()
end

function love.mousepressed(x, y, buttonIndex)
    Ui:mousepressed(x, y, buttonIndex)
end
