
--Clase Paleta
local Paleta = Class('Paleta', Entidad)

function Paleta:initialize(type, x, y, w, h, control)
    Entidad.initialize(self, type, x, y, w, h)
    world:add(self, self:getRect())
    self.vy = 400
    self.control = control
end

function Paleta:update(dt)
    --Variacion de X
    local dy = 0
    
    --Para el desplazamiento horizontal
    if love.keyboard.isDown(self.control.arr) then
        dy = -self.vy * dt 
    elseif love.keyboard.isDown(self.control.aba) then
        dy = self.vy * dt
    end 

    self.x, self.y, cols, len = world:move(self, self.x, self.y + dy)
    
end

function Paleta:draw()
    love.graphics.setColor(150, 220, 0)
    love.graphics.rectangle('fill', self:getRect())
end

function Paleta:getRect()
    return self.x, self.y, self.w, self.h
end

function Paleta:getCenter()
    return self.x + (self.w / 2), self.y + (self.h / 2)
end

return Paleta