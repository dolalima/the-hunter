function love.load()

  require 'assets/char'
  require 'assets/bulletManager'
  require 'assets/arrowManager'
  require 'modules/camera'
  require 'scene/stage1'
  require 'modules/timeOverLayer'

  love.graphics.setDefaultFilter('nearest','nearest')
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 9.81*64, true)

  bulletSpeed = 1000

  objects = {}
  bullets = {}

  stage = scenario:load(world);

  objects.char = char:create(world,650/2,50,3)
  timeLayer = timeOverLayer:create(0,50,50,0,2,2)


  love.graphics.setBackgroundColor(104, 136, 248)
  love.window.setMode(650, 650)
end


function love.update(dt)
  stage:update(dt)
  timeLayer:update(dt)



  if love.keyboard.isDown("right") then
    objects.char.body:applyForce(400, 0)
  elseif love.keyboard.isDown("left") then
    objects.char.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") then
    objects.char.body:applyLinearImpulse(0,-20)
  elseif love.keyboard.isDown("r") then
    objects.char.body:setPosition(650/2, 650/2)
    objects.char.body:setLinearVelocity(0, 0)
  end

  world:update(dt)

end

function love.draw()
  camera:set()



  local screenWidth = love.graphics.getWidth()/2
  local screenHeight = love.graphics.getHeight()/2

  camera:setPosition(objects.char.body:getX() - screenWidth,objects.char.body:getY() - screenHeight);


  love.graphics.setColor(255, 255, 255)


  stage:draw()
  objects.char:draw(camera)

  for i,v in ipairs(bullets) do

      v:draw()
  	end

  timeLayer:draw(camera)

  camera:unset()

end

function love.mousepressed(x, y, button)
	if button == 1 then

    local char = objects.char

		local startX = char.body:getX()
		local startY = char.body:getY()

    local mouseX,mouseY = camera:mousePosition()

		local angle = math.atan2((mouseY - startY), (mouseX - startX))

    local b = arrowManager:create_new(world,startX,startY,1,angle,1000)

		table.insert(bullets, b)
	end
end
