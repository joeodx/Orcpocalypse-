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
    Player:draw()
    FloorPlatform:draw()
    Enemies:draw()
    FloorPlatform2:draw()
    FloorPlatform3:draw()
    for _, bullet in ipairs(bullets) do
        love.graphics.rectangle("fill", bullet.x, bullet.y, bullet.width, bullet.height)
    end
end