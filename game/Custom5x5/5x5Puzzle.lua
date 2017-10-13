--=================================================================================--
--===                                    Setup                                  ===--
--=================================================================================--

	--Load 8BitOperator font
	font = love.graphics.newFont("Common/eightbit")
	love.graphics.setFont(font)
	
	--Set up timer
	timer = love.timer.getTime()
	totalTime = 0
	
	--Set this up so random will work
	math.randomseed(os.time())
	
	--Initialize boolean value for whether or not the app is paused, and position value for the cursor
	paused = false
	pauseCursor = 1

	--Initialize boolean value for whether or not the puzzle is solved
	solved = false
	
	--Cannot use love.load() for some reason, so use this instead
	firstTimeSetup = true
	solvable = false

	--Initialize position values for each piece and the cursor
	cursor_val = 1
	cursor_x = 0
	cursor_y = 0
	
	one_val = math.random(1,25)
	one_x = 0
	one_y = 0
	
	two_val = 0
	two_x = 0
	two_y = 0
	
	three_val = 0
	three_x = 0
	three_y = 0
	
	four_val = 0
	four_x = 0
	four_y = 0
	
	five_val = 0
	five_x = 0
	five_y = 0
	
	six_val = 0
	six_x = 0
	six_y = 0
	
	seven_val = 0
	seven_x = 0
	seven_y = 0
	
	eight_val = 0
	eight_x = 0
	eight_y = 0
	
	nine_val = 0
	nine_x = 0
	nine_y = 0
	
	ten_val = 0
	ten_x = 0
	ten_y = 0
	
	eleven_val = 0
	eleven_x = 0
	eleven_y = 0
	
	twelve_val = 0
	twelve_x = 0
	twelve_y = 0
	
	thirteen_val = 0
	thirteen_x = 0
	thirteen_y = 0
	
	fourteen_val = 0
	fourteen_x = 0
	fourteen_y = 0
	
	fifteen_val = 0
	fifteen_x = 0
	fifteen_y = 0
	
	sixteen_val = 0
	sixteen_x = 0
	sixteen_y = 0
	
	seventeen_val = 0
	seventeen_x = 0
	seventeen_y = 0
	
	eightteen_val = 0
	eightteen_x = 0
	eightteen_y = 0
	
	nineteen_val = 0
	nineteen_x = 0
	nineteen_y = 0
	
	twenty_val = 0
	twenty_x = 0
	twenty_y = 0
	
	twentyone_val = 0
	twentyone_x = 0
	twentyone_y = 0
	
	twentytwo_val = 0
	twentytwo_x = 0
	twentytwo_y = 0
	
	twentythree_val = 0
	twentythree_x = 0
	twentythree_y = 0
	
	twentyfour_val = 0
	twentyfour_x = 0
	twentyfour_y = 0
	
	twentyfive_val = 25
	twentyfive_x = 0
	twentyfive_y = 0

	--Load all images
	one = love.graphics.newImage('Custom5x5/1.png')   -- Load piece one
	two = love.graphics.newImage('Custom5x5/2.png')   -- Load piece two
	three = love.graphics.newImage('Custom5x5/3.png') -- Load piece three
	four = love.graphics.newImage('Custom5x5/4.png')  -- Load piece four
	five = love.graphics.newImage('Custom5x5/5.png')  -- Load piece five
	six = love.graphics.newImage('Custom5x5/6.png')   -- Load piece six
	seven = love.graphics.newImage('Custom5x5/7.png') -- Load piece seven
	eight = love.graphics.newImage('Custom5x5/8.png') -- Load piece eight
	nine = love.graphics.newImage('Custom5x5/9.png')  -- Load piece nine
	ten = love.graphics.newImage('Custom5x5/10.png')  -- Load piece ten
	eleven = love.graphics.newImage('Custom5x5/11.png')  -- Load piece eleven
	twelve = love.graphics.newImage('Custom5x5/12.png')  -- Load piece twelve
	thirteen = love.graphics.newImage('Custom5x5/13.png')  -- Load piece thirteen
	fourteen = love.graphics.newImage('Custom5x5/14.png')  -- Load piece fourteen
	fifteen = love.graphics.newImage('Custom5x5/15.png')  -- Load piece fifteen
	sixteen = love.graphics.newImage('Custom5x5/16.png')  -- Load piece sixteen
	seventeen = love.graphics.newImage('Custom5x5/17.png')  -- Load piece seventeen
	eightteen = love.graphics.newImage('Custom5x5/18.png')  -- Load piece eightteen
	nineteen = love.graphics.newImage('Custom5x5/19.png')  -- Load piece nineteen
	twenty = love.graphics.newImage('Custom5x5/20.png')  -- Load piece twenty
	twentyone = love.graphics.newImage('Custom5x5/21.png')  -- Load piece twenty-one
	twentytwo = love.graphics.newImage('Custom5x5/22.png')  -- Load piece twenty-two
	twentythree = love.graphics.newImage('Custom5x5/23.png')  -- Load piece twenty-three
	twentyfour = love.graphics.newImage('Custom5x5/24.png')  -- Load piece twenty-four
	twentyfive = love.graphics.newImage('Custom5x5/25.png')  -- Load piece twenty-five
	
	border = love.graphics.newImage('Common/border.png') -- Load the top screen border
	bottom_border = love.graphics.newImage('Common/bottom_border.png') -- Load the bottom screen border/menu
	pause_menu = love.graphics.newImage('Common/pause_menu.png') -- Load the pause menu (on bottom screen)
	timerBox = love.graphics.newImage('Common/timer.png') -- Load the timer box image
	r_pause_cursor = love.graphics.newImage('Common/resume_pause_cursor.png') -- Load the pause menu 'resume' cursor
	rtmm_pause_cursor = love.graphics.newImage('Common/returnToMainMenu_pause_cursor.png') -- Load the pause menu 'return to main menu' cursor
	qa_pause_cursor = love.graphics.newImage('Common/quitApplication_pause_cursor.png') -- Load the pause menu 'quit application' cursor
	success_messege = love.graphics.newImage('Common/success.png') -- Load the success image
	
	cursor = love.graphics.newImage('Common/cursor5x5.png') -- Load the cursor image

