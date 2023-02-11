require "src/Button"

function love.load()
    love.window.setMode(1920, 1080)
    love.window.setTitle("Jam Super Héros")

    Button.load()
end

function love.draw()
    Button.draw()
end

function love.mousepressed(x, y, btn, istouch)
    Button.mousepressed(x, y, btn, istouch)
end

function love.mousereleased(x, y, button)
    Button.mousereleased(x, y, button)
end

function love.mousemoved(x, y, dx, dy)
    Button.mousemoved(x, y, dx, dy)
end

function love.keypressed(key)
    Button.keypressed(key)
end