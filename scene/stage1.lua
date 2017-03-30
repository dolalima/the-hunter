
require '../assets/block'
require '../assets/ground'
require '../assets/arrow'
require '../assets/char'
require '../modules/camera'
require '../modules/timeOverLayer'

scenario = {}


function scenario:new()
  local map = {}


  map.staticObjects = {}
  map.dynamicObject = {}
  map.world = love.physics.newWorld(0, 9.81*64, true)

  map.char = char:new(map.world,650/2,50,3,camera)
  map.timeLayer = timeOverLayer:create(0,50,50,0,2,2)


  setmetatable(map, self)
  self.__index=self
  return map
end

function scenario:load()
  love.physics.setMeter(64)
  self.world = love.physics.newWorld(0, 9.81*64, true)

  self.char = char:new(self.world,650/2,50,3,camera)
  self.timeLayer = timeOverLayer:create(0,50,50,0,2,2)
  table.insert(self.dynamicObject, block:create(self.world,200, 100,50,100))
  table.insert(self.dynamicObject, block:create(self.world,200, 200,100,50))
  table.insert(self.staticObjects, ground:create(self.world,650/2, 650/2,50,650))

end

function scenario:draw()
  camera:set()
  local screenWidth = love.graphics.getWidth()/2
  local screenHeight = love.graphics.getHeight()/2
  camera:setPosition(self.char.body:getX() - screenWidth,self.char.body:getY() - screenHeight);

  self.char:draw(camera)
  self.timeLayer:draw(camera)

  for i,v in ipairs(self.dynamicObject) do
    v:draw()
  end
  for i,v in ipairs(self.staticObjects) do
    v:draw()
  end

  camera:unset()
end

function scenario:update(dt)
  self.timeLayer:update(dt)

  if love.keyboard.isDown("right") then
      self.char:right();
    elseif love.keyboard.isDown("left") then
      self.char:left()
    elseif love.keyboard.isDown("up") then
      self.char:jump()
    elseif love.keyboard.isDown("r") then
      self.char:reset()
    end

  self.world:update(dt)
end

return scenario
