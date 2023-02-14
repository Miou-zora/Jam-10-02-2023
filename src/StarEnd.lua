require "src/Item"
require "src/IsTouch"
require "src/GameActions"

StarEnd = {Type = "starEnd"}
Item.AddType(StarEnd)


function StarEndUpdate(star, dt)
    if star.active == false then
        if Item.CollideWith(star.hitbox, Player.player.hitbox) then
            GameActions.setGameStateEnd()
        end
    end
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
    starEnd.mouseMoved = nil
    return starEnd
end

function StarEnd.Load()
    Item.Append(StarEnd.New({x = 1750,y = -2000}))
end