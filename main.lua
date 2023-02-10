function love.load()
    love.window.setMode(1920, 1080)
    love.window.setTitle("Jam Super Héros")
    love.graphics.setBackgroundColor(255/255, 200/255, 40/255, 127/255)
    myImage = love.graphics.newImage("Pictures/luffy.png")
end

function love.draw()
    love.graphics.draw(myImage, 100, 100)
end

function display_text()
    love.graphics.draw("text")
end
