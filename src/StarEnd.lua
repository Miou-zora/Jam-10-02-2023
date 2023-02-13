require "src/Item"
require "src/IsTouch"
require "src/GameActions"

StarEnd = {Type = "starEnd"}
Item.Types[#Item.Types + 1] = StarEnd


function StarEndUpdate(feather, dt)
    if feather.active == false then
        if Item.CollideWith(feather.hitbox, {pos = {x = player.x, y = player.y}, size = {x = 70, y = 18}}) then
            feather.toDisplay = false
            feather.active = true
            GameActions.setGameStateEnd()
        end
    else
        if leftClickActive == false then
            feather.active = false
            feather.toDisplay = true
        end
        player.v = { x = math.cos(stick.angle), y = math.sin(stick.angle) }
    end
end
function StarEndMouseMoved(feather, x, y, dx, dy, istouch)
end

function StarEnd.New(pos)
    local starEnd = {}
    starEnd.image = love.graphics.newImage("assets/starEnd.png")
    starEnd.pos = pos
    starEnd.hitbox = {pos = pos, size = {x = starEnd.image:getWidth(), y = starEnd.image:getHeight()}}
    starEnd.rotation = 0
    starEnd.scale = {x = 0.5, y = 0.5}
    starEnd.update = StarEndUpdate
    starEnd.toDisplay = true
    starEnd.active = false
    starEnd.type = StarEnd.Type
    starEnd.mouseMoved = StarEndMouseMoved
    return starEnd
end

function StarEnd.Load()
    Item.Append(StarEnd.New({x = 1750,y = -2000}))
end