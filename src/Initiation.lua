require "src/enum"

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
