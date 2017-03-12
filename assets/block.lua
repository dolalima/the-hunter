block = {}


function block:create(world,x,y,heigth,width)
    local object = {}

    object.body = love.physics.newBody(world, x, y,"dynamic")
    object.shape = love.physics.newRectangleShape(width,heigth)
    object.fixture = love.physics.newFixture(object.body, object.shape); 

    function object:draw()
        love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
    end

    return object

end
