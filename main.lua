require "src/Button"
require "src/GameActions"
require "src/scene_swap"

function love.load()
    love.window.setMode(1920, 1080)
    love.window.setTitle("Jam Super Héros")

    load_scene_swap()
    Button.load()
end

function love.update(dt)
    if ActualGameState == GameState["Game"] then
        update_scene_swap(dt)
    end
end

function love.draw()
    if ActualGameState == GameState["Menu"] then
        Button.draw()
    end
    if ActualGameState == GameState["Game"] then
        display_scene_swap()
    end
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