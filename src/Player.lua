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
Player.player.pos = {x = 0, y = 0}
Player.player.size = {x = 0, y = 0}
Player.player.hitbox = {pos = Player.player.pos, size = Player.player.size}
Player.player.vector = {x = 0, y = 0}
Player.player.rotation = 0
Player.player.orientation = Player.ORIENTATIONTYPE.RIGHT
Player.player.alive = true
Player.player.state = Player.STATETYPE.GROUND
Player.player.last_moove = true
