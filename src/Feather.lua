require "src/Item"
require "src/IsTouch"

Feather = {Type = "feather"}
Item.Types[#Item.Types + 1] = Feather

function FeatherUpdate(feather, dt)
end

function FeatherMouseMoved(feather, x, y, dx, dy, istouch)
    if feather.active == false then
        if Item.CollideWith(feather.hitbox, {pos = {x = player.x, y = player.y}, size = {x = 70, y = 18}}) then
            feather.toDisplay = false
            feather.active = true
        end
    else
        if leftClickActive == false then
            feather.active = false
            feather.toDisplay = true
        end
        player.v = { x = math.cos(stick.angle), y = math.sin(stick.angle) }
    end
end

function Feather.New(pos)
    local feather = {}
    feather.image = love.graphics.newImage("assets/Feather1.png")
    feather.pos = pos
    feather.hitbox = {pos = pos, size = {x = feather.image:getWidth(), y = feather.image:getHeight()}}
    feather.rotation = 0
    feather.scale = {x = 1.5, y = 1.5}
    feather.update = FeatherUpdate
    feather.toDisplay = true
    feather.active = false
    feather.type = Feather.Type
    feather.mouseMoved = FeatherMouseMoved
    return feather
end

function Feather.Load()
    Item.Append(Feather.New({x = 200,y = 200}))
end