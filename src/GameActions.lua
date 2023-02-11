GameActions = {}

GameState = {
    Menu = "Menu",
    Option = "Option",
    Game = "Game",
    Pause = "Pause",
    End = "End"
}

ActualGameState = GameState["Menu"]

LastGameState = GameState["Menu"]

function GameActions.closeGame()
    love.event.quit()
end

function GameActions.setGameStatePause()
    LastGameState = ActualGameState
    ActualGameState = GameState["Pause"]
end

function GameActions.setGameStatePlay()
    LastGameState = ActualGameState
    ActualGameState = GameState["Play"]
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

function GameActions.setGameStateMenu()
    LastGameState = ActualGameState
    ActualGameState = GameState["Menu"]
end