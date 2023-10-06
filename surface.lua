local Surface = {
    surfaceX = 0,
    surfaceY = 0,
    surfaceWidth = 500,
    surfaceHeight = 100,
    shape = {},
    body = {},
    fixture = {}
}

function Surface:createSurface(world)
    self.body = love.physics.newBody(world, self.surfaceX, self.surfaceY, "static")
    self.shape = love.physics.newRectangleShape(self.surfaceWidth, self.surfaceHeight)
    self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Surface:drawSurface()
    love.graphics.setColor(0.60,0.42,0.42)
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
end

function Surface:new(o)
      o = o or {}   -- create object if user does not provide one
      setmetatable(o, self)
      self.__index = self
      return o
end

return Surface
