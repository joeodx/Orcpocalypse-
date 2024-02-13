require("Player")

Enemies = {}

function Enemies:new(x, y)
    local enemy = {
        x = x or love.math.random(0, love.graphics.getWidth() - 50),
        y = y or love.graphics.getHeight() - 35,
        width = 20,
        height = 100,
        speed = 100,
        xVel = -100, -- Initial velocity
        direction = -1
    }
    setmetatable(enemy, self)
    self.__index = self
    return enemy
end

function Enemies:load()


function Enemies:update(dt)
    -- Update each enemy instance
    for _, enemy in ipairs(self.enemyInstances) do
        enemy:checkBoundaries()
        enemy:move(dt)
    end

    -- Spawn new enemies randomly
    if love.math.random() < 0.01 then -- Adjust this probability as needed
        local newEnemy = self:new()
        table.insert(self.enemyInstances, newEnemy)
    end
end

function Enemies:draw()
    -- Draw each enemy instance
    for _, enemy in ipairs(self.enemyInstances) do
        love.graphics.rectangle("fill", enemy.x, enemy.y, enemy.width, enemy.height)
    end
end


    end
end

function Enemies:move(dt)
    for _, enemy in ipairs(self.enemyInstances) do
        -- Move each enemy
        enemy.x = enemy.x + enemy.xVel * dt * enemy.direction
    end
end


