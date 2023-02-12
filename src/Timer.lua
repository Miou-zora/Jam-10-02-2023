Second = 0
Minute = 0
Timer = {}

function Timer.Update(dt)
    if ActualGameState == GameState["Game"] then
        Second = Second + dt
        if Second >= 60 then
            Second = 0
            Minute = Minute + 1
        end
        TIMER = string.format("%d:%02d", Minute, Second)
    end
    if ActualGameState == GameState["Menu"] then
        Timer.reset()
    end
end

function Timer.reset()
    Second = 0
    Minute = 0
end

function Timer.draw()
    love.graphics.print(TIMER, 10, 10)
end
