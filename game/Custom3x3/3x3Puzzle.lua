--=================================================================================--
--===                                    Setup                                  ===--
--=================================================================================--

	--Load 8BitOperator font
	font = love.graphics.newFont("Common/eightbit.ttf", 10)
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
	
	one_val = math.random(1,9)
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
	
	nine_val = 9
	nine_x = 0
	nine_y = 0

	--Load all images
	one = love.graphics.newImage('Custom3x3/1.png')   -- Load piece one
	two = love.graphics.newImage('Custom3x3/2.png')   -- Load piece two
	three = love.graphics.newImage('Custom3x3/3.png') -- Load piece three
	four = love.graphics.newImage('Custom3x3/4.png')  -- Load piece four
	five = love.graphics.newImage('Custom3x3/5.png')  -- Load piece five
	six = love.graphics.newImage('Custom3x3/6.png')   -- Load piece six
	seven = love.graphics.newImage('Custom3x3/7.png') -- Load piece seven
	eight = love.graphics.newImage('Custom3x3/8.png') -- Load piece eight
	nine = love.graphics.newImage('Custom3x3/9.png')  -- Load piece nine
	
	border = love.graphics.newImage('Common/border.png') -- Load the top screen border
	bottom_border = love.graphics.newImage('Common/bottom_border.png') -- Load the bottom screen border/menu
	pause_menu = love.graphics.newImage('Common/pause_menu.png') -- Load the pause menu (on bottom screen)
	timerBox = love.graphics.newImage('Common/timer.png') -- Load the timer box image
	r_pause_cursor = love.graphics.newImage('Common/resume_pause_cursor.png') -- Load the pause menu 'resume' cursor
	rtmm_pause_cursor = love.graphics.newImage('Common/returnToMainMenu_pause_cursor.png') -- Load the pause menu 'return to main menu' cursor
	qa_pause_cursor = love.graphics.newImage('Common/quitApplication_pause_cursor.png') -- Load the pause menu 'quit application' cursor
	success_messege = love.graphics.newImage('Common/success.png') -- Load the success image
	
	cursor = love.graphics.newImage('Common/cursor3x3.png') -- Load the cursor image

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
	
	love.graphics.print(totalTime, 18, 14) --Print out current time
	
	--Draw the first 8 images (leave 9 alone until the puzzle is complete)
	love.graphics.draw(one, one_x, one_y)
	love.graphics.draw(two, two_x, two_y)
	love.graphics.draw(three, three_x, three_y)
	love.graphics.draw(four, four_x, four_y)
	love.graphics.draw(five, five_x, five_y)
	love.graphics.draw(six, six_x, six_y)
	love.graphics.draw(seven, seven_x, seven_y)
	love.graphics.draw(eight, eight_x, eight_y)
	
	if (solved) then
		love.graphics.draw(nine, nine_x, nine_y)
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
	if (key == 'dright') then
		if (paused == false) then
			if ((cursor_val < 3) or ((cursor_val > 3) and (cursor_val < 6)) or ((cursor_val > 6) and (cursor_val < 9))) then
				cursor_val = cursor_val + 1
			end
			cursor_x, cursor_y = calculate_X_Y(cursor_val)
		end
	end
	
	--Left movement
	if (key == 'dleft') then
		if (paused == false) then
			if (((cursor_val > 1) and (cursor_val < 4)) or ((cursor_val > 4) and (cursor_val < 7)) or ((cursor_val > 7) and (cursor_val < 10))) then
				cursor_val = cursor_val - 1
			end
			cursor_x, cursor_y = calculate_X_Y(cursor_val)
		end
	end
	
	--Up movement
	if (key == 'dup') then
		if (paused == false) then
			if cursor_val > 3 then
				cursor_val = cursor_val - 3
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
	if (key == 'ddown') then
		if (paused == false) then
			if cursor_val < 7 then
				cursor_val = cursor_val + 3
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
	
	if piece_under ~= 10 then
	
		local move_value = moveDirection()
		
		movePosition(move_value, piece_under)
	
	end
	
end

--Calculates the proper X and Y values with the provided position "value"
function calculate_X_Y(value)

	local x_value = 0
	local y_value = 0

	local first_three = 3
	
	while ((first_three > 0) and (value > 0)) do
	
		x_value = x_value + 80
		
		value = value - 1
		first_three = first_three - 1
		
	end
	
	if value ~= 0 then
	
		x_value = 0
		y_value = y_value + 80
	
		local second_three = 3
		
		while ((second_three > 0) and (value > 0)) do

			x_value = x_value + 80
		
			value = value - 1
			second_three = second_three - 1
		
		end
	
	end
	
	if value ~= 0 then
	
		x_value = 0
		y_value = y_value + 80
	
		local final_three = 3
		
		while ((final_three > 0) and (value > 0)) do

			x_value = x_value + 80
		
			value = value - 1
			final_three = final_three - 1
		
		end
	
	end
	
	return x_value, y_value
	
