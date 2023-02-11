require = "Plateform"

Player = {}

function Player.Load()
    player_sprite = love.graphics.newImage("Pictures/player.png")
    player = {x = 500, y = 500, size = 50}
    stick = {x = player.x, y = player.y - player.size, size = 50, angle = 0}
end

function Player.OrientationStick()
    mouseX, mouseY = love.mouse.getPosition()
    stick.angle = math.atan2(mouseY - player.y, mouseX - player.x)
    stick.x = player.x + player.size * math.cos(stick.angle)
    stick.y = player.y + player.size * math.sin(stick.angle)
end

function Player.Update(dt)
    if love.keyboard.isDown("up") then
        player.y = player.y - 200 * dt
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + 200 * dt
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - 200 * dt
    end
    if love.keyboard.isDown("right") then
        player.x = player.x + 200 * dt
    end
    Player.OrientationStick()
end

function Player.Display()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", player.x - player.size/2, player.y - player.size/2, player.size, player.size)
    if status_scene_swap == Slide_level["OK"] then
        love.graphics.push()
        love.graphics.translate(stick.x, stick.y)
        love.graphics.rotate(stick.angle)
        love.graphics.rectangle("fill", (-stick.size/4), (-stick.size/4), stick.size, stick.size/2)
        love.graphics.pop()
    end
    love.graphics.draw(player_sprite, player.x - player.size / 2, player.y - player.size / 2)
end

SceneSwap = {}

Slide_level = {
    Left = "Left",
    Right = "Right",
    Up = "Up",
    Down = "Down",
    OK = "OK"
}

function SceneSwap.LoadSceneSwap()
    Player.Load()
    status_scene_swap = Slide_level["OK"]
    path = "maps/map_test"
    PL = Plateform.load(path)
end

function SceneSwap.top_level(dt)
    if status_scene_swap == Slide_level["Up"] then
        player.y = player.y + 600 * dt
        for i = 1, #PL do
            PL[i].hitbox.y = PL[i].hitbox.y + 20
        end
        if player.y + player.size > 1070 then
            player.y = 1070 - player.size
            status_scene_swap = Slide_level["OK"]
        end
    end
end

-- function SceneSwap.down_level(dt)
--     if status_scene_swap == Slide_level["Down"] then
--         player.y = player.y - 800 * dt
--         if player.y < 31 then
--             player.y = 30
--             status_scene_swap = Slide_level["OK"]
--         end
--     end
-- end

-- function SceneSwap.left_level(dt)
--     if status_scene_swap == Slide_level["Left"] then
--         player.x = player.x + 800 * dt
--         if player.x + player.size > 1890 then
--             player.x = 1890 - player.size
--             status_scene_swap = Slide_level["OK"]
--         end
--     end
-- end

-- function SceneSwap.right_level(dt)
--     if status_scene_swap == Slide_level["Right"] then
--         player.x = player.x - 800 * dt
--     end
-- end

function SceneSwap.check_swap_level()
    if player.y < 0 then
        status_scene_swap = Slide_level["Up"]
    end
    -- if player.y + player.size > 1080 then
    --     status_scene_swap = Slide_level["Down"]
    -- end
    -- if player.x < 0 then
    --     status_scene_swap = Slide_level["Left"]
    -- end
    -- if player.x + player.size > 1920 then
    --     status_scene_swap = Slide_level["Right"]
    -- end
end

function SceneSwap.UpdateSceneSwap(dt)
    if status_scene_swap == Slide_level["OK"] then
        Player.Update(dt)
    else
        SceneSwap.top_level(dt)
        -- SceneSwap.down_level(dt)
        -- SceneSwap.left_level(dt)
        -- SceneSwap.right_level(dt)
    end
    SceneSwap.check_swap_level()
end

function SceneSwap.DisplaySceneSwap()
    Player.Display()
    Plateform.draw(PL)
end
