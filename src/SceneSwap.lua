require "src/MovePlayer"

SceneSwap = {}

function SceneSwap.LoadSceneSwap()
    status_scene = false
end

function SceneSwap.CheckSwapScene()
    if status_scene == true then
        player.y = player.y + 10
        if player.y >= (1080 - player.size) then
            status_scene = false
        end
    end

    if player.y <= 100 then
        status_scene = true
    end
end

function SceneSwap.UpdateSceneSwap(dt)
    MovePlayer.Update(dt)
    SceneSwap.CheckSwapScene()
end

function SceneSwap.DisplaySceneSwap()
    local playerColor = love.graphics.newImage(PlayerColor)
    local playerHat = love.graphics.newImage(PlayerHat)
    local Arrow = love.graphics.newImage("assets/other/ARROW.png")
    love.graphics.setColor(1, 1, 1)
    love.graphics.push()
    love.graphics.translate(stick.x, stick.y)
    love.graphics.rotate(stick.angle)
    love.graphics.draw(Arrow, -stick.size / 2, -stick.size / 2, 0, 0.4)
    love.graphics.pop()
    love.graphics.draw(playerColor, player.x - player.size / 2, player.y - player.size / 2, 0, 0.4)
    love.graphics.draw(playerHat, player.x - player.size / 2, player.y - player.size / 2, 0, 0.4)
end
