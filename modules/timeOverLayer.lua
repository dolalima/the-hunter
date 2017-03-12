timeOverLayer = {}

function timeOverLayer:create(time,x,y,r,sx,sy)
  local layer = {}

  layer.time = time
  layer.x = x
  layer.y = y
  layer.rotation = r
  layer.scaleX = sx
  layer.scaleY = sy

  function layer:update(dt)
    self.time = self.time+dt
  end

  function layer:draw(camera)
    local cameraPosittion = camera:getPosition()
    love.graphics.print( string.format("%02d",self.time), cameraPosittion.x + self.x, cameraPosittion.y + self.y,self.rotation,self.scaleX,self.scaleY)
  end


  return layer
end
