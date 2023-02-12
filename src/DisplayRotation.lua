
DisplayRotation = {}

function DisplayRotation.Player(playerColor)
    local playerWidth = playerColor:getWidth()
    local playerHeight = playerColor:getHeight()

    if player.state == stateType.jump then
        love.graphics.draw(playerColor, player.x, player.y, Rotate, 0.4, 0.4, playerWidth / 2, playerHeight / 2)
    else
        love.graphics.draw(playerColor, player.x, player.y, 0, 0.4, 0.4, playerWidth / 2, playerHeight / 2)
    end
end

function DisplayRotation.Hat(playerHat)
    if PlayerHat == PlayerCustomization.hats["Cap"] then
        DisplayRotation.Cap(playerHat)
    elseif PlayerHat == PlayerCustomization.hats["Horns"] then
        DisplayRotation.Horns(playerHat)
    elseif PlayerHat == PlayerCustomization.hats["Propel"] then
        DisplayRotation.Propel(playerHat)
    elseif PlayerHat == PlayerCustomization.hats["Top"] then
        DisplayRotation.Top(playerHat)
    end
end

function DisplayRotation.Cap(playerHat)
    local hatWidth = playerHat:getWidth()
    local hatHeight = playerHat:getHeight()

    if player.state == stateType.jump then
        love.graphics.draw(playerHat, player.x + 10, player.y - 35, Rotate, 0.7, 0.7, hatWidth / 2, hatHeight / 2)
    else
        love.graphics.draw(playerHat, player.x + 10, player.y - 35, 0, 0.7, 0.7, hatWidth / 2, hatHeight / 2)
    end
end

function DisplayRotation.Horns(playerHat)
    local hatWidth = playerHat:getWidth()
    local hatHeight = playerHat:getHeight()

    if player.state == stateType.jump then
        love.graphics.draw(playerHat, player.x - 10, player.y - 25, Rotate, 0.3, 0.3, hatWidth / 2, hatHeight / 2)
    else
        love.graphics.draw(playerHat, player.x - 10, player.y - 25, 0, 0.3, 0.3, hatWidth / 2, hatHeight / 2)
    end
end

function DisplayRotation.Propel(playerHat)
    local hatWidth = playerHat:getWidth()
    local hatHeight = playerHat:getHeight()

    if player.state == stateType.jump then
        love.graphics.draw(playerHat, player.x - 12, player.y - 28, Rotate, 0.7, 0.7, hatWidth / 2, hatHeight / 2)
    else
        love.graphics.draw(playerHat, player.x - 12, player.y - 28 , 0, 0.7, 0.7, hatWidth / 2, hatHeight / 2)
    end
end

function DisplayRotation.Top(playerHat)
    local hatWidth = playerHat:getWidth()
    local hatHeight = playerHat:getHeight()

    if player.state == stateType.jump then
        love.graphics.draw(playerHat, player.x - 10, player.y - 45, Rotate, 0.6, 0.6, hatWidth / 2, hatHeight / 2)
    else
        love.graphics.draw(playerHat, player.x - 10, player.y - 45, 0, 0.6, 0.6, hatWidth / 2, hatHeight / 2)
    end
end
