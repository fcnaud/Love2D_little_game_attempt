love.window.setTitle("贪吃蛇")
love.window.setMode(400, 400, {})



function love.load()
    score_t = 0
    score = 0
    tmax = 5
    t = 0
    d = ""
    dir = {left = -10, right = 10, up = -10, down = 10}
    snake = {{x = 30, y = 20}, {x = 20, y = 20}, {x = 10, y = 20}}
    w = 10
    h = 10
    food = {sta = {ture}, pos = {x = love.math.random(0,38), y = love.math.random(0,38)}}
end

function love.update(dt)
    if love.keyboard.isDown("left") then
        if d=="left"or d=="right" then
        else
            d = "left"
            t = 0
        end
    elseif love.keyboard.isDown("right") then
        if d=="right"or d=="left" then
        else
            d = "right"
            t = 0
        end
    elseif love.keyboard.isDown("up") then
        if d=="up"or d=="down" then
        else 
            d = "up"
            t = 0
        end
    elseif love.keyboard.isDown("down") then
        if d=="down"or d=="up" then
        else 
            d = "down"
            t = 0
        end
    else
    end
        
    if d=="left"or d=="right" then
        if t < tmax then
            t = t + 1
        else
            for i=#(snake), 2, -1 do
                snake[i].x = snake[i-1].x
                snake[i].y = snake[i-1].y
            end
            snake[1].x = snake[1].x + dir[d]
            t = 0
            --do
        end

    elseif d=="up"or d=="down" then
        if t < tmax then 
            t = t + 1
        else 
            for i=#(snake), 2, -1 do
                snake[i].x = snake[i-1].x
                snake[i].y = snake[i-1].y
            end
            snake[1].y = snake[1].y + dir[d]
            t = 0
        end
    end

    if snake[1].x < 0 then
        snake[1].x = 390
    end
    if snake[1].x > 390 then
        snake[1].x = 0
    end
    if snake[1].y < 0 then
        snake[1].y = 390
    end
    if snake[1].y > 395 then
        snake[1].y = 0
    end

    if snake[1].x==food.pos.x*10 and snake[1].y==food.pos.y*10 then
        -- love.audio.play("E:/github/snake_forLove2D/snake/media/click.ogg")
        score = score + 1
        score_t = score_t + 1
        if score_t==10 then
            tmax = tmax - 1
            score_t = 0
        end
        table.insert(snake, {x = snake[#snake].x, y = snake[#snake].y})
        food.pos.x = love.math.random(0,38)
        food.pos.y = love.math.random(0,38)
    end
end

function love.draw()
    love.graphics.setColor(39,100,100)
    love.graphics.print("score: "..score*10)
    love.graphics.setColor(100,100,100)
    for i,v in ipairs(snake) do
        love.graphics.rectangle("fill", v["x"], v["y"], w, h)
    end
    love.graphics.setColor(0,100,100)
    love.graphics.rectangle("fill", snake[1].x, snake[1].y, w, h)
    love.graphics.rectangle("fill", food.pos.x*10, food.pos.y*10, 10, 10)
end