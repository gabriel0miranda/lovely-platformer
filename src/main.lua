function love.keypressed(key)
    if key=="up" and player.playerCanJump then
        player.playerCanJump = false
        player.body:applyForce(0,-1000)
        player.jumpCooldown = 0.5
    end
end

function love.load()
    -- Creating the map
    world = require("world")
    map = require("map")
    world:createWorld()
    map:createMap(world.world)
    -- Creating the player
    player = require("player")
    player:createPlayer(world.world)
    --Creating block
    block = {}
    block.body = love.physics.newBody(world.world,200,550,"dynamic")
    block.shape = love.physics.newRectangleShape(0,0,100,50)
    block.fixture = love.physics.newFixture(block.body,block.shape,0.4)
    -- Setting up graphics
    love.graphics.setBackgroundColor(0.30, 0.66, 0.87)
    love.window.setMode(650,650)
end

function love.update(dt)
    world.world:update(dt)
    player.jumpCooldown = math.max(player.jumpCooldown-dt, 0)
    if player.jumpCooldown == 0 then
        player.playerCanJump = true
    end

    if love.keyboard.isDown("right") then
        player.body:applyForce(50,0)
    elseif love.keyboard.isDown("left") then
        player.body:applyForce(-50,0)
    end
end

function love.draw()
    map:drawMap()
    player:drawPlayer()
    love.graphics.setColor(0.20,0.20,0.20)
    love.graphics.polygon("fill",block.body:getWorldPoints(block.shape:getPoints()))
end
