function love.load()
  width = 600
  height = 600

  love.window.setTitle('snake')
  love.window.setMode(width,height)
end

function love.update()
end

function drawBody(x, y)
  love.graphics.rectangle('fill', x, y, 10, 10)
end

function love.draw()
  drawBody(x, y)
end
