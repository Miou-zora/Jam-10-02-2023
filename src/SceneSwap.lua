require = "Plateform"
require "src/MovePlayer"

SceneSwap = {}

Slide_level = {
    Up = "Up",
    Down = "Down",
    OK = "OK"
}

function SceneSwap.LoadSceneSwap()
    Player.Load()
    status_scene_swap = Slide_level["OK"]
    path = "maps/map_test"
    PL = Plateform.load(path)
    value_top_down = 1080
    value_player = 1040
end

function SceneSwap.slide_player_top()
    if (value_player ~= 0) then
        player.y = player.y + 10
        value_player = value_player - 10
    end
end

function SceneSwap.slide_top(plateforms)
    if (value_top_down ~= 0) then
        for i = 1, #PL do
            plateforms[i].hitbox.y = plateforms[i].hitbox.y + 10
        end
        value_top_down = value_top_down - 10
    end
end

function SceneSwap.top_level(dt)
    if status_scene_swap == Slide_level["Up"] then
        SceneSwap.slide_player_top()
        SceneSwap.slide_top(PL)
        if value_player == 0 and value_top_down == 0 then
            status_scene_swap = Slide_level["OK"]
            value_player = 1040
            value_top_down = 1080
        end
    end
end

function SceneSwap.slide_player_down()
    if (value_player ~= 0) then
        player.y = player.y - 10
        value_player = value_player - 10
    end
end

function SceneSwap.slide_down(plateforms)
    if (value_top_down ~= 0) then
        for i = 1, #PL do
            plateforms[i].hitbox.y = plateforms[i].hitbox.y - 10
        end
        value_top_down = value_top_down - 10
    end
end

function SceneSwap.down_level(dt)
    if status_scene_swap == Slide_level["Down"] then
        SceneSwap.slide_player_down()
        SceneSwap.slide_down(PL)
        if value_player == 0 and value_top_down == 0 then
            status_scene_swap = Slide_level["OK"]
            value_player = 1040
            value_top_down = 1080
        end
    end
end

function SceneSwap.check_swap_level()
    if player.y < 0 then
        status_scene_swap = Slide_level["Up"]
    end
    if player.y > 1080 then
        status_scene_swap = Slide_level["Down"]
    end
end

function SceneSwap.UpdateSceneSwap(dt)
    if status_scene_swap == Slide_level["OK"] then
        MovePlayer.Update(dt)
    else
        SceneSwap.top_level(dt)
        SceneSwap.down_level(dt)
    end
    SceneSwap.check_swap_level()
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
