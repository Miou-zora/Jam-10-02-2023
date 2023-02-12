require "src/Plateform"

function IsTouch()
    for i = 1, #plateforms do
        if player.x + 70 > plateforms[i].hitbox.x and player.x - 40 < plateforms[i].hitbox.x + plateforms[i].hitbox.w
        and player.y + 18 > plateforms[i].hitbox.y and player.y - 38 < plateforms[i].hitbox.y + plateforms[i].hitbox.h and plateforms[i].type == 0 then
            return true
        end
        if player.x + 40 > plateforms[i].hitbox.x and player.x - 30 < plateforms[i].hitbox.x + plateforms[i].hitbox.w
        and player.y + 18 > plateforms[i].hitbox.y and player.y - 18 < plateforms[i].hitbox.y + plateforms[i].hitbox.h and plateforms[i].type == 1 then
            MovePlayer.ReSpawn()
            Timer.reset()
        end
    end
    return false
end
