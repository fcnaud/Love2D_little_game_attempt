function love.load()
    width  = 800
    height = 600

    love.window.setTitle("one ball")
    love.window.setMode(width, height)

    circles = {
    }
end

function love.update()
    for ind, circle in pairs(circles) do
        if circleInWindow(circle) then
            circle.r = circle.r + 1
        end
    end
end

function circleInWindow(cir)
    local r = cir.r
    if cir.x-r < 0 or 
       cir.x+r > width or 
       cir.y-r < 0 or 
       cir.y+r > height then
        return false
    end
    return true
end

function love.keypressed(key)
    if key=='space' then
        local circle = {}
        circle.x   = love.math.random(width)
        circle.y   = love.math.random(height)
        circle.r   = 0
        circle.red = love.math.random(255)
        circle.g   = love.math.random(255)
        circle.b   = love.math.random(255)
        table.insert(circles, circle)
    end
end


function love.draw()
    for ind, circle in pairs(circles) do
        love.graphics.setColor(circle.red, circle.g, circle.b)
        love.graphics.circle('fill', circle.x, circle.y, circle.r)
    end
end