require "src/MovePlayer"

SceneSwap = {}

function SceneSwap.LoadSceneSwap()
    border_l = {x = 0, y = 0, width = 100, height = 1080}
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
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", border_l.x, border_l.y, border_l.width, border_l.height)
    love.graphics.rectangle("fill", player.x - player.size/2, player.y - player.size/2, player.size, player.size)
    love.graphics.push()
    love.graphics.translate(stick.x, stick.y)
    love.graphics.rotate(stick.angle)
    love.graphics.rectangle("fill", (-stick.size/4), (-stick.size/4), stick.size, stick.size/2)
    love.graphics.pop()
    love.graphics.draw(player_sprite, player.x - player.size / 2, player.y - player.size / 2)
end
