local character = require("character")  -- Carica il modulo del personaggio
local tree_asset = require("tree_asset") -- Carica il modulo dell'albero
local enemy = require("enemy") -- Carica il modulo del nemico
-- Variabili per la telecamera
local camera = {x = 0, y = 0}

function love.update(dt)
    character.update(dt, tree_asset.trees)  -- Chiamata alla funzione di movimento del personaggio

    -- Aggiorna la posizione della telecamera per seguire il personaggio
    camera.x = character.x - love.graphics.getWidth() / 2
    camera.y = character.y - love.graphics.getHeight() / 2
end

function love.draw()
    -- Imposta il colore dello sfondo (colore RGB)
    love.graphics.setColor(0.4, 0, 1)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())  -- Disegna uno sfondo che copre tutto lo schermo

    love.graphics.setColor(1, 1, 1)  -- Imposta il colore del disegno su bianco (default)

    -- Applica la trasformazione della telecamera
    love.graphics.push()
    love.graphics.translate(-camera.x, -camera.y)

    -- Disegna gli alberi
    tree_asset.draw()

    -- Disegna il personaggio
    character.draw()

    -- Rimuove la trasformazione 
    love.graphics.pop()
end
