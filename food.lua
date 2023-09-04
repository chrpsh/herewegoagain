Food = Object:extend()


function Food:new()
	--window_width = love.graphics.getWidth()
    --window_height = love.graphics.getHeight()

    --[[self.str = '%'

    self.width = txt:getWidth(self.str)
    self.height = txt:getHeight(self.str)
	self.x = window_width/4 - self.width/2
	self.y = window_height/2 - self.height/2]]

	self.x = window_width/4
	self.y = window_height/2
	self.radius = 30
end


function Food:update(dt)

end


function Food:draw()
	--love.graphics.setColor(255,255,0)
	--love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(0,0,255)
	love.graphics.circle("fill", self.x, self.y, self.radius)
	love.graphics.setColor(255,255,255)
	--love.graphics.print(self.str, self.x, self.y)
end