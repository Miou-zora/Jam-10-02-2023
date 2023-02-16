require "src/Player"
DisplayRotation = {}

function DisplayRotation.Player(playerColor)
    local playerWidth = playerColor:getWidth()
    local playerHeight = playerColor:getHeight()

    if Player.player.state == Player.STATETYPE.JUMP then
        love.graphics.draw(playerColor, Player.player.pos.x, Player.player.pos.y, Player.player.rotation, 0.4, 0.4, playerWidth / 2, playerHeight / 2)
    else
        love.graphics.draw(playerColor, Player.player.pos.x, Player.player.pos.y, 0, 0.4, 0.4, playerWidth / 2, playerHeight / 2)
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

    if Player.player.state == Player.STATETYPE.JUMP then
        love.graphics.draw(playerHat, Player.player.pos.x + 10, Player.player.pos.y - 35, Player.player.rotation, 0.7, 0.7, hatWidth / 2, hatHeight / 2)
    else
        love.graphics.draw(playerHat, Player.player.pos.x + 10, Player.player.pos.y - 35, 0, 0.7, 0.7, hatWidth / 2, hatHeight / 2)
    end
end

function DisplayRotation.Horns(playerHat)
    local hatWidth = playerHat:getWidth()
    local hatHeight = playerHat:getHeight()

    if Player.player.state == Player.STATETYPE.JUMP then
        love.graphics.draw(playerHat, Player.player.pos.x - 10, Player.player.pos.y - 25, Player.player.rotation, 0.3, 0.3, hatWidth / 2, hatHeight / 2)
    else
        love.graphics.draw(playerHat, Player.player.pos.x - 10, Player.player.pos.y - 25, 0, 0.3, 0.3, hatWidth / 2, hatHeight / 2)
    end
end

function DisplayRotation.Propel(playerHat)
    local hatWidth = playerHat:getWidth()
    local hatHeight = playerHat:getHeight()

    if Player.player.state == Player.STATETYPE.JUMP then
        love.graphics.draw(playerHat, Player.player.pos.x - 12, Player.player.pos.y - 28, Player.player.rotation, 0.7, 0.7, hatWidth / 2, hatHeight / 2)
    else
        love.graphics.draw(playerHat, Player.player.pos.x - 12, Player.player.pos.y - 28 , 0, 0.7, 0.7, hatWidth / 2, hatHeight / 2)
    end
end

function DisplayRotation.Top(playerHat)
    local hatWidth = playerHat:getWidth()
    local hatHeight = playerHat:getHeight()

    if Player.player.state == Player.STATETYPE.JUMP then
        love.graphics.draw(playerHat, Player.player.pos.x - 10, Player.player.pos.y - 45, Player.player.rotation, 0.6, 0.6, hatWidth / 2, hatHeight / 2)
    else
        love.graphics.draw(playerHat, Player.player.pos.x - 10, Player.player.pos.y - 45, 0, 0.6, 0.6, hatWidth / 2, hatHeight / 2)
    end
end
