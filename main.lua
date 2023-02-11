require "src/Button"
require "src/Initiation"
require "src/Plateform"
require "src/SceneSwap"
require "src/PlayerCustomization"
require "src/GameActions"

function love.load()
    love.window.setMode(1920, 1080)
    love.window.setTitle("Jam Super Héros")

    SceneSwap.LoadSceneSwap()
    GameActions.load()
    PlayerCustomization.load()
    Button.load()
    path = "maps/map_test"
    plateforms = Plateform.load(path)
end

function love.update(dt)
    SceneSwap.UpdateSceneSwap(dt)
end

function love.draw()
<<<<<<< Updated upstream
    if ActualGameState == GameState["Menu"] then
        Button.draw()
    end
=======
    GameActions.drawBackground()
    Button.draw()
>>>>>>> Stashed changes
    if ActualGameState == GameState["Game"] then
        Plateform.draw(plateforms)
        SceneSwap.DisplaySceneSwap()
        return
    end
    GameActions.drawTitle()
    if ActualGameState == GameState["PlayerCustomization"] then
        PlayerCustomization.draw()
    end
end

function love.mousepressed(x, y, btn, istouch)
    Button.mousepressed(x, y, btn, istouch)
end

function love.mousereleased(x, y, button)
    Button.mousereleased(x, y, button)
end

function love.keypressed(key)
    Button.keypressed(key)
end