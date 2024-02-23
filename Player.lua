Player = {}
bullets = {}

function Player:load()
    gravity = 1500
    jumpHeight = 500
    self.x = 50
    self.y = love.graphics.getHeight() - 15
    self.width = 22 -- Adjust the width of the player image
    self.height = 22 -- Adjust the height of the player image
    self.speed = 500
    self.direction = 1
    self.isJumping = false
    self.bullets = {} 
    self.bulletSpeed = 800

    -- Load player image
    self.image = love.graphics.newImage("orc.png")

    self.floorPlatform2 = floorPlatform2
    self.floorPlatform3 = floorPlatform3
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
        if bullet.x > love.graphics.getWidth() or bullet.x < 0 then
            table.remove(self.bullets, i)
        end
    end

    -- Shooting
    if love.keyboard.isDown("space") then
        self:shoot()
    end

    -- Check for collision with FloorPlatform2
    -- if self:checkCollisionWithPlatform(FloorPlatform2) then
    --     self.y = FloorPlatform2.y - self.height
    -- end

    -- Check for collision with FloorPlatform2
    -- if self:checkCollisionWithPlatform(FloorPlatform3) then
    --     self.y = FloorPlatform3.y - self.height
    -- end

end

function Player:draw()
    -- Draw player image
    love.graphics.draw(self.image, self.x, self.y)

    -- Draw bullets
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

function Player:shoot(dt)
    if love.keyboard.isDown("space") then
        local bulletSpeed = 800
        local bulletWidth = 5
        local bulletHeight = 5

        local bulletX = self.x + (self.width * self.direction)
        local bulletY = self.y + self.height / 2 - bulletHeight / 2

        local bullet = { x = bulletX, y = bulletY, width = bulletWidth, height = bulletHeight, speed = bulletSpeed * self.direction }

        table.insert(self.bullets, bullet)
    end
end

function Player:drawBullets()
    for _, bullet in ipairs(self.bullets) do
        love.graphics.rectangle("fill", bullet.x, bullet.y, bullet.width, bullet.height)
    end
end

function Player:crouch(dt)
    local crouchHeight = 50
    if love.keyboard.isDown("s") then 
        -- CHECK IF ENOUGH SPACE TO CROUCH
        local canCrouch = true

        if canCrouch then
        self.y = self.y + (self.height - crouchHeight)
        self.height = crouchHeight
    else
        self.y = self.y - (self.height - 100)
        self.height = 100
    end
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

-- function Player:shoot(dt)
--         if love.keyboard.isDown("space") then
--             -- Modify the values below to adjust bullet properties
--             local bulletSpeed = 800
--             local bulletWidth = 5
--             local bulletHeight = 5
    
--             -- Calculate bullet position based on player's direction
--             local bulletX = self.x + (self.width * self.direction)
--             local bulletY = self.y + self.height / 2 - bulletHeight / 2
    
--             -- Create bullet object
--             local bullet = { x = bulletX, y = bulletY, width = bulletWidth, height = bulletHeight, speed = bulletSpeed * self.direction }
    
--             -- Insert bullet into a table or send it to your bullet manager
--             table.insert(bullets, bullet)
--         end
--     end


-- function Player:inContactWithEnemies()
--     if checkCollision(self, Enemies) then
--         self.x = 50 and self.y = love.graphics.getHeight() - 35
    
-- end

