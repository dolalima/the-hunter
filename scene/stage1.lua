
require '../assets/block'
require '../assets/ground'

scenario = {}


function scenario:load(world)
    local map = {}

    map.staticObjects = {}
    map.dynamicObject = {}

    
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

    return map

end