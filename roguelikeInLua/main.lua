local x, y = 300, 300  -- Posizione iniziale
local speed = 200      -- Velocità di movimento

function love.load()
    love.graphics.setBackgroundColor(0.1, 0.1, 0.1) -- Colore di sfondo
end

function love.update(dt)
    if love.keyboard.isDown("up") then
        y = y - speed * dt
    end
    if love.keyboard.isDown("down") then
        y = y + speed * dt
    end
    if love.keyboard.isDown("left") then
        x = x - speed * dt
    end
    if love.keyboard.isDown("right") then
        x = x + speed * dt
    end
end

function love.draw()
    love.graphics.setColor(1, 0, 0)  -- Colore rosso
    love.graphics.circle("fill", x, y, 50)
end
