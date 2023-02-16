require "src/Plateform"
require "src/Player"

function IsTouch()
    for i = 1, #plateforms do
        if Player.player.pos.x + 70 > plateforms[i].hitbox.x and Player.player.pos.x - 40 < plateforms[i].hitbox.x + plateforms[i].hitbox.w
        and Player.player.pos.y + 18 > plateforms[i].hitbox.y and Player.player.pos.y - 38 < plateforms[i].hitbox.y + plateforms[i].hitbox.h and plateforms[i].type == 0 then
            Player.player.rotation = 0
            return true
        end
        if Player.player.pos.x + 40 > plateforms[i].hitbox.x and Player.player.pos.x - 30 < plateforms[i].hitbox.x + plateforms[i].hitbox.w
        and Player.player.pos.y + 18 > plateforms[i].hitbox.y and Player.player.pos.y - 18 < plateforms[i].hitbox.y + plateforms[i].hitbox.h and plateforms[i].type == 1 then
            MovePlayer.Spawn()
            Player.player.rotation = 0
            Player.player.state = Player.STATETYPE.GROUND
            Timer.reset()
        end
    end
    return false
end
