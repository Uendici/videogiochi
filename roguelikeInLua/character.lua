local character = {}

character.x = 400
character.y = 300
character.speed = 200

character.frames = {  -- Carica i fotogrammi dell'animazione per la destra
    love.graphics.newImage("immagini/ghostRight.png"),  -- Direzione destra
    love.graphics.newImage("immagini/ghost_normalRight.png")  -- Direzione destra
}

character.framesLeft = {  -- Carica i fotogrammi dell'animazione per la sinistra
    love.graphics.newImage("immagini/ghost.png"),  -- Direzione sinistra (girato verso sinistra)
    love.graphics.newImage("immagini/ghost_normal.png")  -- Direzione sinistra (girato verso sinistra)
}

character.currentFrame = 1  -- Indice del fotogramma corrente
character.frameTime = 0.1  -- Tempo per ogni fotogramma (in secondi)
character.timeElapsed = 0  -- Tempo trascorso
character.isMovingLeft = false  -- Flag per determinare se il personaggio si sta muovendo a sinistra
character.isMovingUp = false --flag per determinare se il personaggio si sta muovendo in alto

function character.update(dt)
    -- Movimento del personaggio
    if love.keyboard.isDown('d') then
        character.x = character.x + character.speed * dt
        character.isMovingLeft = false  -- Muoversi verso destra
    elseif love.keyboard.isDown('a') then
        character.x = character.x - character.speed * dt
        character.isMovingLeft = true  -- Muoversi verso sinistra
    end
    if love.keyboard.isDown('s') then
        character.y = character.y + character.speed * dt
        character.isMovingUp = false    -- muoversi verso sopra
    elseif love.keyboard.isDown('w') then
        character.y = character.y - character.speed * dt
        character.isMovingUp = true     -- muoversi verso sotto
    end
    -- Gestione dell'animazione
    character.timeElapsed = character.timeElapsed + dt
    if character.timeElapsed >= character.frameTime then
        -- Passa al fotogramma successivo
        character.currentFrame = character.currentFrame + 1
        if character.currentFrame > #character.frames then
            character.currentFrame = 1  -- Torna al primo fotogramma
        end
        character.timeElapsed = 0  -- Reset del tempo
    end
end

function character.draw()
    -- Disegna il fotogramma corrente in base alla direzione
    if character.isMovingLeft then
        love.graphics.draw(character.framesLeft[character.currentFrame], character.x, character.y)
    else
        love.graphics.draw(character.frames[character.currentFrame], character.x, character.y)
    end
end

return character
