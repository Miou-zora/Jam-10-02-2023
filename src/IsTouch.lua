require "src/Plateform"

function IsTouch()
    for i = 1, #plateforms do
        if player.x + 70 > plateforms[i].hitbox.x and player.x - 40 < plateforms[i].hitbox.x + plateforms[i].hitbox.w
        and player.y + 18 > plateforms[i].hitbox.y and player.y - 38 < plateforms[i].hitbox.y + plateforms[i].hitbox.h then
            return true
        end
    end
    return false
end
