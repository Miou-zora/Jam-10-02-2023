require "src/GameActions"

Button = {}

local function createClassicButton(pos, size, stringText, action, requireState)
    local button = {}
    button.pos = {x = pos.x, y = pos.y}
    button.size = {x = size.x, y = size.y}
    button.stringText = stringText
    button.text = love.graphics.newText(font, stringText)
    button.requireState = requireState
    button.action = action
    button.type = ButtonType.Classic
    button.isPressed = false
    return button
end

local function createSliderButton(pos, size, stringText, reference, action, update)
    local button = {}
    button.pos = pos
    button.size = size
    button.stringText = stringText
    button.text = love.graphics.newText(font, stringText)
    button.action = action
    button.type = ButtonType.Slider
    button.reference = reference
    button.isPressed = false
    button.update = update
    return button
end

local function DrawClassicButton(button)
    love.graphics.push()
    love.graphics.setColor(1, 1, 1)
    love.graphics.translate(button.pos.x, button.pos.y)
    love.graphics.rectangle("fill", 0, 0, button.size.x, button.size.y)

    love.graphics.setColor(0, 0, 0)
    love.graphics.draw(button.text, button.size.x / 2 - button.text:getWidth() / 2 , button.size.y / 2 - button.text:getHeight() / 2)
    love.graphics.pop()
end

local function DrawSliderButton(button)
    local thickness = button.size.y / 10

    love.graphics.push()
    love.graphics.setColor(1, 1, 1)
    love.graphics.translate(button.pos.x, button.pos.y)
    love.graphics.rectangle("fill", 0, button.size.y / 1.33 - thickness / 2, button.size.x, thickness)

    love.graphics.ellipse("fill", button.reference() * button.size.x, button.size.y / 1.33 - thickness / 2, button.size.y, button.size.y)

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(button.text, button.size.x / 2 - button.text:getWidth() / 2 , - button.size.y * 2)
    love.graphics.pop()
end

function Button.load()
    local WW = love.graphics.getWidth()
    local WH = love.graphics.getHeight()

    font = love.graphics.newFont(WW / 50)

    ButtonType = {Classic = "Classic", Slider = "Slider"}
    DrawButtonFunction = {Classic = DrawClassicButton, Slider = DrawSliderButton}

    ButtonType = {Classic = "Classic", Slider = "Slider"}

    AllButtons = {}
    AllButtons[1] = createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 2}, {x = WW / 5, y = WH / 15}, "Play", GameActions.setGameStatePlay, GameState["Menu"])
    AllButtons[2] = createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 3}, {x = WW / 5, y = WH / 15}, "Player Custom", nil, GameState["Menu"])
    AllButtons[3] = createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 4}, {x = WW / 5, y = WH / 15}, "Option", GameActions.setGameStatePause, GameState["Menu"])
    AllButtons[4] = createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 5}, {x = WW / 5, y = WH / 15}, "Quit", GameActions.closeGame, GameState["Menu"])
    AllButtons[5] = createClassicButton({x = WW / 2 - WW / 10, y = WH / 8 * 4}, {x = WW / 5, y = WH / 15}, "Back", GameActions.setGameStateBack, GameState["Pause"])
end

function Button.draw()
    for i = 1, #AllButtons do
        if AllButtons[i].requireState == ActualGameState then
            DrawButtonFunction[AllButtons[i].type](AllButtons[i])
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
    for i = 1, #AllButtons do
        if AllButtons[i].requireState == ActualGameState then
            if btn == 1 then
                AllButtons[i].isPressed = true
            end
        end
    end
end

function Button.mousereleased(x, y, btn)
    for i = 1, #AllButtons do
        if AllButtons[i].requireState == ActualGameState and AllButtons[i].isPressed then
            if btn == 1 then
                if isCollide({x = x, y = y}, {x = AllButtons[i].pos.x, y = AllButtons[i].pos.y, dx = AllButtons[i].size.x, dy = AllButtons[i].size.y}) then
                    AllButtons[i].isPressed = false
                    if AllButtons[i].action ~= nil then
                        AllButtons[i].action()
                    end
                end
            end
        end
    end
end

function Button.mousemoved(x, y, dx, dy)
    -- if (button.isPressed and button.type == ButtonType.Slider) then
        -- button.update(button, x, y)
    -- end
end

function Button.keypressed(key)
    -- if key == "escape" then
    --     if gaming then
    --         gaming = false
    --         openAllButton()
    --     else
    --         gaming = true
    --         closeAllButton()
    --     end
    -- end
end
