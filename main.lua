function love.keypressed(key)
    if key=="up" and player.playerCanJump then
        player.playerCanJump = false
        player.body:applyForce(0,-1000)
        player.jumpCooldown = 0.5
    end
end

function love.load()
    -- Creating the map
    map = require("world")
    surfaces = require("surface")
    wall1 = surfaces:new({surfaceX=10,surfaceY=250,surfaceWidth=20,surfaceHeight=500})
    wall2 = surfaces:new({surfaceX=490,surfaceY=250,surfaceWidth=20,surfaceHeight=500})
    ground = surfaces:new({surfaceX=250,surfaceY=490,surfaceWidth=500,surfaceHeight=20})
    map:createWorld()
    ground:createSurface(map.world)
    wall1:createSurface(map.world)
    wall2:createSurface(map.world)
    -- Creating the player
    player = require("player")
    player:createPlayer(map.world)
    --Creating block
    block = {}
    block.body = love.physics.newBody(map.world,200,400,"dynamic")
    block.shape = love.physics.newRectangleShape(0,0,100,50)
    block.fixture = love.physics.newFixture(block.body,block.shape,0.4)
    -- Setting up graphics
    love.graphics.setBackgroundColor(0.30, 0.66, 0.87)
    love.window.setMode(500,500)
end

function love.update(dt)
    map.world:update(dt)
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
    ground:drawSurface()
    wall1:drawSurface()
    wall2:drawSurface()
    player:drawPlayer()
    love.graphics.setColor(0.20,0.20,0.20)
    love.graphics.polygon("fill",block.body:getWorldPoints(block.shape:getPoints()))
end
