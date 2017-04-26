-- 不知道那里出了问题，好烦
-- love2d 的角度初始化是垂直向下的，逆时针增加

function love.load()
    width = 400
    height = 600

    love.window.setTitle('I\'m a watch')
    love.window.setMode(width, height)
    love.graphics.setBackgroundColor(255,255,255)

    watchDial  = {
        x      = width/2,
        y      = height/2,
        radius = 150,
        r      = 205,
        g      = 137,
        b      = 137
    }

    hPoint     = {
        startx = width/2,
        starty = height/2,
        length = watchDial.radius * 0.4,
        radian = 0,
        cnt    = 0,
        r      = 94,
        g      = 54,
        b      = 54
    }
    updateRadian(hPoint)
    getEndPoint(hPoint)

    mPoint     = {
        startx = width/2,
        starty = height/2,
        length = watchDial.radius * 0.6,
        radian = 0,
        cnt    = 0,
        r      = 128,
        g      = 85,
        b      = 85
    }
    updateRadian(mPoint)
    getEndPoint(mPoint)

    sPoint     = {
        startx = width/2,
        starty = height/2,
        length = watchDial.radius * 0.9,
        radian = 0,
        cnt    = 0,
        r      = 188,
        g      = 75,
        b      = 75
    }
    updateRadian(sPoint)
    getEndPoint(sPoint)

    scales = {}
    local length = watchDial.radius
    local sx     = width/2
    local sy     = height/2 
    for i=0,59 do
        local radian = math.pi - (i / 60 * math.pi * 2)
        local ratio = 0.95

        if i%10 == 0 then
            ratio = 0.85
        elseif i%5 == 0 then
            ratio = 0.90
        end
        scales[i] = {}
        scales[i].startx = sx + math.sin(radian) * length * ratio
        scales[i].starty = sy + math.cos(radian) * length * ratio
        scales[i].endx = sx + math.sin(radian) * length
        scales[i].endy = sy + math.cos(radian) * length
    end

    cnt = 0 

end


function love.update(dt)
    cnt = cnt + dt
    if cnt >= 1 then
        cnt = 0
    else 
        return
    end

    sPoint.cnt = sPoint.cnt + 1
    if sPoint.cnt == 60 then
        sPoint.cnt = 0
        mPoint.cnt = mPoint.cnt + 1
    end

    if mPoint.cnt == 60 then
        mPoint.cnt = 0
        hPoint.cnt = hPoint.cnt + 1
    end

    if hPoint.cnt == 60 then
        hPoint.cnt = 0
    end

    updateRadian(sPoint)
    getEndPoint(sPoint)

    updateRadian(mPoint)
    getEndPoint(mPoint)

    updateRadian(hPoint)
    getEndPoint(hPoint)
end

function updateRadian(point)
    point.radian = math.pi - (point.cnt / 60 * math.pi * 2)
end

function getEndPoint(line)
    line.endx = line.startx + line.length * math.sin(line.radian)
    line.endy = line.starty + line.length * math.cos(line.radian)
end

function love.draw()
    love.graphics.print(hPoint.cnt..' : '..mPoint.cnt..' : '..sPoint.cnt, 0, 0)
    love.graphics.setColor(watchDial.r, watchDial.g, watchDial.b)
    love.graphics.circle('fill', watchDial.x, watchDial.y, watchDial.radius)
    love.graphics.setColor(255, 67, 67)
    love.graphics.circle('line', watchDial.x, watchDial.y, watchDial.radius)
    love.graphics.circle('fill', watchDial.x, watchDial.y, 3)

    love.graphics.setColor(255,255,255)
    for ind, line in pairs(scales) do
        love.graphics.line(line.startx, line.starty, line.endx, line.endy)
    end

    showPoint(hPoint)
    showPoint(mPoint)
    showPoint(sPoint)
end

function showPoint(point)
    love.graphics.setColor(point.r, point.g, point.b)
    love.graphics.line(point.startx, point.starty, point.endx, point.endy)
end