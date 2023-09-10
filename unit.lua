Unit = Object:extend()

function Unit:new()
	--window_width = love.graphics.getWidth()
    --window_height = love.graphics.getHeight()

    --TEMP

    self.speed = 20
--	self.last = {}
--    self.last.x = self.x
--    self.last.y = self.y

    --

    self.go = false

    self.str = 'ÖÜ'

    self.width = txt:getWidth(self.str)
    self.height = txt:getHeight(self.str)
	self.x = window_width/4 -- self.width/2
	self.y = window_height/4 -- self.height/2
	--self.sight = 40

	self.save = {}
	self.save.x = self.x
	self.save.y = self.y

	local h = txt:getHeight(self.str) / 2
	local w = txt:getWidth(self.str) / 2
	if h >= w then
		self.radius = h
	else
		self.radius = w
	end



	self.sight = {}
	--[[self.sight.long = {}
	self.sight.area = {}
	self.sight.width = 200
	self.sight.height = 200]]
	self.sight.radius = 100

	self.sym = {}
	self.sym.x = self.x - txt:getWidth(self.str)/2
	self.sym.y = self.y - txt:getHeight(self.str)/2

	--self.sight.path = {}
	--self.sight.path.


	--[[self.sym = {}
	self.sym.str = '%'
	self.sym.width = txt:getWidth(self.sym.str)
	self.sym.height = txt:getHeight(self.sym.str)
	self.sym.x = self.x - self.sym.width / 2
	self.sym.y = self.y - self.sym.height / 2

	local h = txt:getHeight(self.sym.str) / 2
	local w = txt:getWidth(self.sym.str) / 2
	if h >= w then
		self.radius = h
	else
		self.radius = w
	end]]


	--[[self.sight.x = 0 
	self.sight.y = 0
	self.sight.distance = 0]]

	--[[
	self.sight.x = self.x - self.sight.width/2 + self.width/2
	self.sight.y = self.y - self.sight.height/2 + self.height/2

	self.sight.long.width = self.sight.x + self.sight.width
	self.sight.long.height = self.sight.y + self.sight.height

	self.sight.area.x = {}
	self.sight.area.y = {}
	self.sight.area.x.min = self.sight.x
	self.sight.area.x.max = self.sight.area.x.min + self.sight.width
	self.sight.area.y.min = self.sight.y
	self.sight.area.y.max = self.sight.area.y.min + self.sight.height]]


--[[    for i=390, self.sight.long.width do
      self.sight.area[i] = {}
      --self.sight.area[i] = self.sight.x + i
    	for v=390, self.sight.long.height do
        	self.sight.area[i][v] = self.sight.y
      end
    end]]

	--love.graphics.rectangle("line", self.x-self.width/2, self.y-self.height/2, self.width*2, self.height*2)	


	--self.food = 0 
end


