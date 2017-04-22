function love.load()
    width = 800
    height = 600
    love.window.setTitle('falling ball')
    love.window.setMode(width, height)

    ball = {
        x  = width/2,
        y  = height/2,
        vx = 0,
        vy = 0,
        ax = 0,
        ay = 1,
        f  = 0,
        r  = 0
    }

end

function love.update()
    if ball.y >= (height-ball.r/2) then 
        ball.vy = ball.vy * 0.9
        ball.vy = -ball.vy
        ball.y = height-ball.r/2 + 1
        if math.abs(ball.vy) < 0.0001 then
            ball.vy = 0
            ball.f  = ball.ay
        end
    end
    ball.vy = ball.vy + ball.ay - ball.f
    ball.y = ball.y + ball.vy
end


function love.mousepressed(x, y, key)
    ball.x  = x
    ball.y  = y
    ball.r  = love.math.random(20) + 1
    ball.vx = 0
    ball.vy = 0
    ball.ax = 0
    ball.ay = ball.r/20
    ball.f  = ball.r/50
end

function love.draw()
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle('fill', ball.x, ball.y, ball.r)
end

