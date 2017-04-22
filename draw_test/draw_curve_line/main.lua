function love.load()
    width  = 800
    height = 600
    love.window.setTitle('draw a curve line')
    love.window.setMode(width, height)

    lineList = {}
    curLine   = {}
end

function love.update()
    if love.mouse.isDown(1) then
        curLine.endx = love.mouse.getX()
        curLine.endy = love.mouse.getY()

        local tmpLine = {}
        for ind in pairs(curLine) do
            tmpLine[ind] = curLine[ind]
        end
        table.insert(lineList, tmpLine)

        curLine.startx = curLine.endx
        curLine.starty = curLine.endy
    end
end

function love.mousepressed(x, y, key)
    if love.mouse.isDown(1) then
        curLine.startx = x
        curLine.starty = y
    end
end

function love.mousereleased(x, y, key)
    curLine.endx = x
    curLine.endy = y
    if key=='l' then
        local tmpLine = {}
        for ind in pairs(curLine) do
            tmpLine[ind] = curLine[ind]
        end
        table.insert(lineList, tmpLine)
    end
end

function love.draw()
    for ind, val in pairs(lineList) do
        love.graphics.line(val.startx, val.starty, val.endx, val.endy)
    end

end