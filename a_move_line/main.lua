lg = love.graphics
lw = love.window

line = {}

function love.load()
	line.midx = 100
    line.midy = 100
    line.length = 50
    line.direction = {[0]='UP', [1]='LEFT', [2]='DOWN', [3]='RIGHT'}
    line.dirInd = 0

    dlength = 3
end


function love.update(dt)
    if love.keyboard.isDown('up') then
        local dir = line.direction[line.dirInd]
        if dir=='UP' then
            line.midy = line.midy - dlength
        end
        if dir=='DOWN' then
            line.midy = line.midy + dlength
        end
        if dir=='LEFT' then
            line.midx = line.midx - dlength
        end
        if dir=='RIGHT' then
            line.midx = line.midx + dlength
        end
    elseif love.keyboard.isDown('down') then
        local dir = line.direction[line.dirInd]
        if dir=='UP' then
            line.midy = line.midy + dlength
        end
        if dir=='DOWN' then
            line.midy = line.midy - dlength
        end
        if dir=='LEFT' then
            line.midx = line.midx + dlength
        end
        if dir=='RIGHT' then
            line.midx = line.midx - dlength
        end
    elseif love.keyboard.isDown('left') then
        line.dirInd = (line.dirInd + 1) % 4
    elseif love.keyboard.isDown('right') then
        line.dirInd = (line.dirInd - 1) % 4
    end
end


function love.keypressed(k)

end

function love.draw()
	drawLine()
end

function drawLine()
    local x1, y1, x2, y2
    local ind = line.dirInd
    local dir = line.direction
    local mx = line.midx
    local my = line.midy
    local length = line.length 

    if dir[ind]=="UP" then
        x1 = mx
        y1 = my - length/2
        x2 = mx 
        y2 = my + length/2
    elseif dir[ind]=="DOWN" then 
        x1 = mx
        y1 = my + length/2
        x2 = mx 
        y2 = my - length/2
    elseif dir[ind]=="LEFT" then
        x1 = mx - length/2
        y1 = my
        x2 = mx + length/2
        y2 = my
    elseif dir[ind]=="RIGHT" then
        x1 = mx + length/2
        y1 = my
        x2 = mx - length/2
        y2 = my
    end

    lg.line(x1, y1, x2, y2)

    lg.setColor(255, 0, 0)
    lg.point(x1+1, y1-1)
    lg.point(x1+1, y1)
    lg.point(x1+1, y1+1)
    lg.point(x1, y1-1)
    lg.point(x1, y1)
    lg.point(x1, y1+1)
    lg.point(x1-1, y1-1)
    lg.point(x1-1, y1)
    lg.point(x1-1, y1+1)
    lg.setColor(255, 255, 255)

end
