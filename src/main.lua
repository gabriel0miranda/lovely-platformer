local World = require ("world")
local Component = require ("component")
local System = require ("system")


function love.load()
end

function love.update(dt)
    World:update(dt)
end

function love.draw()
    World:draw()
end
