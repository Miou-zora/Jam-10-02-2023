function load_scene_swap()
    player_sprite = love.graphics.newImage("Pictures/player.png")
    player = {x = 500, y = 500, size = 50}
    stick = {x = player.x, y = player.y - player.size, size = 50, angle = 0}
    -- local state = not love.mouse.isVisible()   -- the opposite of whatever it currently is
    -- love.mouse.setVisible(state)
    border_l = {x = 0, y = 0, width = 100, height = 1080}
    status_scene = false
    dash = false
end

function orientation_stick()
    mouseX, mouseY = love.mouse.getPosition()
    stick.angle = math.atan2(mouseY - player.y, mouseX - player.x)
    stick.x = player.x + player.size * math.cos(stick.angle)
    stick.y = player.y + player.size * math.sin(stick.angle)
end

function check_swap_scene()
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

function update_scene_swap(dt)
    local dashDuration = 0.5
    local dashTime = 0
    if status_scene == false then
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
    end
    if love.keyboard.isDown("x") then
        dash = true
        if dashTime < dashDuration then
            player.x = mouseX + 3000 * dt
            player.y = mouseY + 3000 * dt
        else
            dashTime = 0
        end
    else
        orientation_stick()
    end
    check_swap_scene()
end

function display_scene_swap()
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
