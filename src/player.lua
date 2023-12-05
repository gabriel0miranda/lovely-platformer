local player = {
    speed = 50,
    jumpCooldown = 2,
    image = love.graphics.newImage("assets/player.png"),
    width = 16,
    height = 16,
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
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    love.graphics.draw(self.image, self.body:getX(), self.body:getY(), 0, 2, 2, self.width/2, self.height/2)
end

return player
