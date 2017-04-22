
function love.load()
    width = 800
    height = 400
    love.window.setTitle("a move ball")
    love.window.setMode(width, height)

    radius = 10
    curx=0
    cury=0
    dx = 1
    dy = 1

end

function love.update()
    if curx == 0 then
        dx = 1
    end
    if curx == width then
        dx = -1
    end
    if cury == 0 then
        dy = 1
    end
    if cury == height then
        dy = -1
    end

    curx = curx + dx
    cury = cury + dy

end

function love.draw()
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle('fill', curx, cury, radius)
end
