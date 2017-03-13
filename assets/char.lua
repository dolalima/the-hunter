char = {}


function char:load(world)
  local char = {}
  
  -- char state
  char.state = 'idle'  

  char.squite = love.graphics.newImage("assets/img/ast-of-the-order.png")
  char.quads ={}
  
  -- Head cap 
  char.quads['head']['cap']['idle'] = love.graphics.newQuad(0,0,10,10,char.squite:getDimensions())
  char.quads['head']['cap']['up']  = love.graphics.newQuad(10,0,10,10,char.squite:getDimensions())
  char.quads['head']['cap']['down'] = love.graphics.newQuad(20,0,10,10,char.squite:getDimensions())
  char.quads['head']['cap']['back'] = love.graphics.newQuad(30,0,10,10,char.squite:getDimensions())
  char.quads['head']['cap']['hide'] = love.graphics.newQuad(40,0,10,10,char.squite:getDimensions())
  char.quads['head']['cap']['cover'] = love.graphics.newQuad(50,0,10,10,char.squite:getDimensions())
  -- Normal head
  char.quads['head']['normal']['idle'] = love.graphics.newQuad(0,10,10,10,char.squite:getDimensions())
  char.quads['head']['normal']['up']  = love.graphics.newQuad(10,10,10,10,char.squite:getDimensions())
  char.quads['head']['normal']['down'] = love.graphics.newQuad(20,10,10,10,char.squite:getDimensions())
  char.quads['head']['normal']['back'] = love.graphics.newQuad(30,10,10,10,char.squite:getDimensions())
  char.quads['head']['normal']['hide'] = love.graphics.newQuad(40,10,10,10,char.squite:getDimensions())
  char.quads['head']['normal']['cover'] = love.graphics.newQuad(50,10,10,10,char.squite:getDimensions())
  -- Crow head
  char.quads['head']['normal']['idle'] = love.graphics.newQuad(0,30,10,10,char.squite:getDimensions())
  char.quads['head']['normal']['up']  = love.graphics.newQuad(10,30,10,10,char.squite:getDimensions())
  char.quads['head']['normal']['down'] = love.graphics.newQuad(20,30,10,10,char.squite:getDimensions())
  char.quads['head']['normal']['back'] = love.graphics.newQuad(30,30,10,10,char.squite:getDimensions())
  char.quads['head']['normal']['hide'] = love.graphics.newQuad(40,30,10,10,char.squite:getDimensions())
  char.quads['head']['normal']['cover'] = love.graphics.newQuad(50,30,10,10,char.squite:getDimensions())
  
  -- Body quads storage
  char.quads['body']['idle'] = {}
  char.quads['body']['run'] = {}
  char.quads['body']['jump'] = {}
  char.quads['body']['fall'] = {}
  char.quads['body']['hit'] = {}
  char.quads['body']['back'] = {}
  char.quads['body']['corner'] = {}
  char.quads['body']['death'] = {}
  
  
  function char.draw(dt)
  
  end
   
  

  return char
end
