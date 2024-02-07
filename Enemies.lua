Enemies = {}


function Enemies:load()
    -- gravity = 1500
    -- jumpHeight = 200
    self.x = love.graphics.getWidth() - 50
    self.y = love.graphics.getHeight() - 35
    self.width = 20
    self.height = 100
    self.speed = 500
    -- 1 for right, -1 for left
    self.direction = -1

end

function Enemies:update(dt)
    Enemies:checkBoundries()
end

function Enemies:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
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
end

    
