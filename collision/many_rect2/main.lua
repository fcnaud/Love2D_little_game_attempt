function love.load()
    width  = 800
    height = 600

    love.window.setTitle('many rectangle')
    love.window.setMode(width, height)
    math.randomseed(os.time())

    rects = {}
    rect  = {}
    start = false

end

function love.update()
    if start==false then
        return 
    end
    
    local canGrow = true
    if not rectInWindow(rect) then
        canGrow = false
    else
        for ind, val in ipairs(rects) do
            if collision(rect, val) then
                canGrow = false
                break
            end
        end
    end

    if canGrow then
        rect.l = rect.l + 0.5
    else
        local tmp = {}
        for ind, val in pairs(rect) do
            tmp[ind] = val
        end
        table.insert(rects, tmp)

        randomRect(rect)
    end
end

function rectInWindow(rect)
    local x, y, l = rect.x, rect.y, rect.l
    if  x-l < 0 or
        x+l > width or
        y-l < 0 or
        y+l > height then 
       return false
    end
    return true
end

function collision(rect1, rect2)
    if anyPointIn(rect1, rect2) or
       anyPointIn(rect2, rect1) then
       return true
    end
    return false
end

function anyPointIn(rect1, rect2)
    local x, y, l = rect1.x, rect1.y, rect1.l
    if pointIn(x-l, y-l, rect2) then return true end
    if pointIn(x+l, y+l, rect2) then return true end
    if pointIn(x-l, y+l, rect2) then return true end
    if pointIn(x+l, y-l, rect2) then return true end
    return false
end

function pointIn(x, y, rect)
    local xx, yy, l = rect.x, rect.y, rect.l
    if ((xx-l <= x) and (x <= xx+l)) and
       ((yy-l <= y) and (y <= yy+l)) then
       return true
    end
    return false
end

function love.keypressed(key)
    if start then
        return 
    end

    if key=='space' then
        start  = true
        randomRect(rect)
    end
end

function randomRect(rect)
    rect.x = math.random(0, width)
    rect.y = math.random(0, height)
    rect.l = 0
    rect.r = math.random(0, 255)
    rect.g = math.random(0, 255)
    rect.b = math.random(0, 255)
end

function love.draw()
    if start==false then
        return 
    end
    for ind, rect in ipairs(rects) do
        love.graphics.setColor(rect.r, rect.g, rect.b)
        love.graphics.rectangle('fill', rect.x-rect.l, rect.y-rect.l, rect.l*2, rect.l*2)
    end

    love.graphics.setColor(rect.r, rect.g, rect.b)
    love.graphics.rectangle('fill', rect.x-rect.l, rect.y-rect.l, rect.l*2, rect.l*2)
end