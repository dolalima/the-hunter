char = {}


function char:create(world,x,y,scale)
  local char = {}
  
  char.scale = scale  
  char.body = love.physics.newBody(world, x, y, "dynamic")
  char.body:setFixedRotation(true)
  char.shape = love.physics.newRectangleShape(12*char.scale,20*char.scale)
  char.fixture = love.physics.newFixture(char.body, char.shape, 1)
  char.fixture:setRestitution(0)
  
  -- char state
  char.state = 'idle'  

  char.squiteScheet = love.graphics.newImage("assets/img/last-of-the-order.png")
  char.quads = {}
  
  char.quads['head'] = {}
  char.quads['head']['cap'] = {}
  char.quads['head']['normal'] = {}
  char.quads['head']['crow'] = {}
  -- Head cap
  char.quads['head']['cap']['idle'] = love.graphics.newQuad(0,0,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['cap']['up']  = love.graphics.newQuad(10,0,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['cap']['down'] = love.graphics.newQuad(20,0,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['cap']['back'] = love.graphics.newQuad(30,0,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['cap']['hide'] = love.graphics.newQuad(40,0,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['cap']['cover'] = love.graphics.newQuad(50,0,10,10,char.squiteScheet:getDimensions())
  -- Normal head
  char.quads['head']['normal']['idle'] = love.graphics.newQuad(0,10,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['normal']['up']  = love.graphics.newQuad(10,10,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['normal']['down'] = love.graphics.newQuad(20,10,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['normal']['back'] = love.graphics.newQuad(30,10,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['normal']['hide'] = love.graphics.newQuad(40,10,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['normal']['cover'] = love.graphics.newQuad(50,10,10,10,char.squiteScheet:getDimensions())
  -- Crow head
  char.quads['head']['crow']['idle'] = love.graphics.newQuad(0,20,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['crow']['up']  = love.graphics.newQuad(10,20,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['crow']['down'] = love.graphics.newQuad(20,20,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['crow']['back'] = love.graphics.newQuad(30,20,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['crow']['hide'] = love.graphics.newQuad(40,20,10,10,char.squiteScheet:getDimensions())
  char.quads['head']['crow']['cover'] = love.graphics.newQuad(50,20,10,10,char.squiteScheet:getDimensions())
  
  -- Arm quads
  char.quads['arms']= {}
  char.quads['arms']['idle'] = love.graphics.newQuad(0,60,12,10,char.squiteScheet:getDimensions())
  char.quads['arms']['hold'] = love.graphics.newQuad(0,70,12,10,char.squiteScheet:getDimensions())
  
  -- Body quads
  char.quads['body']= {}
  char.quads['body']['run']= {}
   
  char.quads['body']['idle'] = love.graphics.newQuad(0,30,14,19,char.squiteScheet:getDimensions())
  
  char.quads['body']['run'][1] = love.graphics.newQuad(0,30,14,19,char.squiteScheet:getDimensions())
  char.quads['body']['run'][2] = love.graphics.newQuad(14,30,14,19,char.squiteScheet:getDimensions())  
  
  
  
  function char:draw(camera)
    local x,y = self.body:getX(),self.body:getY()
    local mouseX,mouseY = camera:mousePosition()
    local angle = math.atan2((mouseY - y), (mouseX - x))
    local head = nil
    
    
    love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
    love.graphics.polygon("line", x,y,mouseX,mouseY,x,y)       
       
    
    
    if angle>(math.pi/3) and angle<((2*math.pi)/3) then    
      head = self.quads['head']['normal']['down']
    elseif  angle>((2*math.pi)/3) or angle<-((2*math.pi)/3) then
       head = self.quads['head']['normal']['back']    
    elseif  angle<-(math.pi/3) and angle>-((2*math.pi)/3) then
      head = self.quads['head']['normal']['up']
    else
      head = self.quads['head']['normal']['idle']         
    end
    
    love.graphics.draw(self.squiteScheet, self.quads['body']['idle'], x-(self.scale*6), y-(self.scale*10),0,self.scale,self.scale)    
    love.graphics.draw(self.squiteScheet, head, x-(self.scale*4), y-(self.scale*11),0,self.scale,self.scale)     
    love.graphics.draw(self.squiteScheet, self.quads['arms']['idle'], x, y,angle,self.scale,self.scale,0,5)
    
    love.graphics.circle("fill",x,y,2)    
    
    love.graphics.print( angle, x-(self.scale*6), y-(self.scale*20) ,self.rotation,self.scaleX,self.scaleY)
    
      
      
  end
  
  function char:jump()
  end
  
  function char:right()
  end
  
  function char:left()
  end   
  

  return char
end
