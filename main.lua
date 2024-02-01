-- this is a comment
require("Player")
require("FloorPlatform")

function love.load()
    Player:load()
    FloorPlatform:load()
end

function love.update(dt)
    Player:update(dt)
    FloorPlatform:update(dt)
end


function love.draw()
    Player:draw()
    FloorPlatform:draw()
end