require "src/GameActions"
require "src/PlayerCustomization"

Button = {}

Button.Font = love.graphics.newFont(love.graphics.getWidth() / 20)
Button.ButtonType = {Classic = "Classic", Slider = "Slider", Arrow = "Arrow"}
Button.AllButtons = {}

function DrawClassicButton(button)
    love.graphics.push()
    love.graphics.setColor(1, 1, 1)
    love.graphics.translate(button.pos.x, button.pos.y)
    love.graphics.rectangle("fill", 0, 0, button.size.x, button.size.y)

    love.graphics.setColor(0, 0, 0)
    love.graphics.draw(button.text, button.size.x / 2 - button.text:getWidth() / 2 , button.size.y / 2 - button.text:getHeight() / 2)
    love.graphics.pop()
end

function DrawSliderButton(button)
    local thickness = button.size.y / 20

    love.graphics.push()
    love.graphics.setColor(1, 1, 1)
    love.graphics.translate(button.pos.x, button.pos.y)
    love.graphics.rectangle("fill", 0, button.size.y / 1.33 - thickness / 2, button.size.x, thickness)
    love.graphics.ellipse("fill", button.reference() * button.size.x, button.size.y / 1.33 - thickness / 2, button.size.y / 5, button.size.y / 5)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(button.text, button.size.x / 2 - button.text:getWidth() / 2 , -button.text:getHeight() / 2)
    love.graphics.pop()
end

function DrawArrowButton(button)
    love.graphics.push()
    love.graphics.origin()
    love.graphics.setColor(1, 1, 1)
    love.graphics.translate(button.pos.x, button.pos.y)
    love.graphics.polygon("fill", button.vertices)
    love.graphics.pop()
end

Button.DrawButtonFunction = {Classic = DrawClassicButton, Slider = DrawSliderButton, Arrow = DrawArrowButton}

function Button.AddButton(button)
    Button.AllButtons[#Button.AllButtons + 1] = button
end

function createClassicButton(pos, size, stringText, action, requireState)
    local button = {}
    button.pos = {x = pos.x, y = pos.y}
    button.size = {x = size.x, y = size.y}
    button.stringText = stringText
    button.text = love.graphics.newText(Button.Font, stringText)
    button.requireState = requireState
    button.action = action
    button.type = Button.ButtonType.Classic
    button.isPressed = false
    return button
end

function createSliderButton(pos, size, stringText, reference, update, requireState)
    local button = {}
    button.pos = pos
    button.size = size
    button.stringText = stringText
    button.text = love.graphics.newText(Button.Font, stringText)
    button.type = Button.ButtonType.Slider
    button.reference = reference
    button.isPressed = false
    button.update = update
    button.requireState = requireState
    return button
end


function createArrowButton(pos, size, action, requireState, rotation)
    local button = {}
    button.pos = {x = pos.x, y = pos.y}
    button.size = {x = size.x, y = size.y}
    button.requireState = requireState
    button.action = action
    button.type = Button.ButtonType.Arrow
    button.isPressed = false
    button.vertices = {}
    if rotation == "left" then
        button.vertices = {button.size.x, 0, 0, button.size.y / 2, button.size.x, button.size.y}
    elseif rotation == "right" then
        button.vertices = {0, 0, button.size.x, button.size.y / 2, 0, button.size.y}
    elseif rotation == "up" then
        button.vertices = {0, button.size.y, button.size.x / 2, 0, button.size.x, button.size.y}
    elseif rotation == "down" then
        button.vertices = {0, 0, button.size.x / 2, button.size.y, button.size.x, 0}
    end
    return button
end


function Button.load()
    local WW = love.graphics.getWidth()
    local WH = love.graphics.getHeight()
    -- Main Menu
    Button.AddButton(createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 3}, {x = WW / 5, y = WH / 15}, "Play", GameActions.setGameStatePlay, GameState["Menu"]))
    Button.AddButton(createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 4}, {x = WW / 5, y = WH / 15}, "Player Custom", PlayerCustomization.setGameStatePlayerCustomization, GameState["Menu"]))
    Button.AddButton(createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 5}, {x = WW / 5, y = WH / 15}, "Options", GameActions.setGameStateOption, GameState["Menu"]))
    Button.AddButton(createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 6}, {x = WW / 5, y = WH / 15}, "Quit", GameActions.closeGame, GameState["Menu"]))

    -- Option
    Button.AddButton(createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 5}, {x = WW / 5, y = WH / 15}, "Back", GameActions.setGameStateBack, GameState["Option"]))

    -- Pause
    Button.AddButton(createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 4}, {x = WW / 5, y = WH / 15}, "Resume", GameActions.setGameStatePlay, GameState["Pause"]))
    Button.AddButton(createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 5}, {x = WW / 5, y = WH / 15}, "Options", GameActions.setGameStateOption, GameState["Pause"]))
    Button.AddButton(createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 6}, {x = WW / 5, y = WH / 15}, "Main Menu", GameActions.setGameStateMenu, GameState["Pause"]))

    -- Player Custom
    Button.AddButton(createArrowButton({x = WW / 2 - WW / 6, y = WH / 8 * 3}, {x = WW / 40, y = WW / 40}, PlayerCustomization.incPlayerHat, GameState["PlayerCustomization"], "left"))
    Button.AddButton(createArrowButton({x = WW / 2 + WW / 6, y = WH / 8 * 3}, {x = WW / 40, y = WW / 40}, PlayerCustomization.decrPlayerHat, GameState["PlayerCustomization"], "right"))
    Button.AddButton(createArrowButton({x = WW / 2 - WW / 6, y = WH / 8 * 4}, {x = WW / 40, y = WW / 40}, PlayerCustomization.incPlayerColor, GameState["PlayerCustomization"], "left"))
    Button.AddButton(createArrowButton({x = WW / 2 + WW / 6, y = WH / 8 * 4}, {x = WW / 40, y = WW / 40}, PlayerCustomization.decrPlayerColor, GameState["PlayerCustomization"], "right"))
    Button.AddButton(createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 5}, {x = WW / 5, y = WH / 15}, "Back", GameActions.setGameStateBack, GameState["PlayerCustomization"]))
