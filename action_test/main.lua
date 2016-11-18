

lg = love.graphics
lw = love.window

function love.load()
	t_start = love.timer.getTime()
	
	img = {}
	img[1] = lg.newImage('GavielG_Combo1.png')
	img[2] = lg.newImage('GavielG_Combo2.png')
	img[3] = lg.newImage('GavielG_Combo3.png')
	img[4] = lg.newImage('GavielG_Combo4.png')
	img[5] = lg.newImage('GavielG_Combo5.png')
	img[6] = lg.newImage('GavielG_Combo6.png')
	img[7] = lg.newImage('GavielG_Combo7.png')
	img[8] = lg.newImage('GavielG_Combo8.png')
	img[9] = lg.newImage('GavielG_Combo9.png')
	
	imgWidth, imgHeight = img[1]:getDimensions()
	lw.setTitle("action")
	lw.setMode(imgWidth, imgHeight)

	cnt = 0
	n   = 1

	t_end = love.timer.getTime()

	update_start = 0
	update_end   = 0
	
	action = false

end

function love.update()
	update_start = love.timer.getTime()
	
	if not action then
		n = 1
	else
		cnt = cnt + 20
	
		if cnt==100 then
			cnt = 0
			n = n + 1
		end
	
		if n==10 then
			action = false
			n = 1
		end
	end
	
	update_end = love.timer.getTime()
end

function love.keypressed(k)
	if k=='v' then
		action = true
	end
end


function love.draw()
	lg.draw(img[n])
	lg.print('Spent ' .. (t_end-t_start))
	lg.print('\nEvery frame spent ' .. (update_end-update_start))
end

