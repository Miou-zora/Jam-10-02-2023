Bat = {}


Bat.speed = 100

function Bat.load()
    BatFrames = {}
    BatFrame = 1
    BatTime = 0
    BatSpeed = 0.1
    Bat.speed = 100
    BatPlayer = {x = 1920 / 3.7, y = 1080 / 2, direction = 1}
    for i = 1, 3 do
        BatFrames[i] = love.graphics.newImage("assets/other/Bee_" .. i .. ".png")
    end
end

function Bat.SetDirection()
    if BatPlayer.x <= 30 then
        BatPlayer.direction = 1
    elseif BatPlayer.x >= (1920 / 3.8) then
        BatPlayer.direction = -1
    end
end

function Bat.Move(dt)
    Bat.SetDirection()
    BatPlayer.x = BatPlayer.x + Bat.speed * BatPlayer.direction * dt
end

function Bat.Update(dt)
    BatTime = BatTime + dt
    if BatTime > BatSpeed then
        BatTime = 0
        BatFrame = BatFrame + 1
        if BatFrame > 3 then
            BatFrame = 1
        end
    end
    Bat.Move(dt)
end

function Bat.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.push()
    if BatPlayer.direction == -1 then
        love.graphics.draw(BatFrames[BatFrame], BatPlayer.x, BatPlayer.y, 0, 0.8)
    else
        love.graphics.draw(BatFrames[BatFrame], BatPlayer.x, BatPlayer.y, 0, -0.8, 0.8)
    end
    love.graphics.pop()
end
