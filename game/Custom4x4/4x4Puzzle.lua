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
	
	one_val = math.random(1,16)
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
	
	sixteen_val = 16
	sixteen_x = 0
	sixteen_y = 0

	--Load all images
	one = love.graphics.newImage('Custom4x4/1.png')   -- Load piece one
	two = love.graphics.newImage('Custom4x4/2.png')   -- Load piece two
	three = love.graphics.newImage('Custom4x4/3.png') -- Load piece three
	four = love.graphics.newImage('Custom4x4/4.png')  -- Load piece four
	five = love.graphics.newImage('Custom4x4/5.png')  -- Load piece five
	six = love.graphics.newImage('Custom4x4/6.png')   -- Load piece six
	seven = love.graphics.newImage('Custom4x4/7.png') -- Load piece seven
	eight = love.graphics.newImage('Custom4x4/8.png') -- Load piece eight
	nine = love.graphics.newImage('Custom4x4/9.png')  -- Load piece nine
	ten = love.graphics.newImage('Custom4x4/10.png')  -- Load piece ten
	eleven = love.graphics.newImage('Custom4x4/11.png')  -- Load piece eleven
	twelve = love.graphics.newImage('Custom4x4/12.png')  -- Load piece twelve
	thirteen = love.graphics.newImage('Custom4x4/13.png')  -- Load piece thirteen
	fourteen = love.graphics.newImage('Custom4x4/14.png')  -- Load piece fourteen
	fifteen = love.graphics.newImage('Custom4x4/15.png')  -- Load piece fifteen
	sixteen = love.graphics.newImage('Custom4x4/16.png')  -- Load piece sixteen
	
	border = love.graphics.newImage('Common/border.png') -- Load the top screen border
	bottom_border = love.graphics.newImage('Common/bottom_border.png') -- Load the bottom screen border/menu
	pause_menu = love.graphics.newImage('Common/pause_menu.png') -- Load the pause menu (on bottom screen)
	timerBox = love.graphics.newImage('Common/timer.png') -- Load the timer box image
	r_pause_cursor = love.graphics.newImage('Common/resume_pause_cursor.png') -- Load the pause menu 'resume' cursor
	rtmm_pause_cursor = love.graphics.newImage('Common/returnToMainMenu_pause_cursor.png') -- Load the pause menu 'return to main menu' cursor
	qa_pause_cursor = love.graphics.newImage('Common/quitApplication_pause_cursor.png') -- Load the pause menu 'quit application' cursor
	success_messege = love.graphics.newImage('Common/success.png') -- Load the success image
	
	cursor = love.graphics.newImage('Common/cursor4x4.png') -- Load the cursor image

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
	
	--Draw the first 15 images (leave 16 alone until the puzzle is complete)
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
	
	if (solved) then
		love.graphics.draw(sixteen, sixteen_x, sixteen_y)
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
			if ((cursor_val < 4) or ((cursor_val > 4) and (cursor_val < 8)) or ((cursor_val > 8) and (cursor_val < 12)) or ((cursor_val > 12) and (cursor_val < 16))) then
				cursor_val = cursor_val + 1
			end
			cursor_x, cursor_y = calculate_X_Y(cursor_val)
		end
	end
	
	--Left movement
	if (key == 'dleft') then
		if (paused == false) then
			if (((cursor_val > 1) and (cursor_val < 5)) or ((cursor_val > 5) and (cursor_val < 9)) or ((cursor_val > 9) and (cursor_val < 13)) or ((cursor_val > 13) and (cursor_val < 17))) then
				cursor_val = cursor_val - 1
			end
			cursor_x, cursor_y = calculate_X_Y(cursor_val)
		end
	end
	
	--Up movement
	if (key == 'dup') then
		if (paused == false) then
			if cursor_val > 4 then
				cursor_val = cursor_val - 4
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
			if cursor_val < 13 then
				cursor_val = cursor_val + 4
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
	
	if piece_under ~= 17 then
	
		local move_value = moveDirection()
		
		movePosition(move_value, piece_under)
	
	end
	
end

