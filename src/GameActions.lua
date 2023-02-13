GameActions = {}

GameActions.GameState = {
    Menu = "Menu",
    Option = "Option",
    Game = "Game",
    Pause = "Pause",
    End = "End"
}

function GameActions.load()
    GameState = {
        Menu = "Menu",
        Option = "Option",
        Game = "Game",
        Pause = "Pause",
        End = "End"
    }

    ActualGameState = GameState["Menu"]
    LastGameState = GameState["Menu"]

    BackgroundImage = love.graphics.newImage("assets/background.png")

    PossibleTitle = {
        "Trans",
        "Classic",
        "Asexual",
        "Aromantic",
        "Genderfluid",
        "NonBinary"
    }
    Title = love.graphics.newImage("assets/Title/" ..PossibleTitle[love.math.random(#PossibleTitle)].. ".png")
end

function GameActions.closeGame()
    love.event.quit()
end

function GameActions.setGameStatePause()
    LastGameState = ActualGameState
    ActualGameState = GameState["Pause"]
end

function GameActions.setGameStatePlay()
    LastGameState = ActualGameState
    ActualGameState = GameState["Game"]
end

function GameActions.setGameStateBack()
    temp = ActualGameState
    ActualGameState = LastGameState
    LastGameState = temp
end

function GameActions.setGameStateOption()
    LastGameState = ActualGameState
    ActualGameState = GameState["Option"]
end

function GameActions.setGameStateEnd()
    LastGameState = ActualGameState
    ActualGameState = GameState["End"]
end

function GameActions.setGameStateMenu()
    LastGameState = ActualGameState
    ActualGameState = GameState["Menu"]
end

function GameActions.drawBackground()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(BackgroundImage, 0, 0, 0, 1.5, 1.5)
end

function GameActions.drawTitle()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(Title, 100, -150, 0, 1.2, 1.2)
end