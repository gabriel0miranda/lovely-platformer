local Map = {
    walls = {};
    world = require("world");
    surface = require("surface");
    surfaces = {}
}

function Map:createMap(world)
    math.randomseed(os.time())
    for i=1,10 do
        self.surfaces[i] = self.surface:new({surfaceX=math.random(0,650),surfaceY=math.random(0,650),surfaceWidth=math.random(0,650),surfaceHeight=math.random(0,650), rotation=math.random(0,180)})
        self.surfaces[i]:createSurface(world)
    end

end

function Map:drawMap()
    for i=1,10 do
        self.surfaces[i]:drawSurface()
    end
end

function Map:new(o)
      o = o or {}   -- create object if user does not provide one
      setmetatable(o, self)
      self.__index = self
      return o
end

return Map