--=================================================================================--
--===                                  Main Program                             ===--
--=================================================================================--

-- love.draw() is called every frame. Any and all draw code goes here. (images, shapes, text etc.)
function love.draw()

	--First Time Setup/Randomization
	if (firstTimeSetup) then
		while (solvable == false) do
			two_val = randomSpot()
			three_val = randomSpot()
			four_val = randomSpot()
			five_val = randomSpot()
			six_val = randomSpot()
			seven_val = randomSpot()
			eight_val = randomSpot()
			nine_val = randomSpot()
			ten_val = randomSpot()
			eleven_val = randomSpot()
			twelve_val = randomSpot()
			thirteen_val = randomSpot()
			fourteen_val = randomSpot()
			fifteen_val = randomSpot()
			sixteen_val = randomSpot()
			seventeen_val = randomSpot()
			eightteen_val = randomSpot()
			nineteen_val = randomSpot()
			twenty_val = randomSpot()
			twentyone_val = randomSpot()
			twentytwo_val = randomSpot()
			twentythree_val = randomSpot()
			twentyfour_val = randomSpot()
			isSolvable()
		end
	end

	--Calculate all piece image positions
	reloadImages()
	--Calculate cursor's current position
	cursor_x, cursor_y = calculate_X_Y(cursor_val)

	--Select bottom screen
	love.graphics.setScreen('bottom')
	
	--Draw the bottom border/menu
	love.graphics.draw(bottom_border, 0, 0)
	love.graphics.draw(pause_menu, 81, 61)
	
	--Pause Menu
	if (paused) then
		--Display Pause Menu Cursor
		if (pauseCursor == 1) then
			love.graphics.draw(r_pause_cursor, 129, 79)
		elseif (pauseCursor == 2) then
			love.graphics.draw(rtmm_pause_cursor, 87, 105)
		elseif (pauseCursor == 3) then
			love.graphics.draw(qa_pause_cursor, 99, 131)
		end
	end
	
	--Select top screen
	love.graphics.setScreen('top')
	
	--Draw the border
	love.graphics.draw(border, 0, 0)
	love.graphics.draw(timerBox, 14, 10)
	
	--Draw Timer
	if ((solved == false) and (totalTime < 999.9)) then
		totalTime = love.timer.getTime() - timer
		totalTime = totalTime * 100
		totalTime = math.ceil(totalTime)
		totalTime = totalTime / 100
	elseif (solved == false) then
		totalTime = 999.99
	end
	
	love.graphics.print(totalTime, 18, 12) --Print out current time
	
	--Draw the first 24 images (leave 25 alone until the puzzle is complete)
	love.graphics.draw(one, one_x, one_y)
	love.graphics.draw(two, two_x, two_y)
	love.graphics.draw(three, three_x, three_y)
	love.graphics.draw(four, four_x, four_y)
	love.graphics.draw(five, five_x, five_y)
	love.graphics.draw(six, six_x, six_y)
	love.graphics.draw(seven, seven_x, seven_y)
	love.graphics.draw(eight, eight_x, eight_y)
	love.graphics.draw(nine, nine_x, nine_y)
	love.graphics.draw(ten, ten_x, ten_y)
	love.graphics.draw(eleven, eleven_x, eleven_y)
	love.graphics.draw(twelve, twelve_x, twelve_y)
	love.graphics.draw(thirteen, thirteen_x, thirteen_y)
	love.graphics.draw(fourteen, fourteen_x, fourteen_y)
	love.graphics.draw(fifteen, fifteen_x, fifteen_y)
	love.graphics.draw(sixteen, sixteen_x, sixteen_y)
	love.graphics.draw(seventeen, seventeen_x, seventeen_y)
	love.graphics.draw(eightteen, eightteen_x, eightteen_y)
	love.graphics.draw(nineteen, nineteen_x, nineteen_y)
	love.graphics.draw(twenty, twenty_x, twenty_y)
	love.graphics.draw(twentyone, twentyone_x, twentyone_y)
	love.graphics.draw(twentytwo, twentytwo_x, twentytwo_y)
	love.graphics.draw(twentythree, twentythree_x, twentythree_y)
	love.graphics.draw(twentyfour, twentyfour_x, twentyfour_y)
	
	if (solved) then
		love.graphics.draw(twentyfive, twentyfive_x, twentyfive_y)
		love.graphics.setScreen('bottom')
		love.graphics.draw(success_messege, 101, 21)
		paused = true
	else
		--Draw cursor last on top of everything (only if it hasn't been solved)
		love.graphics.draw(cursor, cursor_x, cursor_y)
	end

end

--=================================================================================--
--===                                  Controls                                 ===--
--=================================================================================--

-- love.keypressed is called when any button is pressed.
function love.keypressed(key)

	--Select/Move piece
	if (key == 'a') then
		if (paused == false) and (solved == false)then
			movePiece(cursor_val)
			reloadImages()
			checkIfSolved()
		else
			if (pauseCursor == 1) then
				paused = false
			elseif (pauseCursor == 2) then
			    dofile("main.lua")
			elseif (pauseCursor == 3) then
				love.event.quit()
			end
		end
	end
	
	--Right movement
	if (key == 'right') then
		if (paused == false) then
			if ((cursor_val < 5) or ((cursor_val > 5) and (cursor_val < 10)) or ((cursor_val > 10) and (cursor_val < 15)) or ((cursor_val > 15) and (cursor_val < 20)) or ((cursor_val > 20) and (cursor_val < 25))) then
				cursor_val = cursor_val + 1
			end
			cursor_x, cursor_y = calculate_X_Y(cursor_val)
		end
	end
	
	--Left movement
	if (key == 'left') then
		if (paused == false) then
			if (((cursor_val > 1) and (cursor_val < 6)) or ((cursor_val > 6) and (cursor_val < 11)) or ((cursor_val > 11) and (cursor_val < 16)) or ((cursor_val > 16) and (cursor_val < 21)) or ((cursor_val > 21) and (cursor_val < 26))) then
				cursor_val = cursor_val - 1
			end
			cursor_x, cursor_y = calculate_X_Y(cursor_val)
		end
	end
	
	--Up movement
	if (key == 'up') then
		if (paused == false) then
			if cursor_val > 5 then
				cursor_val = cursor_val - 5
			end
			cursor_x, cursor_y = calculate_X_Y(cursor_val)
		else
			if (pauseCursor == 1) then
				pauseCursor = 3
			else
				pauseCursor = pauseCursor - 1
			end
		end
	end
	
	--Down movement
	if (key == 'down') then
		if (paused == false) then
			if cursor_val < 21 then
				cursor_val = cursor_val + 5
			end
			cursor_x, cursor_y = calculate_X_Y(cursor_val)
		else
			if (pauseCursor == 3) then
				pauseCursor = 1
			else
				pauseCursor = pauseCursor + 1
			end
		end
	end
	
	--Pauses application and prompts; Resume, Exit to Menu, and Quit Application
	if (key == 'start') then
		if paused == false then
			paused = true
		elseif paused == true then
			paused = false
			pauseCursor = 1
		end
	end
	
end

--=================================================================================--
--===                                  Functions                                ===--
--=================================================================================--

-- love.quit is called when LövePotion is quitting.
-- You can put all your cleanup code and the likes here.
function love.quit()

end

--Moves the piece (if one is present) under the cursor into
--neighboring empty slot (if one is present)
function movePiece(cur_value)

	local piece_under = determinePiece(cur_value)
	
	if piece_under ~= 26 then
	
		local move_value = moveDirection()
		
		movePosition(move_value, piece_under)
	
	end
	
end

--Calculates the proper X and Y values with the provided position "value"
function calculate_X_Y(value)

	local x_value = 32
	local y_value = 0

	local first_five = 5
	
	while ((first_five > 0) and (value > 0)) do
	
		x_value = x_value + 48
		
		value = value - 1
		first_five = first_five - 1
		
	end
	
	if value ~= 0 then
	
		x_value = 32
		y_value = y_value + 48
	
		local second_five = 5
		
		while ((second_five > 0) and (value > 0)) do

			x_value = x_value + 48
		
			value = value - 1
			second_five = second_five - 1
		
		end
	
	end
	
	if value ~= 0 then
	
		x_value = 32
		y_value = y_value + 48
	
		local third_five = 5
		
		while ((third_five > 0) and (value > 0)) do

			x_value = x_value + 48
		
			value = value - 1
			third_five = third_five - 1
		
		end
	
	end
	
	if value ~= 0 then
	
		x_value = 32
		y_value = y_value + 48
	
		local fourth_five = 5
		
		while ((fourth_five > 0) and (value > 0)) do

			x_value = x_value + 48
		
			value = value - 1
			fourth_five = fourth_five - 1
		
		end
	
	end
	
	if value ~= 0 then
	
		x_value = 32
		y_value = y_value + 48
	
		local final_five = 5
		
		while ((final_five > 0) and (value > 0)) do

			x_value = x_value + 48
		
			value = value - 1
			final_five = final_five - 1
		
		end
	
	end
	
	return x_value, y_value
	
end

--Determines which piece is under the cursor for movePiece(),
--returns 26 if no piece is present
function determinePiece(num)
	
	if one_val == num then
		return 1
	elseif two_val == num then
		return 2
	elseif three_val == num then
		return 3
	elseif four_val == num then
		return 4
	elseif five_val == num then
		return 5
	elseif six_val == num then
		return 6
	elseif seven_val == num then
		return 7
	elseif eight_val == num then
		return 8
	elseif nine_val == num then
		return 9
	elseif ten_val == num then
		return 10
	elseif eleven_val == num then
		return 11
	elseif twelve_val == num then
		return 12
	elseif thirteen_val == num then
		return 13
	elseif fourteen_val == num then
		return 14
	elseif fifteen_val == num then
		return 15
	elseif sixteen_val == num then
		return 16
	elseif seventeen_val == num then
		return 17
	elseif eightteen_val == num then
		return 18
	elseif nineteen_val == num then
		return 19
	elseif twenty_val == num then
		return 20
	elseif twentyone_val == num then
		return 21
	elseif twentytwo_val == num then
		return 22
	elseif twentythree_val == num then
		return 23
	elseif twentyfour_val == num then
		return 24
	end
	
	--Return 26 if no piece is present
	return 26

end

--Returns 0 if cannot move, and 1-4 depending on the direction it can move
-- 1 = Left
-- 2 = Right
-- 3 = Up
-- 4 = Down
function moveDirection()
	
	--All start off true, at the end all will be false, or one will be true
	local move_left = true
	local move_right = true
	local move_up = true
	local move_down = true
	
	local piece_position = cursor_val
	
	--Disallow for movement beyond borders
	if ((piece_position == 1) or (piece_position == 6) or (piece_position == 11) or (piece_position == 16) or (piece_position == 21)) then
		move_left = false
	end
	if ((piece_position == 5) or (piece_position == 10) or (piece_position == 15) or (piece_position == 20) or (piece_position == 25)) then
		move_right = false
	end
	if ((piece_position == 1) or (piece_position == 2) or (piece_position == 3) or (piece_position == 4) or (piece_position == 5)) then
		move_up = false
	end
	if ((piece_position == 21) or (piece_position == 22) or (piece_position == 23) or (piece_position == 24) or (piece_position == 25)) then
		move_down = false
	end
	
	--Test which directions are still true and then whether one is empty
	if (move_left) then
		if (determinePiece(piece_position - 1) ~= 26) then
			move_left = false
		end
	end
	if (move_right) then
		if (determinePiece(piece_position + 1) ~= 26) then
			move_right = false
		end
	end
	if (move_up) then
		if (determinePiece(piece_position - 5) ~= 26) then
			move_up = false
		end
	end
	if (move_down) then
		if (determinePiece(piece_position + 5) ~= 26) then
			move_down = false
		end
	end
	
	--Determine which direction to move (if any)
	if move_left then
		return 1
	elseif move_right then
		return 2
	elseif move_up then
		return 3
	elseif move_down then
		return 4
	end
	
	return 0
	
end

--Moves the "piece" in "direction"
function movePosition(direction, piece)

	if piece == 1 then
		if direction == 1 then
			one_val = one_val - 1
		elseif direction == 2 then
			one_val = one_val + 1
		elseif direction == 3 then
			one_val = one_val - 5
		elseif direction == 4 then
			one_val = one_val + 5
		end
	elseif piece == 2 then
		if direction == 1 then
			two_val = two_val - 1
		elseif direction == 2 then
			two_val = two_val + 1
		elseif direction == 3 then
			two_val = two_val - 5
		elseif direction == 4 then
			two_val = two_val + 5
		end
	elseif piece == 3 then
		if direction == 1 then
			three_val = three_val - 1
		elseif direction == 2 then
			three_val = three_val + 1
		elseif direction == 3 then
			three_val = three_val - 5
		elseif direction == 4 then
			three_val = three_val + 5
		end
	elseif piece == 4 then
		if direction == 1 then
			four_val = four_val - 1
		elseif direction == 2 then
			four_val = four_val + 1
		elseif direction == 3 then
			four_val = four_val - 5
		elseif direction == 4 then
			four_val = four_val + 5
		end
	elseif piece == 5 then
		if direction == 1 then
			five_val = five_val - 1
		elseif direction == 2 then
			five_val = five_val + 1
		elseif direction == 3 then
			five_val = five_val - 5
		elseif direction == 4 then
			five_val = five_val + 5
		end
	elseif piece == 6 then
		if direction == 1 then
			six_val = six_val - 1
		elseif direction == 2 then
			six_val = six_val + 1
		elseif direction == 3 then
			six_val = six_val - 5
		elseif direction == 4 then
			six_val = six_val + 5
		end
	elseif piece == 7 then
		if direction == 1 then
			seven_val = seven_val - 1
		elseif direction == 2 then
			seven_val = seven_val + 1
		elseif direction == 3 then
			seven_val = seven_val - 5
		elseif direction == 4 then
			seven_val = seven_val + 5
		end
	elseif piece == 8 then
		if direction == 1 then
			eight_val = eight_val - 1
		elseif direction == 2 then
			eight_val = eight_val + 1
		elseif direction == 3 then
			eight_val = eight_val - 5
		elseif direction == 4 then
			eight_val = eight_val + 5
		end
	elseif piece == 9 then
		if direction == 1 then
			nine_val = nine_val - 1
		elseif direction == 2 then
			nine_val = nine_val + 1
		elseif direction == 3 then
			nine_val = nine_val - 5
		elseif direction == 4 then
			nine_val = nine_val + 5
		end
	elseif piece == 10 then
		if direction == 1 then
			ten_val = ten_val - 1
		elseif direction == 2 then
			ten_val = ten_val + 1
		elseif direction == 3 then
			ten_val = ten_val - 5
		elseif direction == 4 then
			ten_val = ten_val + 5
		end
	elseif piece == 11 then
		if direction == 1 then
			eleven_val = eleven_val - 1
		elseif direction == 2 then
			eleven_val = eleven_val + 1
		elseif direction == 3 then
			eleven_val = eleven_val - 5
		elseif direction == 4 then
			eleven_val = eleven_val + 5
		end
	elseif piece == 12 then
		if direction == 1 then
			twelve_val = twelve_val - 1
		elseif direction == 2 then
			twelve_val = twelve_val + 1
		elseif direction == 3 then
			twelve_val = twelve_val - 5
		elseif direction == 4 then
			twelve_val = twelve_val + 5
		end
	elseif piece == 13 then
		if direction == 1 then
			thirteen_val = thirteen_val - 1
		elseif direction == 2 then
			thirteen_val = thirteen_val + 1
		elseif direction == 3 then
			thirteen_val = thirteen_val - 5
		elseif direction == 4 then
			thirteen_val = thirteen_val + 5
		end
	elseif piece == 14 then
		if direction == 1 then
			fourteen_val = fourteen_val - 1
		elseif direction == 2 then
			fourteen_val = fourteen_val + 1
		elseif direction == 3 then
			fourteen_val = fourteen_val - 5
		elseif direction == 4 then
			fourteen_val = fourteen_val + 5
		end
	elseif piece == 15 then
		if direction == 1 then
			fifteen_val = fifteen_val - 1
		elseif direction == 2 then
			fifteen_val = fifteen_val + 1
		elseif direction == 3 then
			fifteen_val = fifteen_val - 5
		elseif direction == 4 then
			fifteen_val = fifteen_val + 5
		end
	elseif piece == 16 then
		if direction == 1 then
			sixteen_val = sixteen_val - 1
		elseif direction == 2 then
			sixteen_val = sixteen_val + 1
		elseif direction == 3 then
			sixteen_val = sixteen_val - 5
		elseif direction == 4 then
			sixteen_val = sixteen_val + 5
		end
	elseif piece == 17 then
		if direction == 1 then
			seventeen_val = seventeen_val - 1
		elseif direction == 2 then
			seventeen_val = seventeen_val + 1
		elseif direction == 3 then
			seventeen_val = seventeen_val - 5
		elseif direction == 4 then
			seventeen_val = seventeen_val + 5
		end
	elseif piece == 18 then
		if direction == 1 then
			eightteen_val = eightteen_val - 1
		elseif direction == 2 then
			eightteen_val = eightteen_val + 1
		elseif direction == 3 then
			eightteen_val = eightteen_val - 5
		elseif direction == 4 then
			eightteen_val = eightteen_val + 5
		end
	elseif piece == 19 then
		if direction == 1 then
			nineteen_val = nineteen_val - 1
		elseif direction == 2 then
			nineteen_val = nineteen_val + 1
		elseif direction == 3 then
			nineteen_val = nineteen_val - 5
		elseif direction == 4 then
			nineteen_val = nineteen_val + 5
		end
	elseif piece == 20 then
		if direction == 1 then
			twenty_val = twenty_val - 1
		elseif direction == 2 then
			twenty_val = twenty_val + 1
		elseif direction == 3 then
			twenty_val = twenty_val - 5
		elseif direction == 4 then
			twenty_val = twenty_val + 5
		end
	elseif piece == 21 then
		if direction == 1 then
			twentyone_val = twentyone_val - 1
		elseif direction == 2 then
			twentyone_val = twentyone_val + 1
		elseif direction == 3 then
			twentyone_val = twentyone_val - 5
		elseif direction == 4 then
			twentyone_val = twentyone_val + 5
		end
	elseif piece == 22 then
		if direction == 1 then
			twentytwo_val = twentytwo_val - 1
		elseif direction == 2 then
			twentytwo_val = twentytwo_val + 1
		elseif direction == 3 then
			twentytwo_val = twentytwo_val - 5
		elseif direction == 4 then
			twentytwo_val = twentytwo_val + 5
		end
	elseif piece == 23 then
		if direction == 1 then
			twentythree_val = twentythree_val - 1
		elseif direction == 2 then
			twentythree_val = twentythree_val + 1
		elseif direction == 3 then
			twentythree_val = twentythree_val - 5
		elseif direction == 4 then
			twentythree_val = twentythree_val + 5
		end
	elseif piece == 24 then
		if direction == 1 then
			twentyfour_val = twentyfour_val - 1
		elseif direction == 2 then
			twentyfour_val = twentyfour_val + 1
		elseif direction == 3 then
			twentyfour_val = twentyfour_val - 5
		elseif direction == 4 then
			twentyfour_val = twentyfour_val + 5
		end
	end

end

--Reloads all images to their current positions. (Use this after each movement!)
function reloadImages()
	
	one_x, one_y = calculate_X_Y(one_val)
	two_x, two_y = calculate_X_Y(two_val)
	three_x, three_y = calculate_X_Y(three_val)
	four_x, four_y = calculate_X_Y(four_val)
	five_x, five_y = calculate_X_Y(five_val)
	six_x, six_y = calculate_X_Y(six_val)
	seven_x, seven_y = calculate_X_Y(seven_val)
	eight_x, eight_y = calculate_X_Y(eight_val)
	nine_x, nine_y = calculate_X_Y(nine_val)
	ten_x, ten_y = calculate_X_Y(ten_val)
	eleven_x, eleven_y = calculate_X_Y(eleven_val)
	twelve_x, twelve_y = calculate_X_Y(twelve_val)
	thirteen_x, thirteen_y = calculate_X_Y(thirteen_val)
	fourteen_x, fourteen_y = calculate_X_Y(fourteen_val)
	fifteen_x, fifteen_y = calculate_X_Y(fifteen_val)
	sixteen_x, sixteen_y = calculate_X_Y(sixteen_val)
	seventeen_x, seventeen_y = calculate_X_Y(seventeen_val)
	eightteen_x, eightteen_y = calculate_X_Y(eightteen_val)
	nineteen_x, nineteen_y = calculate_X_Y(nineteen_val)
	twenty_x, twenty_y = calculate_X_Y(twenty_val)
	twentyone_x, twentyone_y = calculate_X_Y(twentyone_val)
	twentytwo_x, twentytwo_y = calculate_X_Y(twentytwo_val)
	twentythree_x, twentythree_y = calculate_X_Y(twentythree_val)
	twentyfour_x, twentyfour_y = calculate_X_Y(twentyfour_val)
	twentyfive_x, twentyfive_y = calculate_X_Y(twentyfive_val)
	
end

--Checks if each piece is in the correct position, makes solved = true when condition is met
function checkIfSolved()

	if ((one_val == 1) and (two_val == 2) and (three_val == 3) and (four_val == 4) and (five_val == 5) and (six_val == 6) and (seven_val == 7) and (eight_val == 8) and (nine_val == 9) and (ten_val == 10) and (eleven_val == 11) and (twelve_val == 12) and (thirteen_val == 13) and (fourteen_val == 14) and (fifteen_val == 15) and (sixteen_val == 16) and (seventeen_val == 17) and (eightteen_val == 18) and (nineteen_val == 19) and (twenty_val == 20) and (twentyone_val == 21) and (twentytwo_val == 22) and (twentythree_val == 23) and (twentyfour_val == 24)) then
		solved = true
	end
	
end

--Returns a random spot that is not yet being used
function randomSpot()

	local unique = false
	local randomTemp = 0

	while (unique == false) do
	
		unique = true
		randomTemp = math.random(1,25)
	
		if (randomTemp == one_val) then
			unique = false
		elseif (randomTemp ==  two_val) then
			unique = false
		elseif (randomTemp ==  three_val) then
			unique = false
		elseif (randomTemp ==  four_val) then
			unique = false
		elseif (randomTemp ==  five_val) then
			unique = false
		elseif (randomTemp ==  six_val) then
			unique = false
		elseif (randomTemp ==  seven_val) then
			unique = false
		elseif (randomTemp ==  eight_val) then
			unique = false
		elseif (randomTemp ==  nine_val) then
			unique = false
		elseif (randomTemp ==  ten_val) then
			unique = false
		elseif (randomTemp ==  eleven_val) then
			unique = false
		elseif (randomTemp ==  twelve_val) then
			unique = false
		elseif (randomTemp ==  thirteen_val) then
			unique = false
		elseif (randomTemp ==  fourteen_val) then
			unique = false
		elseif (randomTemp ==  fifteen_val) then
			unique = false
		elseif (randomTemp ==  sixteen_val) then
			unique = false
		elseif (randomTemp ==  seventeen_val) then
			unique = false
		elseif (randomTemp ==  eightteen_val) then
			unique = false
		elseif (randomTemp ==  nineteen_val) then
			unique = false
		elseif (randomTemp ==  twenty_val) then
			unique = false
		elseif (randomTemp ==  twentyone_val) then
			unique = false
		elseif (randomTemp ==  twentytwo_val) then
			unique = false
		elseif (randomTemp ==  twentythree_val) then
			unique = false
		elseif (randomTemp ==  twentyfour_val) then
			unique = false
		end
	end
	
	return randomTemp

end

--Checks if the current layout is solvable
function isSolvable()
	
	local inversions = 0
	
	local array = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,}
	
	array[one_val] = 1
	array[two_val] = 2
	array[three_val] = 3
	array[four_val] = 4
	array[five_val] = 5
	array[six_val] = 6
	array[seven_val] = 7
	array[eight_val] = 8
	array[nine_val] = 9
	array[ten_val] = 10
	array[eleven_val] = 11
	array[twelve_val] = 12
	array[thirteen_val] = 13
	array[fourteen_val] = 14
	array[fifteen_val] = 15
	array[sixteen_val] = 16
	array[seventeen_val] = 17
	array[eightteen_val] = 18
	array[nineteen_val] = 19
	array[twenty_val] = 20
	array[twentyone_val] = 21
	array[twentytwo_val] = 22
	array[twentythree_val] = 23
	array[twentyfour_val] = 24
	
	for i=1, 24 do
		
		for j=i, 25 do
			
			if ((array[j] < array[i]) and (array[j] > 0)) then	
				inversions = inversions + 1
			end
			
		end
		
	end
	
	if ((inversions % 2) == 0) then
		solvable = true
	end
	
end