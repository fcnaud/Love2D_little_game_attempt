lg = love.graphics
lw = love.window

function love.load()
	dtime = 0
end

function love.update(dt)
	dtime = dt
end

function love.draw()
	lg.print("FPS: " .. love.timer.getFPS(), 100, 100)
	lg.print("\ndt : " .. love.timer.getDelta(), 100, 120)
	lg.print("\ndtime : " .. dtime, 100, 140)
end
