require 'scene/stage1'

stage = scenario:new();


function love.load()

  love.window.setMode(1280, 720)
  love.graphics.setDefaultFilter('nearest','nearest')
  stage:load()

end


function love.update(dt)
  stage:update(dt)
end

function love.draw()
  stage:draw()
end

function love.mousepressed(x, y, button)
	if button == 1 then
    stage.char:fire()
	end
end
