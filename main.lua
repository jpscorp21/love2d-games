--Se declaran las distintas librerias para el juego
Class = require 'libs.middleclass'
Bump = require 'libs.bump'
Paleta = require 'paleta'
Entidad = require 'entidad'
Pelota = require 'pelota'
Pared = require 'pared'

texto_debug = ''
function love.load()

    world = Bump.newWorld()
    control1 = {
        der = 'right',
        isq = 'left',
        arr = 'up',
        aba = 'down'
    }
    paleta1 = Paleta:new('Paleta', 760, 300 - 46, 16, 92, control1)

    control2 = {
        der = 'd',
        isq = 'a',
        arr = 'w',
        aba = 's'
    }
    paleta2 = Paleta:new('Paleta', 30, 300 - 46, 16, 92, control2)
    
    pelota = Pelota:new('Pelota', 400 - 8, 300 - 8, 16, 16)

    pared_top = Pared:new('Pared', 0, 0, 800, 1)
    pared_down = Pared:new('Pared', 0, 608, 800, 1)

    
end

function love.update(dt)
    paleta1:update(dt)
    paleta2:update(dt)
    pelota:update(dt)
    
end

function love.draw()
    love.graphics.setBackgroundColor(50, 51, 50)
    paleta1:draw()
    paleta2:draw()
    pelota:draw()
    love.graphics.print(texto_debug, 30, 30)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.push('quit')
    end
end

