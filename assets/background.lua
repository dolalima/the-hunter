background = {}


function background:create(x,y,heigth,width,quad,tileSheet)
    local object = {}

    object.x = x
    object.y = y
    object.width = width
    objevt.heigth = heigth
    object.quad = quad
    object.tileSheet = tileSheet

    function object:draw()
      love.graphics.draw(self.tileSheet, self.quads, self.x, self.y,0)
    end

    return object

end