function Unit:update(dt)
	--local area = {}
	--local area.x = {}
	--local area_x_min = self.sight.x
	--local area_x_max = self.sight.width
	--local area.y = {}
	--local area_y_min = self.sight.y
	--local area_y_max = self.sight.height

	if love.keyboard.isDown("left") then
		self.x = self.x - self.speed * dt
	elseif love.keyboard.isDown("right") then
		self.x = self.x + self.speed * dt 
	elseif love.keyboard.isDown("up") then
		self.y = self.y - self.speed * dt
	elseif love.keyboard.isDown("down") then
		self.y = self.y + self.speed * dt 
	end

	--[[if love.keyboard.isDown("return") then
		if self.go then self.go = false else self.go = true end
	end]]

	--[[if love.keypressed("space") then
		self.x = math.random(0,window_width)
		self.y = math.random(0,window_height)
		self.save.x = self.x
		self.save.y = self.y
	end]]


	--[[function love.keypressed(key, scancode, isrepeat)
	   if key == "space" then
	      self.x = math.random(0,window_width)
			self.y = math.random(0,window_height)
			self.save.x = self.x
			self.save.y = self.y
		elseif key == "return" then
			if self.go then self.go = false else self.go = true end
	   end
	end]]

	self.sym.x = self.x - txt:getWidth(self.str)/2
	self.sym.y = self.y - txt:getHeight(self.str)/2



	--[[ FOR A RECTANGLE

	self.sight.x = self.x - self.sight.width/2 + self.width/2
	self.sight.y = self.y - self.sight.height/2 + self.height/2

	self.sight.long.width = self.sight.x + self.sight.width
	self.sight.long.height = self.sight.y + self.sight.height ]]

	--self.sight.x = self.x + self.width/2
	--self.sight.y = self.y + self.height/2


	local distx = math.abs(food.x - self.x)
	local disty = math.abs(food.y - self.y)
	self.distance = math.sqrt((distx*distx)+(disty*disty))


	--local small_height = 12

	temp_dt = dt
	
	--local t = self.distance/self.speed

	--[[self.step = {}
	self.step.x = distx/t
	self.step.y = disty/t]]

	coeff = 0

	if distx > 0 and disty > 0 then
		if distx < disty then
			coeff = disty / distx
		else
			coeff = distx / disty
		end
	elseif distx == 0 or disty == 0 then
		coeff = 1
	end

	if self.go then
		if distx > 0 and disty > 0 then
			if self.x > food.x then
				if distx < disty then
					self.x = self.x - self.speed * dt
				else
					self.x = self.x - self.speed * dt * coeff
				end
			else--if self.x <= food.x then
				if distx < disty then
					self.x = self.x + self.speed * dt
				else
					self.x = self.x + self.speed * dt * coeff
				end
			end

			if self.y < food.y then
				if distx < disty then
					self.y = self.y + self.speed * dt*coeff
				else
					self.y = self.y + self.speed * dt
				end	
			else--if self.y >= food.y then
				if distx < disty then
					self.y = self.y - self.speed * dt*coeff
				else
					self.y = self.y - self.speed * dt
				end
			end
		elseif distx == 0 then
			if self.y < food.y then
				self.y = self.y + self.speed * dt
			else--if self.y >= food.y then
				self.y = self.y - self.speed * dt
			end
		elseif disty == 0 then
			if self.x > food.x then
				self.x = self.x - self.speed * dt
			else--if self.x <= food.x then
				self.x = self.x + self.speed * dt
			end

		end
	end





	--[[if self.distance <= self.sight.radius+food.radius then
		self.sight.radius = self.sight.radius+food.radius
		food.radius = 0
	end]]
	


	--[[self.sight.long.width = self.sight.x + self.sight.width
	self.sight.long.height = self.sight.y + self.sight.height

	self.sight.area.x = {}
	self.sight.area.y = {}
	self.sight.area.x.min = self.sight.x
	self.sight.area.x.max = self.sight.area.x.min + self.sight.width
	self.sight.area.y.min = self.sight.y
	self.sight.area.y.max = self.sight.area.y.min + self.sight.height]]


--[[	self.sight.x = 0 
	self.sight.y = 0
	self.sight.distance = 0 ]]


end

--[[function Unit:keyPressed(key)
	if love.keyboard.isDown("left") then
				self.x = self.x - self.speed * dt 
			elseif love.keyboard.isDown("right") then
				self.x = self.x + self.speed * dt 
			elseif love.keyboard.isDown("up") then
				self.y = self.y - self.speed * dt
			elseif love.keyboard.isDown("down") then
				self.y = self.y + self.speed * dt 
			end

end]]--

