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