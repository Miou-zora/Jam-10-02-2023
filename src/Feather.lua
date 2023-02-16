require "src/Item"
require "src/Player"

Feather = {Type = "feather"}
Item.AddType(Feather)

local function FeatherMouseMoved(feather, x, y, dx, dy, istouch)
    if feather.active == false then
        if Item.CollideWith(feather.hitbox, Player.player.hitbox) then
            feather.toDisplay = false
            feather.active = true
        end
    else
        if leftClickActive == false then
            feather.active = false
            feather.toDisplay = true
        end
        Player.player.vector.x = math.cos(stick.angle)
        Player.player.vector.y = math.sin(stick.angle)
        Player.player.rotation = stick.angle
    end
end

function Feather.RotateDot(M, O, angle)
    local xM, yM, x, y;
    xM = M.x - O.x;
    yM = M.y - O.y;
    angle = -angle;
    x = xM * math.cos (angle) + yM * math.sin (angle) + O.x;
    y = - xM * math.sin (angle) + yM * math.cos (angle) + O.y;
    return ({x, y});
end

local function Update(feather, dt)
    feather.verticies[1] = -feather.hitbox.size.x / 2 * feather.scale.x
    feather.verticies[2] = -feather.hitbox.size.y / 2 * feather.scale.y
    feather.verticies[3] = -feather.hitbox.size.x / 2 * feather.scale.x
    feather.verticies[4] = feather.hitbox.size.y / 2 * feather.scale.y
    feather.verticies[5] = -feather.hitbox.size.x / 2 * feather.scale.x
    feather.verticies[6] = feather.hitbox.size.y / 2 * feather.scale.y
    feather.verticies[7] = feather.hitbox.size.x / 2 * feather.scale.x
    feather.verticies[8] = feather.hitbox.size.y / 2 * feather.scale.y
    feather.verticies[9] = feather.hitbox.size.x / 2 * feather.scale.x
    feather.verticies[10] = feather.hitbox.size.y / 2 * feather.scale.y
    feather.verticies[11] = feather.hitbox.size.x / 2 * feather.scale.x
    feather.verticies[12] = -feather.hitbox.size.y / 2 * feather.scale.y
    feather.verticies[13] = feather.hitbox.size.x / 2 * feather.scale.x
    feather.verticies[14] = -feather.hitbox.size.y / 2 * feather.scale.y
    feather.verticies[15] = -feather.hitbox.size.x / 2 * feather.scale.x
    feather.verticies[16] = -feather.hitbox.size.y / 2 * feather.scale.y

    feather.shape = love.physics.newPolygonShape(feather.verticies)
end

function Feather.New(pos)
    local feather = {}
    feather.image = love.graphics.newImage("assets/Feather1.png")
    feather.pos = pos
    feather.hitbox = {pos = pos, size = {x = feather.image:getWidth(), y = feather.image:getHeight()}}
    feather.verticies = { 0,0 , 0,0,
                          0,0 , 0,0,
                          0,0 , 0,0,
                          0,0 , 0,0
                        }
    feather.shape = nil
    feather.rotation = 0
    feather.scale = {x = 1.5, y = 1.5}
    feather.update = Update
    feather.toDisplay = true
    feather.active = false
    feather.type = Feather.Type
    feather.mouseMoved = FeatherMouseMoved
    return feather
end

function Feather.Load()
    Item.Append(Feather.New({x = 200,y = 200}))
end
