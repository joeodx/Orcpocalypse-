require("Player")
require("FloorPlatform")
require("Monster")

function love.load()
    Player:load()
    FloorPlatform:load()
    Monster:load()
end

function love.update(dt)
    Player:update(dt)
    FloorPlatform:update(dt)
    Monster:update(dt)
end


function love.draw()
    Player:draw()
    FloorPlatform:draw()
    Monster:draw()
end