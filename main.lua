function love.load()

  require 'assets/bulletManager'
  require 'modules/camera'
  require 'scene/stage1'
  require 'modules/timeOverLayer'

  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 9.81*64, true)

  bulletSpeed = 1000

  objects = {}
  bullets = {}

  stage = scenario:load(world);


  objects.ball = {}
  objects.ball.body = love.physics.newBody(world, 650/2, 650/2, "dynamic")
  objects.ball.shape = love.physics.newCircleShape(20)
  objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1)
  objects.ball.fixture:setRestitution(0.0)


  timeLayer = timeOverLayer:create(0,50,50,0,2,2)




  love.graphics.setBackgroundColor(104, 136, 248)
  love.window.setMode(650, 650)
end


function love.update(dt)
  world:update(dt)
  timeLayer:update(dt)


  if love.keyboard.isDown("right") then
    objects.ball.body:applyForce(400, 0)
  elseif love.keyboard.isDown("left") then
    objects.ball.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") then
    objects.ball.body:applyLinearImpulse(0,-20)
  elseif love.keyboard.isDown("r") then
    objects.ball.body:setPosition(650/2, 650/2)
    objects.ball.body:setLinearVelocity(0, 0)
  end


end

function love.draw()
  camera:set()



  local screenWidth = love.graphics.getWidth()/2
  local screenHeight = love.graphics.getHeight()/2

  camera:setPosition(objects.ball.body:getX() - screenWidth,objects.ball.body:getY() - screenHeight);


  love.graphics.setColor(193, 47, 14)
  love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())

  stage:draw()

  for i,v in ipairs(bullets) do

      v:draw()
  	end

  timeLayer:draw(camera)

  camera:unset()

end

function love.mousepressed(x, y, button)
	if button == 1 then

    local ball = objects.ball

		local startX = ball.body:getX()
		local startY = ball.body:getY()

    local mouseX,mouseY = camera:mousePosition()

		local angle = math.atan2((mouseY - startY), (mouseX - startX))

    local b = bulletManager:create_new(world,startX,startY,1,angle,1000)

		table.insert(bullets, b)
	end
end