--Calculates the proper X and Y values with the provided position "value"    Need to figure out add first 80, then continue with 60
function calculate_X_Y(value)

	local x_value = 20
	local y_value = 0

	local first_four = 4
	
	while ((first_four > 0) and (value > 0)) do
	
		x_value = x_value + 60
		
		value = value - 1
		first_four = first_four - 1
		
	end
	
	if value ~= 0 then
	
		x_value = 20
		y_value = y_value + 60
	
		local second_four = 4
		
		while ((second_four > 0) and (value > 0)) do

			x_value = x_value + 60
		
			value = value - 1
			second_four = second_four - 1
		
		end
	
	end
	
	if value ~= 0 then
	
		x_value = 20
		y_value = y_value + 60
	
		local third_four = 4
		
		while ((third_four > 0) and (value > 0)) do

			x_value = x_value + 60
		
			value = value - 1
			third_four = third_four - 1
		
		end
	
	end
	
	if value ~= 0 then
	
		x_value = 20
		y_value = y_value + 60
	
		local final_four = 4
		
		while ((final_four > 0) and (value > 0)) do

			x_value = x_value + 60
		
			value = value - 1
			final_four = final_four - 1
		
		end
	
	end
	
	return x_value, y_value
	
end

--Determines which piece is under the cursor for movePiece(),
--returns 17 if no piece is present
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
	end
	
	--Return 17 if no piece is present
	return 17

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
	if ((piece_position == 1) or (piece_position == 5) or (piece_position == 9) or (piece_position == 13)) then
		move_left = false
	end
	if ((piece_position == 4) or (piece_position == 8) or (piece_position == 12) or (piece_position == 16)) then
		move_right = false
	end
	if ((piece_position == 1) or (piece_position == 2) or (piece_position == 3) or (piece_position == 4)) then
		move_up = false
	end
	if ((piece_position == 13) or (piece_position == 14) or (piece_position == 15) or (piece_position == 16)) then
		move_down = false
	end
	
	--Test which directions are still true and then whether one is empty
	if (move_left) then
		if (determinePiece(piece_position - 1) ~= 17) then
			move_left = false
		end
	end
	if (move_right) then
		if (determinePiece(piece_position + 1) ~= 17) then
			move_right = false
		end
	end
	if (move_up) then
		if (determinePiece(piece_position - 4) ~= 17) then
			move_up = false
		end
	end
	if (move_down) then
		if (determinePiece(piece_position + 4) ~= 17) then
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
			one_val = one_val - 4
		elseif direction == 4 then
			one_val = one_val + 4
		end
	elseif piece == 2 then
		if direction == 1 then
			two_val = two_val - 1
		elseif direction == 2 then
			two_val = two_val + 1
		elseif direction == 3 then
			two_val = two_val - 4
		elseif direction == 4 then
			two_val = two_val + 4
		end
	elseif piece == 3 then
		if direction == 1 then
			three_val = three_val - 1
		elseif direction == 2 then
			three_val = three_val + 1
		elseif direction == 3 then
			three_val = three_val - 4
		elseif direction == 4 then
			three_val = three_val + 4
		end
	elseif piece == 4 then
		if direction == 1 then
			four_val = four_val - 1
		elseif direction == 2 then
			four_val = four_val + 1
		elseif direction == 3 then
			four_val = four_val - 4
		elseif direction == 4 then
			four_val = four_val + 4
		end
	elseif piece == 5 then
		if direction == 1 then
			five_val = five_val - 1
		elseif direction == 2 then
			five_val = five_val + 1
		elseif direction == 3 then
			five_val = five_val - 4
		elseif direction == 4 then
			five_val = five_val + 4
		end
	elseif piece == 6 then
		if direction == 1 then
			six_val = six_val - 1
		elseif direction == 2 then
			six_val = six_val + 1
		elseif direction == 3 then
			six_val = six_val - 4
		elseif direction == 4 then
			six_val = six_val + 4
		end
	elseif piece == 7 then
		if direction == 1 then
			seven_val = seven_val - 1
		elseif direction == 2 then
			seven_val = seven_val + 1
		elseif direction == 3 then
			seven_val = seven_val - 4
		elseif direction == 4 then
			seven_val = seven_val + 4
		end
	elseif piece == 8 then
		if direction == 1 then
			eight_val = eight_val - 1
		elseif direction == 2 then
			eight_val = eight_val + 1
		elseif direction == 3 then
			eight_val = eight_val - 4
		elseif direction == 4 then
			eight_val = eight_val + 4
		end
	elseif piece == 9 then
		if direction == 1 then
			nine_val = nine_val - 1
		elseif direction == 2 then
			nine_val = nine_val + 1
		elseif direction == 3 then
			nine_val = nine_val - 4
		elseif direction == 4 then
			nine_val = nine_val + 4
		end
	elseif piece == 10 then
		if direction == 1 then
			ten_val = ten_val - 1
		elseif direction == 2 then
			ten_val = ten_val + 1
		elseif direction == 3 then
			ten_val = ten_val - 4
		elseif direction == 4 then
			ten_val = ten_val + 4
		end
	elseif piece == 11 then
		if direction == 1 then
			eleven_val = eleven_val - 1
		elseif direction == 2 then
			eleven_val = eleven_val + 1
		elseif direction == 3 then
			eleven_val = eleven_val - 4
		elseif direction == 4 then
			eleven_val = eleven_val + 4
		end
	elseif piece == 12 then
		if direction == 1 then
			twelve_val = twelve_val - 1
		elseif direction == 2 then
			twelve_val = twelve_val + 1
		elseif direction == 3 then
			twelve_val = twelve_val - 4
		elseif direction == 4 then
			twelve_val = twelve_val + 4
		end
	elseif piece == 13 then
		if direction == 1 then
			thirteen_val = thirteen_val - 1
		elseif direction == 2 then
			thirteen_val = thirteen_val + 1
		elseif direction == 3 then
			thirteen_val = thirteen_val - 4
		elseif direction == 4 then
			thirteen_val = thirteen_val + 4
		end
	elseif piece == 14 then
		if direction == 1 then
			fourteen_val = fourteen_val - 1
		elseif direction == 2 then
			fourteen_val = fourteen_val + 1
		elseif direction == 3 then
			fourteen_val = fourteen_val - 4
		elseif direction == 4 then
			fourteen_val = fourteen_val + 4
		end
	elseif piece == 15 then
		if direction == 1 then
			fifteen_val = fifteen_val - 1
		elseif direction == 2 then
			fifteen_val = fifteen_val + 1
		elseif direction == 3 then
			fifteen_val = fifteen_val - 4
		elseif direction == 4 then
			fifteen_val = fifteen_val + 4
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
	
