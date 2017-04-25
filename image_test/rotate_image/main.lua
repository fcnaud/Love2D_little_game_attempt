lg = love.graphics
lw = love.window

function love.load()
	width = 800
	height = 600
	angle = 0
	img = lg.newImage('GavielG_Combo1.png')
	lw.setTitle("rotate image")
	lw.setMode(width, height)
end

function love.update(dt)
	-- angle = (angle + dt) % (2 * math.pi)
	angle = angle + 0.02
end

function love.draw()
	lg.draw(img, 100, 100, angle, 1, 1, img:getWidth()/2, img:getHeight()/2)
end
