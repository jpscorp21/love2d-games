
--Clase Pelota
local Pelota = Class('Pelota', Entidad)

function Pelota:initialize(type, x, y, w, h)
    Entidad.initialize(self, type, x, y, w, h)
    world:add(self, self:getRect())
    self.vx, self.vy = 500, 0
end

function Pelota:update(dt)
    local dx = self.vx * dt
    local dy = self.vy * dt

    self.x, self.y, cols, len = world:move(self, self.x + dx, self.y + dy)

    for i = 1, len do
        local other = cols[i].other
        --Si choca con la paleta
        if other.type == 'Paleta' then
            texto_debug = len
            local pa_x, pa_y = other:getCenter()
            local pe_x, pe_y = self:getCenter()
            
            local dy = pe_y*7 - pa_y*7
            self.vy = dy
            self.vx = -self.vx
            --El modulo de la velocidad
            local m = math.sqrt(self.vx^2 + self.vy^2)
            self.vx = self.vx / m * 500
            self.vy = self.vy / m * 500
        
        elseif other.type == 'Pared' then
            self.vy = -self.vy
        end
    end
end

function Pelota:draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.circle('fill', self.x + (self.w / 2), self.y + (self.h / 2), 8)
end

function Pelota:getRect()
    return self.x, self.y, self.w, self.h
end

function Pelota:getCenter()
    return self.x + (self.w / 2), self.y + (self.h / 2)
end


return Pelota