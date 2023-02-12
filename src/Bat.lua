Bat = {}
local BatFrames = {}
local BatFrame = 1
local BatTime = 0
local BatSpeed = 0.1

function Bat.load()
    for i = 1, 3 do
        BatFrames[i] = love.graphics.newImage("assets/other/Bee_" .. i .. ".png")
    end
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
end

function Bat.draw()
    if BatActive == true then
        love.graphics.setColor(1, 1, 1)
        love.graphics.push()
        love.graphics.draw(BatFrames[BatFrame], 1920 / 2, 1080 / 2, 0, 0.8)
        love.graphics.pop()
    end
end