end

--Determines which piece is under the cursor for movePiece(),
--returns 10 if no piece is present
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
	end
	
	--Return 10 if no piece is present
	return 10

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
	if ((piece_position == 1) or (piece_position == 4) or (piece_position == 7)) then
		move_left = false
	end
	if ((piece_position == 3) or (piece_position == 6) or (piece_position == 9)) then
		move_right = false
	end
	if ((piece_position == 1) or (piece_position == 2) or (piece_position == 3)) then
		move_up = false
	end
	if ((piece_position == 7) or (piece_position == 8) or (piece_position == 9)) then
		move_down = false
	end
	
	--Test which directions are still true and then whether one is empty
	if (move_left) then
		if (determinePiece(piece_position - 1) ~= 10) then
			move_left = false
		end
	end
	if (move_right) then
		if (determinePiece(piece_position + 1) ~= 10) then
			move_right = false
		end
	end
	if (move_up) then
		if (determinePiece(piece_position - 3) ~= 10) then
			move_up = false
		end
	end
	if (move_down) then
		if (determinePiece(piece_position + 3) ~= 10) then
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
			one_val = one_val - 3
		elseif direction == 4 then
			one_val = one_val + 3
		end
	elseif piece == 2 then
		if direction == 1 then
			two_val = two_val - 1
		elseif direction == 2 then
			two_val = two_val + 1
		elseif direction == 3 then
			two_val = two_val - 3
		elseif direction == 4 then
			two_val = two_val + 3
		end
	elseif piece == 3 then
		if direction == 1 then
			three_val = three_val - 1
		elseif direction == 2 then
			three_val = three_val + 1
		elseif direction == 3 then
			three_val = three_val - 3
		elseif direction == 4 then
			three_val = three_val + 3
		end
	elseif piece == 4 then
		if direction == 1 then
			four_val = four_val - 1
		elseif direction == 2 then
			four_val = four_val + 1
		elseif direction == 3 then
			four_val = four_val - 3
		elseif direction == 4 then
			four_val = four_val + 3
		end
	elseif piece == 5 then
		if direction == 1 then
			five_val = five_val - 1
		elseif direction == 2 then
			five_val = five_val + 1
		elseif direction == 3 then
			five_val = five_val - 3
		elseif direction == 4 then
			five_val = five_val + 3
		end
	elseif piece == 6 then
		if direction == 1 then
			six_val = six_val - 1
		elseif direction == 2 then
			six_val = six_val + 1
		elseif direction == 3 then
			six_val = six_val - 3
		elseif direction == 4 then
			six_val = six_val + 3
		end
	elseif piece == 7 then
		if direction == 1 then
			seven_val = seven_val - 1
		elseif direction == 2 then
			seven_val = seven_val + 1
		elseif direction == 3 then
			seven_val = seven_val - 3
		elseif direction == 4 then
			seven_val = seven_val + 3
		end
	elseif piece == 8 then
		if direction == 1 then
			eight_val = eight_val - 1
		elseif direction == 2 then
			eight_val = eight_val + 1
		elseif direction == 3 then
			eight_val = eight_val - 3
		elseif direction == 4 then
			eight_val = eight_val + 3
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
	
end

--Checks if each piece is in the correct position, makes solved = true when condition is met
function checkIfSolved()

	if ((one_val == 1) and (two_val == 2) and (three_val == 3) and (four_val == 4) and (five_val == 5) and (six_val == 6) and (seven_val == 7) and (eight_val == 8)) then
		solved = true
	end
	
end

--Returns a random spot that is not yet being used
function randomSpot()

	local unique = false
	local randomTemp = 0

	while (unique == false) do
	
		unique = true
		randomTemp = math.random(1,9)
	
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
		end
	end
	
	return randomTemp

end

--Checks if the current layout is solvable
function isSolvable()
	
	local inversions = 0
	
	local array = {0, 0, 0, 0, 0, 0, 0, 0, 0,}
	
	array[one_val] = 1
	array[two_val] = 2
	array[three_val] = 3
	array[four_val] = 4
	array[five_val] = 5
	array[six_val] = 6
	array[seven_val] = 7
	array[eight_val] = 8
	
	for i=1, 8 do
		
		for j=i, 9 do
			
			if ((array[j] < array[i]) and (array[j] > 0)) then	
				inversions = inversions + 1
			end
			
		end
		
	end
	
	if ((inversions % 2) == 0) then
		solvable = true
	end
	
end
