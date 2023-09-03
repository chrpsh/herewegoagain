Unit = Object:extend()

function Unit:new()
	--window_width = love.graphics.getWidth()
    --window_height = love.graphics.getHeight()

    --TEMP

    self.speed = 50
--	self.last = {}
--    self.last.x = self.x
--    self.last.y = self.y

    --

    self.str = 'heh'

    self.width = txt:getWidth(self.str)
    self.height = txt:getHeight(self.str)
	self.x = window_width/2 - self.width/2
	self.y = window_height/2 - self.height/2
	--self.sight = 40

	self.sight = {}
	self.sight.long = {}
	self.sight.area = {}
	self.sight.width = 200
	self.sight.height = 200

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


	self.food = 0 
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



	self.sight.x = self.x - self.sight.width/2 + self.width/2
	self.sight.y = self.y - self.sight.height/2 + self.height/2

	self.sight.long.width = self.sight.x + self.sight.width
	self.sight.long.height = self.sight.y + self.sight.height

	self.sight.area.x = {}
	self.sight.area.y = {}
	self.sight.area.x.min = self.sight.x
	self.sight.area.x.max = self.sight.area.x.min + self.sight.width
	self.sight.area.y.min = self.sight.y
	self.sight.area.y.max = self.sight.area.y.min + self.sight.height


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


function Unit:draw()
	--love.graphics.setColor(255,255,255)
	--love.graphics.print(self.str, self.x, self.y)
	--love.graphics.print('FOOD ' .. self.food, window_width-124, 0)
	--love.graphics.print('X ' .. self.x, window_width-124, self.height)
	--love.graphics.print('Y ' .. self.y, window_width-124, self.height*2)
	--love.graphics.setColor(0,0,255)
	--love.graphics.rectangle("line", self.x-self.width/2, self.y-self.height/2, self.width*2, self.height*2)
	love.graphics.setColor(255,255,0)
	love.graphics.rectangle("line", self.sight.x, self.sight.y, self.sight.width, self.sight.height)
	love.graphics.setColor(255,255,255)

	local small_height = 12

	love.graphics.setFont(txt_small)
	love.graphics.print('S.W ' .. self.width .. ' / S.S.W ' .. self.sight.width, 0, small_height*0)
	love.graphics.print('S.H ' .. self.height .. ' / S.S.H ' .. self.sight.height, 0, small_height*1)
	love.graphics.print('S.X ' .. self.x .. ' / S.S.X ' .. self.sight.x, 0, small_height*2)
	love.graphics.print('S.Y ' .. self.y .. ' / S.S.Y ' .. self.sight.x, 0, small_height*3)
	love.graphics.print('S.S.L.W ' .. self.sight.long.width, 0, small_height*5)
	love.graphics.print('S.S.L.H ' .. self.sight.long.height, 0, small_height*6)

	love.graphics.print('SIGHT ', 0, small_height*8)
	love.graphics.print('X ' .. self.sight.area.x.min .. ' — ' .. self.sight.area.x.max, 0, small_height*9)
	love.graphics.print('Y ' .. self.sight.area.y.min .. ' — ' .. self.sight.area.y.max, 0, small_height*10)
	love.graphics.print('FOOD ', 0, small_height*12)
	love.graphics.print('X ' .. food.x .. ' — ' .. food.x+food.width, 0, small_height*13)
	love.graphics.print('Y ' .. food.y .. ' — ' .. food.y + food.height, 0, small_height*14)

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


	if self.sight.area.x.min <= food.x + food.width and self.sight.area.x.max >= food.x 
		and self.sight.area.y.min <= food.y and self.sight.area.y.max >= food.y then
		love.graphics.print('YES', 0, small_height*17)
	else
		love.graphics.print('NO', 0, small_height*17)
	end

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