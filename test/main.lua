
wnd_width = 400
wnd_height = 400

function love.load(arg)

    love.window.setMode(wnd_width, wnd_height)
    love.window.setTitle('there is a tank')

    tank = {}
    tank.img = love.graphics.newImage('tank.jpg')
    tank.pos = {x=0, y=0}

    tx = 3
    ty = 3

end


function love.update(dt)
    if love.keyboard.isDown('up') then
        tank.pos.y = tank.pos.y - ty
        if tank.pos.y <=0 then
            tank.pos.y = 0
        end 
    end

    if love.keyboard.isDown('down') then 
        tank.pos.y = tank.pos.y + ty
        if tank.pos.y >= wnd_height then
            tank.pos.y = wnd_height
        end
    end 

    if love.keyboard.isDown('left') then
        tank.pos.x = tank.pos.x - tx
        if tank.pos.x <=0 then
            tank.pos.x = 0
        end
    end

    if love.keyboard.isDown('right') then
        tank.pos.x = tank.pos.x + tx
        if tank.pos.x >= wnd_width then
            tank.pos.x = wnd_width
        end
    end

end


function love.draw()
    love.graphics.draw(tank.img, tank.pos.x, tank.pos.y)
end
