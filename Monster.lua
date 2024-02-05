require "Player"

Monster = {}

function Monster:load()
    gravity = 1500
    jumpHeight = 200
    self.x = 10
    self.y = 50
    self.width = 20
    self.height = 100
    self.speed = 200
end

function Monster:update(dt)
    self:checkBoundries()
    self:move(dt)
end

function Monster:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Monster:move(dt)
    if Monster.x < Player.x then
        Monster.x = Player.x + Monster.speed * dt
    elseif Monster.x > Player.x then
        Monster.x = Player.x - Monster.speed * dt
    elseif Monster.x == Player.x then
        Monster.x = Player.x
    
    end

end

function Monster:checkBoundries()
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