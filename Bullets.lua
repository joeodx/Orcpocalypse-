Bullets = {}

function Bullets:load()
    self.list = {}
    self.speed = 800
    self.width = 10
    self.height = 5
end

function Bullets:shoot(x, y)
    local bullet = {
        x = x,
        y = y,
        width = self.width,
        height = self.height,
        speed = self.speed,
    }

    table.insert(self.list, bullet)
end

function Bullets:update(dt)
    for i, bullet in ipairs(self.list) do
        bullet.x = bullet.x + bullet.speed * dt

        -- Remove bullets that go off-screen
        if bullet.x > love.graphics.getWidth() then
            table.remove(self.list, i)
        end
    end
end

function Bullets:draw()
    for _, bullet in ipairs(self.list) do
        love.graphics.rectangle("fill", bullet.x, bullet.y, bullet.width, bullet.height)
    end
end