

-- main.lua
local character = require("character")  -- Carica il modulo del personaggio

function love.update(dt)
    character.update(dt)  -- Chiamata alla funzione di movimento del personaggio
end

function love.draw()
    -- Imposta il colore dello sfondo (colore RGB)
    love.graphics.setColor(0.4, 0, 1)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())  -- Disegna uno sfondo che copre tutto lo schermo

    love.graphics.setColor(1, 1, 1)  -- Imposta il colore del disegno su bianco (default)
    character.draw()  -- Disegna il personaggio
end
