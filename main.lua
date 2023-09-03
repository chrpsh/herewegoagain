function love.load()
	window_width = love.graphics.getWidth()
    window_height = love.graphics.getHeight()
    txt = love.graphics.newFont("trnsgndr.ttf", 22)
    txt_small = love.graphics.newFont("trnsgndr.ttf", 12)

	Object = require "classic"
	tick = require "tick"
	unit = require "unit"
	food = require "food"

	unit = Unit()
	food = Food()
	--setColor = require "setColor"
	--setColor = setColor()
	
	
	
end


function love.keypressed(key)

end


function love.update(dt)
	tick.update(dt)
	unit:update(dt)
end

function love.keypressed(key)
	--unit:keyPressed(key)
end

function love.draw()
	love.graphics.setFont(txt)
	unit:draw()
	food:draw()
	--love.graphics.print('heh', 20, 20)
	--setColor:draw('red')
end