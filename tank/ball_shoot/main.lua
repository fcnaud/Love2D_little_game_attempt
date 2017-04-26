function love.load()
    width  = 800
    height = 600

    love.window.setTitle('ball shoot')
    love.window.setMode(width, height)

    bullets  = {}
    bulletv  = 10

    gunPos   = {
        x    = width/2,
        y    = height/2
    }

    mousePos = {
        x    = width/2,
        y    = height/2
    }
end

function love.update()
    --[[
    mousePos.x = love.mouse.getX()
    mousePos.y = love.mouse.getY()
    if mousePos.x<0 or
       mousePos.x>width or
       mousePos.y<0 or
       mousePos.y>height then
       
       mousePos.x = width/2
       mousePos.y = height/2
    end
    ]]
    for i=#bullets,1,-1 do
        local bullet = bullets[i]
        bullet.x = bullet.x + bullet.xv
        bullet.y = bullet.y + bullet.yv
        if bullet.x<0 or
           bullet.x>width or
           bullet.y<0 or
           bullet.y>height then
           table.remove(bullets, i)
        end
    end
end

function love.mousepressed(x, y, key)
    if key==1 then
        local radian = math.atan((x-gunPos.x)/(y-gunPos.y))
        if (y-gunPos.y) < 0 then
            radian = radian + ((x-gunPos.x)>0 and 1 or -1) * math.pi
        end
        local bullet = {}
        bullet.xv = bulletv * math.sin(radian)
        bullet.yv = bulletv * math.cos(radian)
        bullet.x = width/2
        bullet.y = height/2
        bullet.r = 5
        table.insert(bullets, bullet)
    end
end

function love.draw()
    love.graphics.print(#bullets)
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle('fill', gunPos.x, gunPos.y, 5)

    love.graphics.setColor(255, 255, 255)
    love.graphics.line(gunPos.x, gunPos.y, love.mouse.getX(), love.mouse.getY())

    for ind, bullet in ipairs(bullets) do
        love.graphics.circle('fill', bullet.x, bullet.y, bullet.r)
    end
end