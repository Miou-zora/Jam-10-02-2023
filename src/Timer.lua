Timer = {}

function Timer.update(dt)
    if ActualGameState == GameState["Game"] then
        SECOND = SECOND + dt
        if SECOND >= 60 then
            SECOND = 0
            MINUTE = MINUTE + 1
        end
        TIMER = string.format("%d:%02d", MINUTE, SECOND)
    end
    if ActualGameState == GameState["Menu"] then
        Timer.reset()
    end
end

function Timer.reset()
    SECOND = 0
    MINUTE = 0
end

function Timer.draw()
    love.graphics.print(TIMER, 10, 10)
end