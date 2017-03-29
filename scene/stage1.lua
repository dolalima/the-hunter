
require '../assets/block'
require '../assets/ground'

scenario = {}


function scenario:load(world)
    local map = {}

    map.staticObjects = {}
    map.dynamicObject = {}
    map.world = world


    table.insert(map.dynamicObject, block:create(world,200, 100,50,100))
    table.insert(map.dynamicObject, block:create(world,200, 200,100,50))
    table.insert(map.staticObjects, ground:create(world,650/2, 650/2,50,650))


    function map:draw()

        for i,v in ipairs(self.dynamicObject) do
            v:draw()
        end
        for i,v in ipairs(self.staticObjects) do
            v:draw()
        end

    end

    function map:update(dt)
      if love.keyboard.isDown("o") then
        for i,v in ipairs(map.staticObjects) do
            v.body:setY(v.body:getY()+20)
            map.world:update(dt)
        	end
      end


    end

    return map

end
