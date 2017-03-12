bullet = {

}

function bullet:create_new(world,startX,startY,mass,angle,bulletSpeed)
  local newBullet = {}

  newBullet.body = love.physics.newBody(world,startX+math.cos(angle)*7,startY+math.sin(angle)*7,"dynamic")
  newBullet.shape = love.physics.newCircleShape(5)
  newBullet.fixture = love.physics.newFixture(self.body, self.shape,1)

  newBullet.body:setMass(mass)

  newBullet.body:applyLinearImpulse(bulletSpeed * math.cos(angle),bulletDy)

  function newBullet:update(dt)
  end

  function newBullet:draw()
    love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
  end

  return newBullet

end


function bullet:destroy(world,bullet)

end
