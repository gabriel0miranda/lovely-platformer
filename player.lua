local player = {
    width = 16,
    height = 16,
    speed = 50,
    jumpCooldown = 2,
    image = love.graphics.newImage("assets/player.png"),
    playerCanJump = true,
    body = nil,
    shape = nil,
    fixture = nil
}

function player:createPlayer(world)
    self.body = love.physics.newBody(world, 666/2, 666/2, "dynamic")
    self.shape = love.physics.newRectangleShape(self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
end

function player:drawPlayer()
    love.graphics.draw(self.image, self.body:getX(), self.body:getY())
end

return player
