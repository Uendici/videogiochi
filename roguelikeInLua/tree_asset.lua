local tree_asset = {}

-- Carica l'immagine dell'albero
tree_asset.image = love.graphics.newImage("immagini/alberi-di-pixel-cartoon-8-bit-retro-gioco-natura-pianta-e-ambiente-oggetto-video-gioco-sprite-asset-insieme-isolato-di-elementi-di-paesaggio-di-foresta-vettoriale-2j81mwy.jpg")

-- Definizione di una lista di alberi
tree_asset.trees = {
    { x = 100, y = 200, width = 178, height = 169 },
    { x = 600, y = 200, width = 179, height = 135 },
    { x = 800, y = 200, width = 179, height = 135 },
}

-- Funzione per disegnare un albero
function tree_asset.draw()
    for _, tree in ipairs(tree_asset.trees) do
        love.graphics.draw(tree_asset.image, tree.x, tree.y)  -- Disegna l'immagine nella posizione di ogni albero
    end
end

return tree_asset
