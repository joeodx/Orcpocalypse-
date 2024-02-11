FloorPlatform3 = {}

function FloorPlatform3:load()
    self.width = 200  -- Adjust the width as needed
    self.height = 15  -- Adjust the height as needed
    self.x = (love.graphics.getWidth() - self.width) / 4  -- Center the platform horizontally
    self.y = love.graphics.getHeight() / 2 - self.height / 2  -- Center the platform vertically
end

function FloorPlatform3:update(dt)
end

function FloorPlatform3:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function FloorPlatform3:checkBoundaries()
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
