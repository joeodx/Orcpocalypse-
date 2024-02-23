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

function Enemies:initialize()
    self.enemyInstances = {}
end

function Enemies:update(dt)
    for _, enemy in ipairs(self.enemyInstances) do
        enemy:checkBoundaries()
        enemy:move(dt)
    end

    if love.math.random() < 0.01 then
        local newEnemy = self:new()
        table.insert(self.enemyInstances, newEnemy)
    end
end

function Enemies:draw()
    for _, enemy in ipairs(self.enemyInstances) do
        love.graphics.rectangle("fill", enemy.x, enemy.y, enemy.width, enemy.height)
    end
end

function Enemies:move(dt)
    for _, enemy in ipairs(self.enemyInstances) do
        enemy.x = enemy.x + enemy.xVel * dt * enemy.direction
    end
end

function Enemies:checkBoundries()
    if self.x < 0 then 
        self.x = 0
    elseif self.x + self.width > love.graphics.getWidth() then 
        self.x = love.graphics.getWidth() - self.width
    elseif self.y < 0 then 
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() - 35 then
        self.y = love.graphics.getHeight() - self.height - 35
    end 

    if self.x <= 0 then
        self.xVel = self.speed
    elseif self.x + self.width >= love.graphics.getWidth() then
        self.xVel = -self.speed
    end
end
