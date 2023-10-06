local World = {
    meter = 64,
    hGravity = 0,
    vGravity = 9.81,
    groundWidth = 500,
    groundHeight = 100,
    shape = {},
    ground = {},
    world = {},
    fixture = {}
}

function World:createWorld()
    love.physics.setMeter(64)
    self.world = love.physics.newWorld(self.hGravity, self.vGravity*self.meter, true)
end

return World
