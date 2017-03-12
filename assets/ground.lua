ground = {}


function ground:create(world,x,y,height,width)
    local object = {}


    object.body = love.physics.newBody(world, x, y)
    object.shape = love.physics.newRectangleShape(width, height)
    object.fixture = love.physics.newFixture(object.body, object.shape); 

    function object:draw()
        love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
    end

    return object

end
