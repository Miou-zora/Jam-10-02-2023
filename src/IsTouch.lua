function isTouch()
    for i = 1, #plateforms do
        if player.x + player.size >= plateforms[i].hitbox.x and player.x <= plateforms[i].hitbox.x + plateforms[i].hitbox.w then
            if player.y + player.size >= plateforms[i].hitbox.y and player.y <= plateforms[i].hitbox.y + plateforms[i].hitbox.h then
                return true
            end
        end
    end
    return false
end