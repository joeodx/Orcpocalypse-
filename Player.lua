Player = {}

function Player:load()
    gravity = 1500
    jumpHeight = 200
    self.x = 50
    self.y = love.graphics.getHeight() - 35
    self.width = 20
    self.height = 100
    self.speed = 500
    self.bullets = {} 
    self.bulletSpeed = 800
end

function Player:update(dt)
    self:move(dt)
    self:checkBoundries()
    self:crouch(dt)

    if love.keyboard.isDown("space") and not self.isJumping then
        self:shoot()
    end

    for _, bullet in ipairs(self.bullets) do
        bullet.x = bullet.x + bullet.speed * dt

        -- Remove bullets that go off-screen
        if bullet.x > love.graphics.getWidth() then
            table.remove(self.bullets, _)
        end
    end
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

function Player:move(dt)
    if love.keyboard.isDown("d") then
        self.x = self.x + self.speed * dt
    elseif love.keyboard.isDown("a") then 
        self.x = self.x - self.speed * dt
    end

    if love.keyboard.isDown("w") and not self.isJumping then
        self.isJumping = true
        self.jumpVelocity = -math.sqrt(2 * gravity * jumpHeight)
    end

    if self.isJumping then
        self.y = self.y + self.jumpVelocity * dt
        self.jumpVelocity = self.jumpVelocity + gravity * dt

        if self.y > love.graphics.getHeight() - 35 - self.height then
            self.y = love.graphics.getHeight() - 35 - self.height
            self.isJumping = false
        end
    end
end

function Player:shoot()
    local bullet = {
        x = self.x + self.width , -- Adjust this based on where you want the bullet to spawn
        y = self.y + self.height / 2,
        width = 10,
        height = 5,
        speed = self.bulletSpeed,
    }

    table.insert(self.bullets, bullet)
end

function Player:drawBullets()
    for _, bullet in ipairs(self.bullets) do
        love.graphics.rectangle("fill", bullet.x, bullet.y, bullet.width, bullet.height)
    end
end


function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    self:drawBullets()
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
