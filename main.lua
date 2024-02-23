-- this is a comment
require("Player")
require("FloorPlatform")
require("Enemies")


function love.load()
    Player:load()
    FloorPlatform:load()
    Enemies:initialize()

    

    -- Load background image
    backgroundImage = love.graphics.newImage("background.jpg")

    -- Get dimensions of the background image
    bgWidth = backgroundImage:getWidth()
    bgHeight = backgroundImage:getHeight()

    -- Calculate scaling factors to fit the background image to the screen
    scaleX = love.graphics.getWidth() / bgWidth
    scaleY = love.graphics.getHeight() / bgHeight
end

function love.update(dt)
    Player:update(dt)
    FloorPlatform:update(dt)
    Enemies:update(dt)

    for _, enemy in ipairs(Enemies.enemyInstances) do
        if CheckCollision(Player, enemy) then
            -- Handle collision between player and enemy
            -- For example, decrease player's health
        end
end


    for i = #Player.bullets, 1, -1 do
        local bullet = Player.bullets[i]

        bullet.x = bullet.x + bullet.speed * dt

        if bullet.x < 0 or bullet.x > love.graphics.getWidth() then
            table.remove(Player.bullets, i)
        end

        for j, enemy in ipairs(Enemies.enemyInstances) do
            if CheckCollision(bullet, enemy) then
                -- Handle collision between bullet and enemy
                -- For example, remove the bullet and decrease enemy's health
                table.remove(Player.bullets, i)
                -- Assuming enemies have health attribute
                enemy.health = enemy.health - 1
                if enemy.health <= 0 then
                    -- Remove the enemy if it's health drops to zero or below
                    table.remove(Enemies.enemyInstances, j)
                end
                break
            end
        end
    end
end

function CheckCollision(a, b)
    return a.x < b.x + b.width and
    a.x + a.width > b.x and
    a.y < b.y + b.height and
    a.y + a.height > b.y
end
        
--     end
-- end

function love.draw()
    -- Draw background image, scaling it to fit the screen
    love.graphics.draw(backgroundImage, 0, 0, 0, scaleX, scaleY)

    -- Draw game objects
    Player:draw()
    FloorPlatform:draw()
    Enemies:draw()

end 
