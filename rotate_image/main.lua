lg = love.graphics
lw = love.window

angle = 0

function love.load()
	img = lg.newImage('GavielG_Combo1.png')
end

function love.update(dt)
	angle = (angle + dt) % (2 * math.pi)
end

function love.draw()
	lg.draw(img, 100, 100, angle)
end
