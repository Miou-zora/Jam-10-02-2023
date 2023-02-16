Player = {}

Player.STATETYPE = {
    GROUND = 0,
    JUMP = 1,
    DEAD = 2
}

Player.ORIENTATIONTYPE = {
    LEFT = 0,
    RIGHT = 1
}

Player.player = {}
Player.player.image = nil
Player.player.pos = {x = 0, y = 0}
Player.player.size = {x = 0, y = 0}
Player.player.verticies = { 0,0 , 0,0,
                            0,0 , 0,0,
                            0,0 , 0,0,
                            0,0 , 0,0
                          }
Player.player.shape = nil
Player.player.hitbox = {pos = Player.player.pos, size = Player.player.size}
Player.player.vector = {x = 0, y = 0}
Player.player.rotation = 0
Player.player.orientation = Player.ORIENTATIONTYPE.RIGHT
Player.player.alive = true
Player.player.state = Player.STATETYPE.GROUND
Player.player.last_moove = true

function Player.Load()
    if Player.player.image ~= nil then
        Player.player.size.x = Player.player.image:getWidth()
        Player.player.size.y = Player.player.image:getHeight()
    else
        Player.player.size.x = 150
        Player.player.size.y = 75
    end
end

function Player.RotateDot(M, O, angle)
    local xM, yM, x, y;
    xM = M.x - O.x;
    yM = M.y - O.y;
    angle = -angle;
    x = xM * math.cos (angle) + yM * math.sin (angle) + O.x;
    y = - xM * math.sin (angle) + yM * math.cos (angle) + O.y;
    return ({x, y});
end

function Player.Update(dt)
    Player.player.hitbox.pos = Player.player.pos
    Player.player.hitbox.size = Player.player.size
    local midSize = {x = 0, y = 0}

    local dotRotation = Player.RotateDot({x = -Player.player.hitbox.size.x / 2 ,y = - Player.player.hitbox.size.y / 2}, midSize, Player.player.rotation)
    Player.player.verticies[15] = dotRotation[1]
    Player.player.verticies[16] = dotRotation[2]
    Player.player.verticies[1] = dotRotation[1]
    Player.player.verticies[2] = dotRotation[2]
    local dotRotation = Player.RotateDot({x = Player.player.hitbox.size.x / 2 ,y = - Player.player.hitbox.size.y / 2}, midSize, Player.player.rotation)
    Player.player.verticies[3] = dotRotation[1]
    Player.player.verticies[4] = dotRotation[2]
    Player.player.verticies[5] = dotRotation[1]
    Player.player.verticies[6] = dotRotation[2]
    local dotRotation = Player.RotateDot({x = Player.player.hitbox.size.x / 2 ,y = Player.player.hitbox.size.y / 2}, midSize, Player.player.rotation)
    Player.player.verticies[7] = dotRotation[1]
    Player.player.verticies[8] = dotRotation[2]
    Player.player.verticies[9] = dotRotation[1]
    Player.player.verticies[10] = dotRotation[2]
    local dotRotation = Player.RotateDot({x = -Player.player.hitbox.size.x / 2 ,y = Player.player.hitbox.size.y / 2}, midSize, Player.player.rotation)
    Player.player.verticies[11] = dotRotation[1]
    Player.player.verticies[12] = dotRotation[2]
    Player.player.verticies[13] = dotRotation[1]
    Player.player.verticies[14] = dotRotation[2]

    Player.player.shape = love.physics.newPolygonShape(Player.player.verticies)
end

function Player.Debug()
    love.graphics.origin()
    love.graphics.setColor(0.5, 1, 0.5, 0.5)
    love.graphics.translate(Player.player.pos.x, Player.player.pos.y)
    love.graphics.polygon("fill", Player.player.verticies)
    love.graphics.origin()
end