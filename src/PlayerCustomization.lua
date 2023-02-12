require "src/GameActions"

PlayerCustomization = {}

function PlayerCustomization.load()
    GameState[#GameState + 1] = "PlayerCustomization"

    PlayerCustomization.Color = {
        Black = "assets/character/Slime_Black_1.png",
        Blue = "assets/character/Slime_Blue_1.png",
        Gray = "assets/character/Slime_Gray_1.png",
        Green = "assets/character/Slime_Green_1.png",
        Red = "assets/character/Slime_Red_1.png"
    }

    PlayerCustomization.hats = {
        Cap = "assets/other/Hat_Cap.png",
        Horns = "assets/other/Hat_Horns.png",
        Propel = "assets/other/Hat_Propel.png",
        Top = "assets/other/Hat_Top.png"
    }

    PlayerHat = PlayerCustomization.hats["Horns"]
    PlayerColor = PlayerCustomization.Color["Blue"]
end

function PlayerCustomization.setGameStatePlayerCustomization()
    LastGameState = ActualGameState
    ActualGameState = GameState["PlayerCustomization"]
end

function PlayerCustomization.incPlayerColor()
    if PlayerColor == PlayerCustomization.Color["Black"] then
        PlayerColor = PlayerCustomization.Color["Blue"]
    elseif PlayerColor == PlayerCustomization.Color["Blue"] then
        PlayerColor = PlayerCustomization.Color["Gray"]
    elseif PlayerColor == PlayerCustomization.Color["Gray"] then
        PlayerColor = PlayerCustomization.Color["Green"]
    elseif PlayerColor == PlayerCustomization.Color["Green"] then
        PlayerColor = PlayerCustomization.Color["Red"]
    elseif PlayerColor == PlayerCustomization.Color["Red"] then
        PlayerColor = PlayerCustomization.Color["Black"]
    end
end

function PlayerCustomization.decrPlayerColor()
    if PlayerColor == PlayerCustomization.Color["Black"] then
        PlayerColor = PlayerCustomization.Color["Red"]
    elseif PlayerColor == PlayerCustomization.Color["Blue"] then
        PlayerColor = PlayerCustomization.Color["Black"]
    elseif PlayerColor == PlayerCustomization.Color["Gray"] then
        PlayerColor = PlayerCustomization.Color["Blue"]
    elseif PlayerColor == PlayerCustomization.Color["Green"] then
        PlayerColor = PlayerCustomization.Color["Gray"]
    elseif PlayerColor == PlayerCustomization.Color["Red"] then
        PlayerColor = PlayerCustomization.Color["Green"]
    end
end

function PlayerCustomization.incPlayerHat()
    if PlayerHat == PlayerCustomization.hats["Cap"] then
        PlayerHat = PlayerCustomization.hats["Horns"]
    elseif PlayerHat == PlayerCustomization.hats["Horns"] then
        PlayerHat = PlayerCustomization.hats["Propel"]
    elseif PlayerHat == PlayerCustomization.hats["Propel"] then
        PlayerHat = PlayerCustomization.hats["Top"]
    elseif PlayerHat == PlayerCustomization.hats["Top"] then
        PlayerHat = PlayerCustomization.hats["Cap"]
    end
end

function PlayerCustomization.decrPlayerHat()
    if PlayerHat == PlayerCustomization.hats["Cap"] then
        PlayerHat = PlayerCustomization.hats["Top"]
    elseif PlayerHat == PlayerCustomization.hats["Horns"] then
        PlayerHat = PlayerCustomization.hats["Cap"]
    elseif PlayerHat == PlayerCustomization.hats["Propel"] then
        PlayerHat = PlayerCustomization.hats["Horns"]
    elseif PlayerHat == PlayerCustomization.hats["Top"] then
        PlayerHat = PlayerCustomization.hats["Propel"]
    end
end

local function PrintBlueLore()
    love.graphics.print("Jammy (Gout myrtille):\nAime la confiture", 500, 800)
end

local function PrintRedLore()
    love.graphics.print("Alapalapala (Gout fruit du dragon):\nVie a Hawaï", 500, 800)
end

local function PrintBlackLore()
    love.graphics.print("Mora (Gout mûre):\nAime l'argent", 500, 800)
end

local function PrintGreenLore()
    love.graphics.print("Zelena (Gout kiwano):\nEst timide", 500, 800)
end

local function PrintGrayLore()
    love.graphics.print("Mhlophe (Gout ramboutan):\nFan de Starwars", 500, 800)
end

function PlayerCustomization.draw()
    local posXMiddle = love.graphics.getWidth() / 2
    local posYMiddle = love.graphics.getHeight() / 2
    local playerColor = love.graphics.newImage(PlayerColor)
    local playerHat = love.graphics.newImage(PlayerHat)

    love.graphics.setColor(1, 1, 1)

    love.graphics.draw(playerColor, posXMiddle - playerColor:getWidth() / 5 * 2, posYMiddle - playerColor:getHeight())
    if PlayerColor == PlayerCustomization.Color["Blue"] then
        PrintBlueLore()
    elseif PlayerColor == PlayerCustomization.Color["Black"] then
        PrintBlackLore()
    elseif PlayerColor == PlayerCustomization.Color["Gray"] then
        PrintGrayLore()
    elseif PlayerColor == PlayerCustomization.Color["Green"] then
        PrintGreenLore()
    elseif PlayerColor == PlayerCustomization.Color["Red"] then
        PrintRedLore()
    end
    if PlayerHat == PlayerCustomization.hats["Cap"] then
        love.graphics.draw(playerHat, posXMiddle - playerHat:getWidth() / 5 * 2, posYMiddle - playerColor:getHeight() - playerHat:getHeight(), 0, 1.5, 1.5)
    elseif PlayerHat == PlayerCustomization.hats["Horns"] then
        love.graphics.draw(playerHat, posXMiddle - playerHat:getWidth() / 5 * 2.5, posYMiddle - playerColor:getHeight() + playerHat:getHeight() * 0.21, 0, 0.5, 0.5)
    elseif PlayerHat == PlayerCustomization.hats["Propel"] then
        love.graphics.draw(playerHat, posXMiddle - playerHat:getWidth() / 5 * 3.6, posYMiddle - playerColor:getHeight() - playerHat:getHeight() * 0.9, 0, 1.5, 1.5)
    elseif PlayerHat == PlayerCustomization.hats["Top"] then
        love.graphics.draw(playerHat, posXMiddle - playerHat:getWidth() / 5 * 3.5, posYMiddle - playerColor:getHeight() - playerHat:getHeight() * 1.25, 0, 1.5, 1.5)
    end
end