
local Entidad = Class('Entidad') --Clase padre

function Entidad:initialize(type, x, y, w, h) --inicializa los atributos en el constructor
    self.type, self.x, self.y, self.w, self.h = type, x, y, w, h
    self.vx, self.vy = 0, 0
end

function Entidad:update(dt) --Clase abstracta

end

function Entidad:draw() --Dibuja el objeto
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

function Entidad:getRect() --Obtener la posision y dimension de algun objeto
    return self.x, self.y, self.w, self.h
end

return Entidad