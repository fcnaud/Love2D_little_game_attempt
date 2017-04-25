-- 不知道那里出了问题，好烦
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
    getEndPoint(hPoint)
    updateRadian(hPoint)

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
    getEndPoint(sPoint)
    updateRadian(sPoint)

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
    getEndPoint(mPoint)
    updateRadian(mPoint)

    cnt = 0
end

function getEndPoint(line)
    line.endx = line.startx + line.length * math.sin(line.radian)
    line.endy = line.starty + line.length * math.cos(line.radian)
end

function love.update()

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
    --point.radian = math.pi * 1.5 + (point.cnt / 60 * math.pi * 2)
    point.radian = point.cnt / 60 * math.pi * 2
end

function love.draw()
    love.graphics.print(sPoint.cnt .. hPoint.cnt .. mPoint.cnt, 0, 0)
    love.graphics.setColor(watchDial.r, watchDial.g, watchDial.b)
    love.graphics.circle('fill', watchDial.x, watchDial.y, watchDial.radius)
    love.graphics.setColor(255, 67, 67)
    love.graphics.circle('line', watchDial.x, watchDial.y, watchDial.radius)
    love.graphics.circle('fill', watchDial.x, watchDial.y, 3)

    showPoint(hPoint)
    showPoint(mPoint)
    showPoint(sPoint)
end

function showPoint(point)
    love.graphics.setColor(point.r, point.g, point.b)
    love.graphics.line(point.startx, point.starty, point.endx, sPoint.endy)
end