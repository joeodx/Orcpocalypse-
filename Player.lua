Player = {}

function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight() - 35
    self.width = 20
    self.height = 100
    self.speed = 500
end

function Player:update(dt)
    self:move(dt)
    self:checkBoundries()
    self:crouch(dt)
    
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:move(dt)
    if love.keyboard.isDown("d") then
        self.x = self.x + self.speed * dt
    elseif love.keyboard.isDown("a") then 
        self.x = self.x - self.speed * dt
    -- elseif love.keyboard.isDown("w") then 
    --     self.y = self.y - self.speed * dt
    -- elseif love.keyboard.isDown("s") then 
    --     self.y = self.y + self.speed * dt
    end
end

function Player:crouch(dt)
    local crouchHeight = 50
    if love.keyboard.isDown("s") then 
        self.y = self.y + (self.height - crouchHeight)
        self.height = crouchHeight
    else
        self.y = self.y - (self.height - 100)
        self.height = 100
    end
end


function Player:checkBoundries()
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
