require "src/enum"

function createRectangle(x, y, w, h)
    local rectangle = {x = x, y = y, w = w, h = h}
    return rectangle
end

function createPlayer()
    local player = {}
    player.hitbox = createRectangle(0, 0, 30, 15)
    player.asset = 0
    player.vector = {x = 0, y = 0}
    player.rotation = 0
    player.orientation = orientationType.right
    player.alive = true
    player.state = stateType.ground
    player.last_moove = true
    return player
end

function createPlateform(x, y, w, h)
    local asset = 0
    local rectangle = {hitbox = createRectangle(x, y, w, h), asset = asset}
    return rectangle
end
