require "src/Button"
require "src/Initiation"
require "src/Plateform"
require "src/SceneSwap"
require "src/MovePlayer"
require "src/PlayerCustomization"
require "src/GameActions"

function love.load()
    love.window.setMode(1920, 1080)
    love.window.setTitle("Jam Super Héros")

    SceneSwap.LoadSceneSwap()
    GameActions.load()
    PlayerCustomization.load()
    MovePlayer.Load()
    Button.load()
    path = "maps/map_simple"
    plateforms = Plateform.load(path)
    SceneSwap.LoadSceneSwap(plateforms)
end

function love.update(dt)
    SceneSwap.UpdateSceneSwap(dt)
    MovePlayer.Update(dt)
end

function love.draw()

    GameActions.drawBackground()
    Button.draw()
    if ActualGameState == GameState["Game"] then
        love.mouse.setVisible(false)
        Plateform.draw(plateforms)
        SceneSwap.DisplaySceneSwap()
        return
    else
        love.mouse.setVisible(true)
    end
    GameActions.drawTitle()
    if ActualGameState == GameState["PlayerCustomization"] then
        PlayerCustomization.draw()
    end
    if ActualGameState == GameState["PlayerCustomization"] then
        PlayerCustomization.draw()
    end
end

function love.mousepressed(x, y, btn, istouch)
    Button.mousepressed(x, y, btn, istouch)
    MovePlayer.SetDirection(x, y, btn)
end

function love.mousereleased(x, y, button)
    Button.mousereleased(x, y, button)
end

function love.keypressed(key)
    Button.keypressed(key)
end