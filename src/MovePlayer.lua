require "src/IsTouch"
require "src/PlayerCustomization"
require "src/Sound"
require "src/Player"
require "src/Particules"

Rotate = 0

MovePlayer = {}

MovePlayer.speed = 400

function MovePlayer.Spawn()
    Player.player.pos.x = 1920 / 2
    Player.player.pos.y = 1080 - 150
    leftClickActive = false
end

function MovePlayer.Load()
    Player.player.pos.x = 1920 / 2
    Player.player.pos.y = 1080 - 150
    Player.player.size = {x = 80, y = 80}
    stick = {
        x = Player.player.pos.x,
        y = Player.player.pos.y - Player.player.size.y,
        size = 50,
        angle = 0
    }
end

function MovePlayer.OrientationStick()
    mouseX, mouseY = love.mouse.getPosition()
    stick.angle = math.atan2(mouseY - Player.player.pos.y, mouseX - Player.player.pos.x)
    stick.x = Player.player.pos.x + Player.player.size.x * math.cos(stick.angle)
    stick.y = Player.player.pos.y + Player.player.size.y * math.sin(stick.angle)
end

function MovePlayer.Update(dt)
    MovePlayer.OrientationStick()
    MovePlayer.Move(dt)
end

function MovePlayer.Move(dt)
    if leftClickActive == true then
        for i = 1, 50 do
            local particle = {
                x = love.math.random(Player.player.pos.x - 20, Player.player.pos.x + 20),
                y = love.math.random(Player.player.pos.y - 20, Player.player.pos.y + 20),
                xv = love.math.random(-100, 100),
                yv = love.math.random(-100, 100),
                ttl = love.math.random(0.5, 1.5),
                color = {1, 0.5, 0}
            }
            table.insert(particles, particle)
        end
        table.insert(particles, particle)
        Player.player.pos.x = Player.player.pos.x + MovePlayer.speed * Player.player.vector.x * dt
        Player.player.pos.y = Player.player.pos.y + MovePlayer.speed * Player.player.vector.y * dt
        Player.player.state = Player.STATETYPE.JUMP
        if IsTouch() == true then
            -- love.audio.stop(Sound.Sounds.Collide)
            -- love.audio.play(Sound.Sounds.Collide)
            Player.player.pos.x = Player.player.pos.x - MovePlayer.speed * Player.player.vector.x * dt
            Player.player.pos.y = Player.player.pos.y - MovePlayer.speed * Player.player.vector.y * dt
            Player.player.state = Player.STATETYPE.GROUND
            leftClickActive = false
        end
    end
end

function MovePlayer.SetDirection(x, y, btn)
    local dt = love.timer.getDelta()
    if btn == 2 then
        if not leftClickActive then
            leftClickActive = true
            Rotate = math.atan2(y - Player.player.pos.y, x - Player.player.pos.x)
            Player.player.vector = { x = math.cos(stick.angle), y = math.sin(stick.angle) }
        end
    end
end
