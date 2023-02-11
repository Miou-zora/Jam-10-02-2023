function love.load()
    love.window.setMode(1920, 1080)
    love.window.setTitle("Jam Super Héros")
    player_sprite = love.graphics.newImage("Pictures/player.png")
    player = {x = 500, y = 500, size = 50}
    stick = {x = player.x, y = player.y - player.size, size = 50, angle = 0}
    local state = not love.mouse.isVisible()   -- the opposite of whatever it currently is
    love.mouse.setVisible(state)

end

function orientation_stick()
    mouseX, mouseY = love.mouse.getPosition()
    stick.angle = math.atan2(mouseY - player.y, mouseX - player.x)
    stick.x = player.x + player.size * math.cos(stick.angle)
    stick.y = player.y + player.size * math.sin(stick.angle)
end

function love.update(dt)
    if love.keyboard.isDown("up") then
            player.y = player.y - 200 * dt
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + 200 * dt
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - 200 * dt
    end
    if love.keyboard.isDown("right") then
        player.x = player.x + 200 * dt
    end
    orientation_stick()
end

function love.draw()
    love.graphics.rectangle("fill", player.x - player.size/2, player.y - player.size/2, player.size, player.size)
    love.graphics.push()
    love.graphics.translate(stick.x, stick.y)
    love.graphics.rotate(stick.angle)
    love.graphics.rectangle("fill", (-stick.size/4), (-stick.size/4), stick.size, stick.size/2)
    love.graphics.pop()
    love.graphics.draw(player_sprite, player.x - player.size / 2, player.y - player.size / 2)
end
