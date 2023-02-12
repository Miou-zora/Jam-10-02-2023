Cursor = {}

function Cursor.load()
    cursor = love.mouse.newCursor("assets/other/CRS_HAND.png", 0, 0)
    love.mouse.setCursor(cursor)
end