end

function Button.draw()
    for i = 1, #Button.AllButtons do
        if Button.AllButtons[i].requireState == ActualGameState then
            Button.DrawButtonFunction[Button.AllButtons[i].type](Button.AllButtons[i])
        end
    end
end

local function isCollide(pos, rect)
    if (pos.x > rect.x and pos.x < rect.x + rect.dx and
        pos.y > rect.y and pos.y < rect.y + rect.dy) then
        return (true)
    else
        return (false)
    end
end

function Button.mousepressed(x, y, btn, istouch)
    for i = 1, #Button.AllButtons do
        if Button.AllButtons[i].requireState == ActualGameState then
            if btn == 1 then
                Button.AllButtons[i].isPressed = true
            end
        end
    end
end

function Button.mousereleased(x, y, btn)
    for i = 1, #Button.AllButtons do
        if Button.AllButtons[i].isPressed then
            if btn == 1 then
                Button.AllButtons[i].isPressed = false
                if isCollide({x = x, y = y}, {x = Button.AllButtons[i].pos.x, y = Button.AllButtons[i].pos.y, dx = Button.AllButtons[i].size.x, dy = Button.AllButtons[i].size.y}) then
                    if Button.AllButtons[i].action ~= nil and Button.AllButtons[i].requireState == ActualGameState then
                        Button.AllButtons[i].action()
                    end
                end
            end
        end
    end
end

function Button.keypressed(key)
    if key == "escape" then
        if ActualGameState == GameState["Game"] then
            GameActions.setGameStatePause()
        elseif ActualGameState == GameState["Pause"] then
            GameActions.setGameStatePlay()
        end
    end
end

function Button.MouseMoved(x, y, dx, dy, istouch)
    for i = 1, #Button.AllButtons do
        if Button.AllButtons[i].requireState == ActualGameState then
            if Button.AllButtons[i].isPressed and Button.AllButtons[i].update ~= nil then
                local value = (x - Button.AllButtons[i].pos.x) / Button.AllButtons[i].size.x
                if value < 0 then
                    value = 0
                elseif value > 1 then
                    value = 1
                end
                Button.AllButtons[i].update(value)
            end
        end
    end
end