function love.load()
    width  = 800
    height = 600

    love.window.setTitle("rotate lilne")
    love.window.setMode(width, height)

    line = { 
        startx = width/2, 
        starty = height/2,
        length = 100,
        radian = 0
    }
    getEndPoint(line)
end

function getEndPoint(line)
    line.endx = line.startx + line.length * math.sin(line.radian)
    line.endy = line.starty + line.length * math.cos(line.radian)
end

function love.update()
    line.radian = line.radian + 0.02
    getEndPoint(line)
end

function love.draw()
    love.graphics.line(line.startx, line.starty, line.endx, line.endy)
end