MovePlayer = {}

function MovePlayer.Load()
    player_sprite = love.graphics.newImage("Pictures/player.png")
    player = {x = 500, y = 500, size = 50}
    stick = {x = player.x, y = player.y - player.size, size = 50, angle = 0}
    speed = 100
    leftClickActive = false
end

function MovePlayer.OrientationStick()
    mouseX, mouseY = love.mouse.getPosition()
    stick.angle = math.atan2(mouseY - player.y, mouseX - player.x)
    stick.x = player.x + player.size * math.cos(stick.angle)
    stick.y = player.y + player.size * math.sin(stick.angle)
end

function MovePlayer.Update(dt)
    MovePlayer.OrientationStick()
    MovePlayer.Move(dt)
end

function MovePlayer.Move(dt)
    if leftClickActive == true then
        player.x = player.x + speed * player.v.x * dt
        player.y = player.y + speed * player.v.y * dt
        if player.x < 0 or player.x > love.graphics.getWidth() or player.y < 0 or player.y > love.graphics.getHeight() then
            player.x = player.x - speed * player.v.x * dt
            player.y = player.y - speed * player.v.y * dt
            leftClickActive = false
        end
    end
end

function MovePlayer.SetDirection(x, y, btn)
    local speed = 100
    local dt = love.timer.getDelta()

    if btn == 2 then
        if not leftClickActive then
            leftClickActive = true
            player.v = { x = math.cos(stick.angle), y = math.sin(stick.angle) }
        end
    else
        leftClickActive = false
    end
end
