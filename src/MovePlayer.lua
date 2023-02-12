require "src/IsTouch"
require "src/PlayerCustomization"

MovePlayer = {}

function MovePlayer.Load()
    player = {x = 300, y = 300, size = 80}
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
        if IsTouch() == true then
            player.x = player.x - speed * player.v.x * dt
            player.y = player.y - speed * player.v.y * dt
            leftClickActive = false
        end
    end
end

function MovePlayer.SetDirection(x, y, btn)
    local dt = love.timer.getDelta()

    if btn == 2 then
        if not leftClickActive then
            leftClickActive = true
            player.v = { x = math.cos(stick.angle), y = math.sin(stick.angle) }
        end
    end
end
