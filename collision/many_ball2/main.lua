function love.load()
    width  = 800
    height = 600

    love.window.setTitle("one ball")
    love.window.setMode(width, height)
    math.randomseed(os.time())

    circles = {
    }
    circle = {
    }

    start = false
end

function love.update()
    if start==false then
        return 
    end

    local canGrow = true
    if not circleInWindow(circle) then
        canGrow = false
    else
        for ind, cur in pairs(circles) do
            if collision(cur, circle) then
                canGrow = false
                break
            end
        end
    end

    if canGrow then
        circle.r = circle.r + 1
    else
        local tmp = {}
        for ind, val in pairs(circle) do
            tmp[ind] = val
        end
        table.insert(circles, tmp)
        randomCircle(circle)
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

function randomCircle(circle)
    circle.x   = love.math.random(width)
    circle.y   = love.math.random(height)
    circle.r   = 0
    circle.red = love.math.random(255)
    circle.g   = love.math.random(255)
    circle.b   = love.math.random(255)
end

function collision(cir1, cir2)
    if dist(cir1.x, cir1.y, cir2.x, cir2.y) > (cir1.r+cir2.r) then
        return false
    end
    return true
end

function dist(x1, y1, x2, y2)
    return math.sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2))
end

function love.keypressed(key)
    if key=='space' then
        start = true
        randomCircle(circle)
    end
end


function love.draw()
    if start==false then
        return
    end

    for ind, cir in pairs(circles) do
        love.graphics.setColor(cir.red, cir.g, cir.b)
        love.graphics.circle('fill', cir.x, cir.y, cir.r)
    end

    love.graphics.setColor(circle.red, circle.g, circle.b)
    love.graphics.circle('fill', circle.x, circle.y, circle.r)
end