function Unit:keyPressed(key)
	if key=="1" then
		--love.load()
		self.x = window_width/4
		self.y = window_height/4
		self.save.x = self.x
		self.save.y = self.y
	elseif key=="2" then
		--love.load()
		self.x = window_width/4
		self.y = window_height/4*3
		self.save.x = self.x
		self.save.y = self.y
	elseif key=="3" then
		--love.load()
		self.x = window_width/4
		self.y = window_height/2
		self.save.x = self.x
		self.save.y = self.y
	elseif key=="4" then
		--love.load()
		self.x = window_width/4*3
		self.y = window_height/4
		self.save.x = self.x
		self.save.y = self.y
	elseif key=="5" then
		--love.load()
		self.x = window_width/4*3
		self.y = window_height/4*3
		self.save.x = self.x
		self.save.y = self.y
	elseif key=="6" then
		--love.load()
		self.x = window_width/2
		self.y = window_height/4
		self.save.x = self.x
		self.save.y = self.y
	elseif key=="7" then
		--love.load()
		self.x = window_width/2
		self.y = window_height/4*3
		self.save.x = self.x
		self.save.y = self.y
	end

	if key == "space" then
	      self.x = math.random(0,window_width)
			self.y = math.random(0,window_height)
			self.save.x = self.x
			self.save.y = self.y
		elseif key == "return" then
			if self.go then self.go = false else self.go = true end
	   end
end


