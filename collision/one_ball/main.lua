function love.load()
    width  = 800
    height = 600

    love.window.setTitle("one ball")
    love.window.setMode(width, height)

    circle = {
        r  = 0,
        x  = 0,
        y  = 0
    }
end

function love.update()
    if circleInWindow(circle, width, height) then
        circle.r = circle.r + 1
    end
end

function circleInWindow(cir, w, h)
    local r = cir.r
    if cir.x-r < 0 or 
       cir.x+r > w or 
       cir.y-r < 0 or 
       cir.y+r > h then
        return false
    end
    return true
end

function love.keypressed(key)
    if key=='space' then
        circle.x = love.math.random(width)
        circle.y = love.math.random(height)
        circle.r = 0
    end
end


function love.draw()
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle('fill', circle.x, circle.y, circle.r)
end