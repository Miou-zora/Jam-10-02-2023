require "src/Button"
require "src/Initiation"
require "src/Plateform"
require "src/SceneSwap"
require "src/MovePlayer"
require "src/PlayerCustomization"
require "src/GameActions"
require "src/Bat"
require "src/Particules"
require "src/Cursor"
require "src/Timer"

SECOND = 0
MINUTE = 0

function love.load()
    love.window.setMode(1920, 1080)
    love.window.setTitle("Jam Super Héros")

    Cursor.load()
    SceneSwap.LoadSceneSwap()
    GameActions.load()
    PlayerCustomization.load()
    MovePlayer.Load()
    Button.load()
    Bat.load()
    path = "maps/map_simple"
    plateforms = Plateform.load(path)
    SceneSwap.LoadSceneSwap(plateforms)
end

function love.update(dt)
    SceneSwap.UpdateSceneSwap(dt)
    MovePlayer.Update(dt)
    Bat.Update(dt)
    Particle.Update(dt)
    Timer.update(dt)
end

function love.draw()

    GameActions.drawBackground()
    Button.draw()
    if ActualGameState == GameState["Game"] then
        love.mouse.setVisible(false)
        Plateform.draw(plateforms)
        SceneSwap.DisplaySceneSwap()
        Particle.draw()
        Timer.draw()
    else
        Bat.draw()
        GameActions.drawTitle()
        love.mouse.setVisible(true)
        GameActions.drawTitle()
        if ActualGameState == GameState["Menu"] then
            Credit.draw()
        end
        if ActualGameState == GameState["PlayerCustomization"] then
            PlayerCustomization.draw()
        end
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
