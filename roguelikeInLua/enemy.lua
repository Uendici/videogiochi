local enemy = {}

enemy.image = love.graphics.newImage("immagini/alienBlue_stand.png")

enemy.enemies = {
    { x = 400, y = 400, width = 64, height = 64 },
    { x = 600, y = 400, width = 64, height = 64 },
    { x = 800, y = 400, width = 64, height = 64 },
}

function enemy.draw()
    for _, e in ipairs(enemy.enemies) do
        love.graphics.draw(enemy.image, e.x, e.y)
    end
end

return enemy

