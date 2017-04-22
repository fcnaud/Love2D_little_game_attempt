function love.load()
    lineList = {} 
    curLine = {}
end

function love.update()
end

function love.mousepressed(x, y, key)
    curLine.startx = x
    curLine.starty = y
end

function love.mousereleased(x, y, key)
    curLine.endx = x
    curLine.endy = y
    line = {}
    for ind, val in pairs(curLine) do
        line[ind] = curLine[ind]
    end 
    table.insert(lineList, line)
end

function love.draw()
    for ind, val in pairs(lineList) do
        love.graphics.line(val.startx, val.starty, val.endx, val.endy)
    end
    if love.mouse.isDown(1) then
        love.graphics.line(curLine.startx, curLine.starty, love.mouse.getX(), love.mouse.getY())
    end
    love.graphics.print(#lineList)
end