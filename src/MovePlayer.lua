require "src/IsTouch"
require "src/PlayerCustomization"
require "src/Sound"
require "src/Particules"

Rotate = 0

MovePlayer = {}

MovePlayer.speed = 400

function MovePlayer.ReSpawn()
    player.x = 1920 / 2
    player.y = 1080 - 150
    leftClickActive = false
end

function MovePlayer.Load()
    player = {x = 1920 / 2, y = 1080 - 150, size = 80}
    stick = {x = player.x, y = player.y - player.size, size = 50, angle = 0}
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
        for i = 1, 50 do
            local particle = {
                x = love.math.random(player.x - 20, player.x + 20),
                y = love.math.random(player.y - 20, player.y + 20),
                xv = love.math.random(-100, 100),
                yv = love.math.random(-100, 100),
                ttl = love.math.random(0.5, 1.5),
                color = {1, 0.5, 0}
            }
            table.insert(particles, particle)
        end
        table.insert(particles, particle)
        player.x = player.x + MovePlayer.speed * player.v.x * dt
        player.y = player.y + MovePlayer.speed * player.v.y * dt
        player.state = stateType.jump
        if IsTouch() == true then
            love.audio.stop(Sound.Sounds.Collide)
            love.audio.play(Sound.Sounds.Collide)
            player.x = player.x - MovePlayer.speed * player.v.x * dt
            player.y = player.y - MovePlayer.speed * player.v.y * dt
            player.state = stateType.ground
            leftClickActive = false
        end
    end
end

function MovePlayer.SetDirection(x, y, btn)
    local dt = love.timer.getDelta()
    if btn == 2 then
        if not leftClickActive then
            leftClickActive = true
            Rotate = math.atan2(y - player.y, x - player.x)
            player.v = { x = math.cos(stick.angle), y = math.sin(stick.angle) }
        end
    end
end
