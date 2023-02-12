require "src/MovePlayer"
require "src/PlayerCustomization"
require "src/DisplayRotation"

SceneSwap = {}

Slide_level = {
    Up = "Up",
    Down = "Down",
    OK = "OK"
}

function SceneSwap.LoadSceneSwap()
    status_scene_swap = Slide_level["OK"]
    value_top_down = 1080
    value_player = 1040
    path = "maps/map_simple"
    PL = Plateform.load(path)
end

function SceneSwap.SlidePlayerTop()
    if (value_player ~= 0) then
        player.y = player.y + 40
        value_player = value_player - 40
    end
end

function SceneSwap.SlideTop()
    if (value_top_down ~= 0) then
        for i = 1, #PL do
            plateforms[i].hitbox.y = plateforms[i].hitbox.y + 45
        end
        value_top_down = value_top_down - 45
    end
end

function SceneSwap.TopLevel(dt)
    if status_scene_swap == Slide_level["Up"] then
        SceneSwap.SlidePlayerTop()
        SceneSwap.SlideTop()
        if value_player == 0 and value_top_down == 0 then
            status_scene_swap = Slide_level["OK"]
            value_player = 1040
            value_top_down = 1080
        end
    end
end

function SceneSwap.SlidePlayerDown()
    if (value_player ~= 0) then
        player.y = player.y - 40
        value_player = value_player - 40
    end
end

function SceneSwap.SlideDown()
    if (value_top_down ~= 0) then
        for i = 1, #PL do
            plateforms[i].hitbox.y = plateforms[i].hitbox.y - 45
        end
        value_top_down = value_top_down - 45
    end
end

function SceneSwap.DownLevel(dt)
    if status_scene_swap == Slide_level["Down"] then
        SceneSwap.SlidePlayerDown()
        SceneSwap.SlideDown()
        if value_player == 0 and value_top_down == 0 then
            status_scene_swap = Slide_level["OK"]
            value_player = 1040
            value_top_down = 1080
        end
    end
end

function SceneSwap.CheckSwapScene()
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
        SceneSwap.TopLevel(dt)
        SceneSwap.DownLevel(dt)
    end
    SceneSwap.CheckSwapScene()
end

function SceneSwap.DisplayPlayer()
    local playerColor = love.graphics.newImage(PlayerColor)
    local playerHat = love.graphics.newImage(PlayerHat)
    
    DisplayRotation.Player(playerColor)
    if PlayerHat == PlayerCustomization.hats["Cap"] then
        DisplayRotation.Cap(playerHat)
    elseif PlayerHat == PlayerCustomization.hats["Horns"] then
        DisplayRotation.Horns(playerHat)
    elseif PlayerHat == PlayerCustomization.hats["Propel"] then
        DisplayRotation.Propel(playerHat)
    elseif PlayerHat == PlayerCustomization.hats["Top"] then
        DisplayRotation.Top(playerHat)
    end
end

function SceneSwap.DisplaySceneSwap()
    local Arrow = love.graphics.newImage("assets/other/ARROW.png")
    love.graphics.setColor(1, 1, 1)
    love.graphics.push()
    love.graphics.translate(stick.x, stick.y)
    love.graphics.rotate(stick.angle)
    love.graphics.draw(Arrow, -stick.size / 2, -stick.size / 2, 0, 0.4)
    love.graphics.pop()
    SceneSwap.DisplayPlayer()
end
