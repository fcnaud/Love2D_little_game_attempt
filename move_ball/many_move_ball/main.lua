
function love.load()
    width = 800
    height = 400
    love.window.setTitle("many move ball")
    love.window.setMode(width, height)

    balls = {}
    for i=0, 50, 1 do
        balls[i] = {
            x=math.random(width), 
            y=math.random(height), 
            dx=math.random(10),
            dy=math.random(10),
            radius=math.random(20) + 1
        }
    end

end

function love.update()
    for index, val in ipairs(balls) do
        ball = balls[index]
        
        if ball.x <= 0 then
            ball.dx = math.abs(ball.dx)
        end
        if ball.x >= width then
            ball.dx = -math.abs(ball.dx)
        end
        if ball.y <= 0 then
            ball.dy = math.abs(ball.dy)
        end
        if ball.y >= height then
            ball.dy = -math.abs(ball.dy)
        end

        ball.x = ball.x + ball.dx
        ball.y = ball.y + ball.dy
    end
end

function love.draw()
    love.graphics.setColor(255, 0, 0)
    for index, val in ipairs(balls) do
        love.graphics.circle("fill", val.x, val.y, val.radius, 100)
    end
end
