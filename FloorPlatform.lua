FloorPlatform = {}

function FloorPlatform:load()
    self.x = 0
    self.y = love.graphics.getHeight() - 35
    self.width = love.graphics.getWidth()
    self.height = 35

end

function FloorPlatform:update(dt)
end

function FloorPlatform:draw()
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