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

function createPlateform(x, y, scale, path)
    local asset = love.graphics.newImage(path)
    local rectangle = {}
    rectangle.hitbox = createRectangle(x, y, asset:getWidth() * (scale / 100), asset:getHeight() * (scale / 100))
    rectangle.scale = scale
    rectangle.asset = asset
    return rectangle
end
