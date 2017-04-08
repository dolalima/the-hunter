local name = require "../block"

level = {}

function level.new()
  local this = {}
  this.tileMap = require "level-01-sketch.lua"
  this.tileScheet = love.graphics.newImage('../img/tiles.png')
  this.quads = {}
  this.dynamicObject = {}
  this.staticObjects = {}
  this.backgound = {}
  setmetatable(this, self)
  self.__index=self
  return this
end

function level.load()
  local tilesets = self.tileMap.tilesets[0]
  for i,layer in ipairs(self.tileMap.layers) do
    for j,value in ipairs(layer.data) do

    end
  end
end

function level:draw()
end
