local character = {}

character.x = 400
character.y = 300
character.width = 51  -- Larghezza della hitbox del personaggio
character.height = 73 -- Altezza della hitbox del personaggio
character.speed = 2000

character.frames = {  
    love.graphics.newImage("immagini/ghostRight.png"),
    love.graphics.newImage("immagini/ghost_normalRight.png")
}

character.framesLeft = {  
    love.graphics.newImage("immagini/ghost.png"),
    love.graphics.newImage("immagini/ghost_normal.png")
}

character.currentFrame = 1
character.frameTime = 0.1
character.timeElapsed = 0
character.isMovingLeft = false
character.isMovingUp = false

-- Funzione per verificare le collisioni
function character.checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and
           x2 < x1 + w1 and
           y1 < y2 + h2 and
           y2 < y1 + h1
end

function character.update(dt, trees)
    -- Movimento del personaggio
    local oldX, oldY = character.x, character.y

    if love.keyboard.isDown('d') then
        character.x = character.x + character.speed * dt
        character.isMovingLeft = false
    elseif love.keyboard.isDown('a') then
        character.x = character.x - character.speed * dt
        character.isMovingLeft = true
    end

    if love.keyboard.isDown('s') then
        character.y = character.y + character.speed * dt
        character.isMovingUp = false
    elseif love.keyboard.isDown('w') then
        character.y = character.y - character.speed * dt
        character.isMovingUp = true
    end

    -- Controllo delle collisioni con gli alberi
    for _, tree in ipairs(trees) do
        if character.checkCollision(character.x, character.y, character.width, character.height, tree.x, tree.y, tree.width, tree.height) then
            -- Se c'è una collisione, ripristina la posizione precedente
            character.x = oldX
            character.y = oldY
            break
        end
    end

    -- Gestione dell'animazione
    character.timeElapsed = character.timeElapsed + dt
    if character.timeElapsed >= character.frameTime then
        character.currentFrame = character.currentFrame + 1
        if character.currentFrame > #character.frames then
            character.currentFrame = 1
        end
        character.timeElapsed = 0
    end
end

function character.drawCoordinates()
    love.graphics.setColor(1, 1, 1) -- Imposta il colore a bianco
    love.graphics.print("X: " .. math.floor(character.x) .. " Y: " .. math.floor(character.y), 10, 10)
end


function character.draw()
    -- Disegna il fotogramma corrente in base alla direzione
    if character.isMovingLeft then
        love.graphics.draw(character.framesLeft[character.currentFrame], character.x, character.y)
    else
        love.graphics.draw(character.frames[character.currentFrame], character.x, character.y)
    end

    -- Disegna le coordinate nell'angolo dello schermo
    character.drawCoordinates()
end


return character
