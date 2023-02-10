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
    ActualGameState = LastGameState
end