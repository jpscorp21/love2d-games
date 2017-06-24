

--Clase Pared
local Pared = Class('Pared', Entidad)

function Pared:initialize(type, x, y, w, h)
    Entidad.initialize(self, type, x, y, w, h)
    world:add(self, self:getRect())
end

function Pared:draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle('line', self:getRect())
end

function Pared:getRect()
    return self.x, self.y, self.w, self.h
end

function Pared:getCenter()
    return self.x + (self.w / 2), self.y + (self.h / 2)
end


return Pared