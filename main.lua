-- this is a comment
require("Player")
require("FloorPlatform")
require("Enemies")
require("FloorPlatform2")
require("FloorPlatform3")

function love.load()
    Player:load()
    FloorPlatform:load()
    Enemies:load()
    FloorPlatform2:load()
    FloorPlatform3:load()

    

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
    FloorPlatform2:update(dt)
    FloorPlatform3:update(dt)

    for i = #bullets, 1, -1 do
        local bullet = bullets[i]
        bullet.x = bullet.x + bullet.speed * dt
        -- Remove bullets when they go off-screen
        if bullet.x < 0 or bullet.x > love.graphics.getWidth() then
            table.remove(bullets, i)
        end
    end
end

function love.draw()
    -- Draw background image, scaling it to fit the screen
    love.graphics.draw(backgroundImage, 0, 0, 0, scaleX, scaleY)

    -- Draw game objects
    Player:draw()
    FloorPlatform:draw()
    Enemies:draw()
    FloorPlatform2:draw()
    FloorPlatform3:draw()

    -- Draw bullets
    for _, bullet in ipairs(bullets) do
        love.graphics.rectangle("fill", bullet.x, bullet.y, bullet.width, bullet.height)
    end
end
