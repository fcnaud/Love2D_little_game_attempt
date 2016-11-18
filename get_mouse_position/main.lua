lg = love.graphics
lw = love.window

function love.load()
	lw.setTitle('get mouse position')
	lw.setMode(400, 400)
end

function love.update()
end

function love.draw()
	local x, y = love.mouse.getPosition()
	lg.print(string.format("x : %d\ny : %d", x, y))
end