function Unit:draw()
	local x1 = self.x
	local y1 = self.y
	local x2 = food.x
	local y2 = food.y

	love.graphics.setColor(255,0,0)
	love.graphics.line( self.save.x, self.save.y, x2, y2)
	love.graphics.setColor(255,255,255)

	love.graphics.line( x1, y1, x2, y2)
	--love.graphics.setColor(255,255,0)
	love.graphics.circle("line", self.x, self.y, self.sight.radius)
	--love.graphics.setColor(255,255,255)

	love.graphics.setColor(0,0,255)
	love.graphics.circle("fill", self.x, self.y, self.radius)

	love.graphics.setColor(255,255,255)
	love.graphics.print(self.str, self.sym.x, self.sym.y)
	--love.graphics.print('FOOD ' .. self.food, window_width-124, 0)
	--love.graphics.print('X ' .. self.x, window_width-124, self.height)
	--love.graphics.print('Y ' .. self.y, window_width-124, self.height*2)
	--love.graphics.setColor(0,0,255)
	--love.graphics.rectangle("line", self.x-self.width/2, self.y-self.height/2, self.width*2, self.height*2)
	


	local small_height = 12

	love.graphics.setFont(txt_small)
	
	if self.distance <= self.sight.radius+food.radius then
		love.graphics.print('YES', 0, small_height*0)
	else
		love.graphics.print('NO', 0, small_height*0)
	end

	love.graphics.print('PX/S: ' .. self.speed * temp_dt , 0, small_height*6)
	love.graphics.print('SPEED: ' .. self.speed , 0, small_height*7)
	love.graphics.print('DIST: ' .. self.distance, 0, small_height*8)
	love.graphics.print('TIME: ' .. self.distance/self.speed, 0, small_height*9)
	love.graphics.print('DIST/TIME: ' .. self.distance/self.distance/self.speed, 0, small_height*10)

	love.graphics.print('DIST X: ' .. math.abs(food.x - self.x), 0, small_height*11)
	love.graphics.print('DIST Y: ' .. math.abs(food.y - self.y), 0, small_height*12)


	--love.graphics.print('STEP X: ' .. self.step.x, 0, small_height*13)
	--love.graphics.print('STEP Y: ' .. self.step.y, 0, small_height*14)

	love.graphics.print('X: ' .. self.x, 0, small_height*16)
	love.graphics.print('Y: ' .. self.y, 0, small_height*17)
	
	love.graphics.print('(X): ' .. self.save.x, 0, small_height*19)
	love.graphics.print('(Y): ' .. self.save.y, 0, small_height*20)

	--distx = math.abs(food.x - self.x)
	--disty = math.abs(food.y - self.y)
	love.graphics.print('DIST X: ' .. math.abs(food.x - self.x), 0, small_height*22)
	love.graphics.print('(DIST X): ' .. math.abs(food.x - self.save.x), 0, small_height*23)
	love.graphics.print('DIST Y: ' .. math.abs(food.y - self.y), 0, small_height*24)
	love.graphics.print('(DIST Y): ' .. math.abs(food.y - self.y), 0, small_height*25)

	love.graphics.print('COEFF: ' .. coeff, 0, small_height*27)

	love.graphics.print('SPEED: ' .. self.speed, 0, small_height*28)
	--love.graphics.print('(COEFF): ' .. math.sqrt((math.abs(food.x - self.save.x)*math.abs(food.x - self.save.x))+(math.abs(food.y - self.y)*math.abs(food.y - self.y))), 0, small_height*28)
	

	--[[love.graphics.print('S.W ' .. self.width .. ' / S.S.W ' .. self.sight.width, 0, small_height*0)
	love.graphics.print('S.H ' .. self.height .. ' / S.S.H ' .. self.sight.height, 0, small_height*1)
	love.graphics.print('S.X ' .. self.x .. ' / S.S.X ' .. self.sight.x, 0, small_height*2)
	love.graphics.print('S.Y ' .. self.y .. ' / S.S.Y ' .. self.sight.x, 0, small_height*3)]]
	--love.graphics.print('S.S.L.W ' .. self.sight.long.width, 0, small_height*5)
	--love.graphics.print('S.S.L.H ' .. self.sight.long.height, 0, small_height*6)

	--[[love.graphics.print('SIGHT ', 0, small_height*8)
	love.graphics.print('X ' .. self.sight.area.x.min .. ' — ' .. self.sight.area.x.max, 0, small_height*9)
	love.graphics.print('Y ' .. self.sight.area.y.min .. ' — ' .. self.sight.area.y.max, 0, small_height*10)
	love.graphics.print('FOOD ', 0, small_height*12)
	love.graphics.print('X ' .. food.x .. ' — ' .. food.x+food.width, 0, small_height*13)
	love.graphics.print('Y ' .. food.y .. ' — ' .. food.y + food.height, 0, small_height*14)]]

	--[[if self.sight.area.x.min <= food.x + food.width and self.sight.area.x.max >= food.x then
		love.graphics.print('X YES', 0, small_height*16)
	else
		love.graphics.print('X NO', 0, small_height*16)
	end

	if self.sight.area.y.min <= food.y and self.sight.area.y.max >= food.y then
		love.graphics.print('Y YES', 0, small_height*17)
	else
		love.graphics.print('Y NO', 0, small_height*17)
	end]]

	--[[if self.sight.area.x.min <= food.x + food.width and self.sight.area.x.max >= food.x then
		love.graphics.print('X YES', 0, small_height*16)
	else
		love.graphics.print('X NO', 0, small_height*16)
	end

	if self.sight.area.y.min <= food.y and self.sight.area.y.max >= food.y then
		love.graphics.print('Y YES', 0, small_height*17)
	else
		love.graphics.print('Y NO', 0, small_height*17)
	end]]


	--[[if self.sight.area.x.min <= food.x + food.width and self.sight.area.x.max >= food.x 
		and self.sight.area.y.min <= food.y and self.sight.area.y.max >= food.y then
		love.graphics.print('YES', 0, small_height*17)
	else
		love.graphics.print('NO', 0, small_height*17)
	end]]

	love.graphics.setFont(txt)

	--love.graphics.print('TGTN ' .. table.getn(self.sight.area), 0, self.height*7)


--[[	love.graphics.setColor(255,0,0)
	love.graphics.setFont(txt_small)
	for i=0, self.sight.long.width do
      self.sight.area[i] = {}
      --self.sight.area[i] = self.sight.x + i
    	for v=0, self.sight.long.height do
        	self.sight.area[i][v] = self.sight.y + v
        	love.graphics.print(self.sight.area[i][v], 0+self.width*i*0.7, self.width*v/2)
      end
    end
    love.graphics.setFont(txt)
    love.graphics.setColor(255,255,255)]]

end