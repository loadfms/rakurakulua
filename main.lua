require("ui")

function love.conf(t)
    t.window.resizable = true
    t.window.borderless = true
end

function love.load()
    love.window.setMode(800, 600, { resizable = true, borderless = true })

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
