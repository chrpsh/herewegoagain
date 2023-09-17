Food = Object:extend()


function Food:new(x)
	--window_width = love.graphics.getWidth()
    --window_height = love.graphics.getHeight()

    --[[self.str = '%'

    self.width = txt:getWidth(self.str)
    self.height = txt:getHeight(self.str)
	self.x = window_width/4 - self.width/2
	self.y = window_height/2 - self.height/2]]

	self.str = x
	self.x = math.random(0,window_width)
	self.y = math.random(0,window_height)


	--self.save = {}
	--self.save.x = self.x
	--self.save.y = self.y
	

	--self.radius = 30

	self.sym = {}
	--self.sym.str = '%'
	self.sym.width = txt:getWidth(self.str)
	self.sym.height = txt:getHeight(self.str)
	self.sym.x = self.x - self.sym.width / 2
	self.sym.y = self.y - self.sym.height / 2

	local h = txt:getHeight(self.str) / 2
	local w = txt:getWidth(self.str) / 2
	if h >= w then
		self.radius = h
	else
		self.radius = w
	end
end


function Food:keyPressed(key)
	if key == "space" then
	    self.x = math.random(0,window_width)
		self.y = math.random(0,window_height)
		--self.save.x = self.x
		--self.save.y = self.y
		self.sym.x = self.x - txt:getWidth(self.str)/2
		self.sym.y = self.y - txt:getHeight(self.str)/2
		--unit.x = window_width/2
		--unit.y = window_height/2
	elseif key == "return" then
		if self.go then self.go = false else self.go = true end
	end
end



function Food:update(dt)

end


function Food:draw()
	--love.graphics.setColor(255,255,0)
	--love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(0,0,255)
	love.graphics.circle("fill", self.x, self.y, self.radius)
	love.graphics.setColor(255,255,255)
	love.graphics.print(self.str, self.sym.x, self.sym.y)


	local small_height = 12

	--[[love.graphics.setFont(txt_small)
	love.graphics.print(txt:getHeight(self.str), 0, small_height*2)
	love.graphics.print(txt:getWidth(self.str), 0, small_height*3)
	love.graphics.print(self.radius, 0, small_height*4)]]

	love.graphics.setFont(txt)

end