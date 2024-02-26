FloorPlatform2 = {}

function FloorPlatform2:load()
    self.width = 200  -- Adjust the width as needed
    self.height = 15
    self.x = (love.graphics.getWidth() - self.width) / 2  -- Center the platform horizontally
    self.y = love.graphics.getHeight() / 2 - self.height / 2  -- Center the platform vertically
end

function FloorPlatform2:update(dt)
    self:checkBoundaries()
end

function FloorPlatform2:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function FloorPlatform2:checkBoundaries()
    if self.x < 0 then 
        self.x = 0
    elseif self.x + self.width > love.graphics.getWidth() then 
        self.x = love.graphics.getWidth() - self.width
    elseif self.y < 0 then 
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() - 245 then
        self.y = love.graphics.getHeight() - self.height - 35
    end 
end

function FloorPlatform2:collidesWith(player)
    return self.x < player.x + player.width and
           player.x < self.x + self.width and
           self.y < player.y + player.height and
           player.y < self.y + self.height
end