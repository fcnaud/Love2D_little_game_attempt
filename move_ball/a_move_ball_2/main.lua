
function love.load()
    width  = 800
    height = 600
    love.window.setTitle("a move ball")
    love.window.setMode(width, height)

    isRun = false
    ball = {
        r    = 10,
        x    = width/2,
        y    = height/2,
        vx   = 0,
        vy   = 0,
        ax   = 0,
        ay   = 0.1,
        stat = 0
    }

end

function love.update()
    if ball.x<= 0 then
        ball.vx = -ball.vx
    end
    if ball.x>= width then
        ball.vx = -ball.vx
    end
    if ball.y<=0 then
        ball.vy = -ball.vy
    end
    if ball.y>=height then
        ball.vy = -ball.vy
    end

    if ball.stat == 'l' then
        ball.x = ball.x + ball.vx
        ball.y = ball.y + ball.vy
    elseif ball.stat == 'm' then
        ball.vx = ball.ax + ball.vx
        ball.vy = ball.ay + ball.vy
        ball.x  = ball.x + ball.vx
        ball.y  = ball.y + ball.vy
    end
end

function love.mousepressed(x, y, key)
    ball.x = x
    ball.y = y

    if key=='l' then
        ball.stat = 'l'
        ball.vx = love.math.random(20) - 10
        ball.vy = love.math.random(20) - 10
    elseif key=='m' then
        ball.stat = 'm'
        ball.a  = love.math.random(10) / 10
        ball.vx = love.math.random(20) - 10
        ball.vy = love.math.random(20) - 10
    end
end

function love.draw()
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle('fill', ball.x, ball.y, ball.r)
end