end

--Checks if each piece is in the correct position, makes solved = true when condition is met
function checkIfSolved()

	if ((one_val == 1) and (two_val == 2) and (three_val == 3) and (four_val == 4) and (five_val == 5) and (six_val == 6) and (seven_val == 7) and (eight_val == 8) and (nine_val == 9) and (ten_val == 10) and (eleven_val == 11) and (twelve_val == 12) and (thirteen_val == 13) and (fourteen_val == 14) and (fifteen_val == 15)) then
		solved = true
	end
	
end

--Returns a random spot that is not yet being used
function randomSpot()

	unique = false
	randomTemp = 0

	while (unique == false) do
	
		unique = true
		randomTemp = math.random(1,16)
	
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
		end
	end
	
	return randomTemp

end

--Checks if the current layout is solvable
function isSolvable()
	
	inversions = 0
	
	array = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	
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
	
	--Determine the row that the "blank" is on, true if it is even, false if odd
	evenRow = false
	for a=1, 4 do
		if (array[a] == 0) then
			evenRow = true
		end
	end
	for b=9, 12 do
		if(array[b] == 0) then
			evenRow = true
		end
	end
			
	
	for i=1, 15 do
		
		for j=i, 16 do
			
			if ((array[j] < array[i]) and (array[j] > 0)) then	
				inversions = inversions + 1
			end
			
		end
		
	end
	
	if (evenRow) then
		if ((inversions % 2) ~= 0) then
			solvable = true
		end
	else
		if ((inversions % 2) == 0) then
			solvable = true
		end
	end
	
end