Particle = {}
particles = {}

function Particle.Update(dt)
    if love.keyboard.isDown("space") then
        for i = 1, 100 do
            local particle = {
                x = love.math.random(0, 1920),
                y = love.math.random(0, 1080),
                xv = love.math.random(-100, 100),
                yv = love.math.random(-100, 100),
                ttl = love.math.random(0.5, 1)
            }
            table.insert(particles, particle)
        end
    end
    for i, particle in ipairs(particles) do
        particle.x = particle.x + particle.xv * dt
        particle.y = particle.y + particle.yv * dt
        particle.ttl = particle.ttl - dt
        if particle.ttl <= 0 then
            table.remove(particles, i)
        end
    end
end

function Particle.draw()
    for _, particle in ipairs(particles) do
        love.graphics.setColor(1, 1, 1)
        love.graphics.points(particle.x, particle.y)
    end
end