Player = {}
bullets = {}

function Player:load()
    gravity = 1500
    jumpHeight = 500
    self.x = 50
    self.y = love.graphics.getHeight() - 35
    self.width = 20
    self.height = 100
    self.speed = 500
    self.direction = 1
    self.isJumping = false

    self.bullets = {} 
    self.bulletSpeed = 800
end

function Player:update(dt)
    self:move(dt)
    self:checkBoundaries()
    self:crouch(dt)

    -- Jumping
    if love.keyboard.isDown("w") and not self.isJumping then
        self:jump()
    end

    -- Apply gravity if jumping
    if self.isJumping then
        self.y = self.y + self.jumpVelocity * dt
        self.jumpVelocity = self.jumpVelocity + gravity * dt
    end

    -- Update bullets
    for i = #self.bullets, 1, -1 do
        local bullet = self.bullets[i]
        bullet.x = bullet.x + bullet.speed * dt

        -- Remove bullets that go off-screen
        if bullet.x > love.graphics.getWidth() then
            table.remove(self.bullets, i)
        end
    end

    -- Shooting
    if love.keyboard.isDown("space") then
        self:shoot()
    end

    -- Check for collision with FloorPlatform2
    if self:checkCollisionWithPlatform(FloorPlatform2) then
        self.y = FloorPlatform2.y - self.height
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    self:drawBullets()
end

function Player:move(dt)
    if love.keyboard.isDown("d") then
        self.x = self.x + self.speed * dt
        self.direction = 1
    elseif love.keyboard.isDown("a") then 
        self.x = self.x - self.speed * dt
        self.direction = -1
    end
end

function Player:jump()
    -- Apply jump velocity
    self.isJumping = true
    self.jumpVelocity = -math.sqrt(2 * gravity * jumpHeight)
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

function Player:checkBoundaries()
    if self.x < 0 then 
        self.x = 0
    elseif self.x + self.width > love.graphics.getWidth() then 
        self.x = love.graphics.getWidth() - self.width
    elseif self.y < 0 then 
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() - 35 then
        self.y = love.graphics.getHeight() - self.height - 35
        self.isJumping = false  -- Reset jump state when landing on the ground
    end 
end

function Player:checkCollisionWithPlatform(platform)
    return self.x < platform.x + platform.width and
           self.x + self.width > platform.x and
           self.y + self.height > platform.y and
           self.y < platform.y + platform.height
end
