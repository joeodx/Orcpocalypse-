-- this is a comment
require("Player")
require("FloorPlatform")
require("Enemies")

function love.load()
    Player:load()
    FloorPlatform:load()
    Enemies:load()
    
end



function love.update(dt)
    Player:update(dt)
    FloorPlatform:update(dt)
    Enemies:update(dt)

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
    Player:draw()
    FloorPlatform:draw()
    Enemies:draw()
    for _, bullet in ipairs(bullets) do
        love.graphics.rectangle("fill", bullet.x, bullet.y, bullet.width, bullet.height)
    end
end

function checkCollision(a, b)
    --  checking if the objects are colliding
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end