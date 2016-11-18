lg = love.graphics
lw = love.window

function love.load()
end

function love.update(dt)
end

function love.draw()
	lg.print("FPS: " .. love.timer.getFPS())
	lg.print("\ndt : " .. love.timer.getDelta())
end
