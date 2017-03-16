arrowManager = {

}

function arrowManager:create_new(world,startX,startY,mass,angle,bulletSpeed)
  local newArrow = {}
  
  newArrow.scale = 3
  newArrow.body = love.physics.newBody(world,startX+math.cos(angle)*30,startY+math.sin(angle)*30,"dynamic")
  newArrow.shape = love.physics.newRectangleShape(13*newArrow.scale,2*newArrow.scale)
  newArrow.fixture = love.physics.newFixture(newArrow.body, newArrow.shape,1)
  
  newArrow.spriteScheet = love.graphics.newImage("assets/img/arrows.png")
  newArrow.quads = {}
  newArrow.quads['normal'] = love.graphics.newQuad(1,2,13,4,newArrow.spriteScheet:getDimensions())  


  newArrow.body:setMass(mass)
  newArrow.body:setAngle(angle)

  newArrow.body:applyLinearImpulse(bulletSpeed * math.cos(angle),bulletSpeed * math.sin(angle))

  function newArrow:update(dt)
  end

  function newArrow:draw()
    local angle = self.body:getAngle()
    local x,y = self.body:getX(),self.body:getY()
    --love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
  
    love.graphics.draw(self.spriteScheet, self.quads['normal'], x, y,angle,self.scale,self.scale,6,2)    
    
  end

  return newArrow

end
