char = {}


function char:load(world)
  local char = {}

  char.squite = love.graphics.newImage("assets/soldier.png")

  char.quads ={}
  char.quads['idle']
  char.quads['run']
  char.quads['jump']
  char.quads['fall']
  char.quads['hit']
  char.quads['back']
  char.quads['death']

  return char
end
