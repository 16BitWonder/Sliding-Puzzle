local debugPuzzle = assert(loadfile("Debug/debugPuzzle.lua"))
local puzzle3x3 = assert(loadfile("3x3/3x3Puzzle.lua"))
local customPuzzle3x3 = assert(loadfile("Custom3x3/3x3Puzzle.lua"))
local puzzle4x4 = assert(loadfile("4x4/4x4Puzzle.lua"))
local customPuzzle4x4 = assert(loadfile("Custom4x4/4x4Puzzle.lua"))
local puzzle5x5 = assert(loadfile("5x5/5x5Puzzle.lua"))
local customPuzzle5x5 = assert(loadfile("Custom5x5/5x5Puzzle.lua"))

local debugPuzzleEnabled = false

local paused = false
local pauseCursor = 1

local selectionCursor = 1

--Load all images
local mainMenu_top = love.graphics.newImage('Common/mainMenu.png') -- Load main menu top screen background
local mainMenu_bot = love.graphics.newImage('Common/bottom_border.png') -- Load main menu bottom screen background
local selection = love.graphics.newImage('Common/mainMenu_selection.png') -- Load selection menu
local selection_debug = love.graphics.newImage('Common/mainMenu_selection_debugLevel.png') -- Load selection menu (with debug puzzle)
local pause_menu = love.graphics.newImage('Common/pause_menu.png') -- Load the pause menu (on bottom screen)
local r_pause_cursor = love.graphics.newImage('Common/resume_pause_cursor.png') -- Load the pause menu 'resume' cursor
local rtmm_pause_cursor = love.graphics.newImage('Common/returnToMainMenu_pause_cursor.png') -- Load the pause menu 'return to main menu' cursor
local qa_pause_cursor = love.graphics.newImage('Common/quitApplication_pause_cursor.png') -- Load the pause menu 'quit application' cursor
local select135 = love.graphics.newImage('Common/selectionCursor135.png') -- Load selection cursor for options 1, 3, 5,
local select246 = love.graphics.newImage('Common/selectionCursor246.png') -- Load selection cursor for options 2, 4, 6,
local selectDebug = love.graphics.newImage('Common/selectionCursorDebug.png') -- Load selection cursor for debug option

--=================================================================================--
--===                                  Main Program                             ===--
--=================================================================================--

function love.draw()

	love.graphics.setScreen('top')
	love.graphics.draw(mainMenu_top, 0, 0)
	if (debugPuzzleEnabled) then
		love.graphics.draw(selection_debug, 126, 21)
	else
		love.graphics.draw(selection, 126, 39)
	end

	love.graphics.setScreen('bottom')
	love.graphics.draw(mainMenu_bot, 0, 0)
	love.graphics.draw(pause_menu, 81, 61)
	
	if (paused) then
		if (pauseCursor == 1) then
			love.graphics.draw(r_pause_cursor, 129, 79)
		elseif (pauseCursor == 2) then
			love.graphics.draw(rtmm_pause_cursor, 87, 105)
		elseif (pauseCursor == 3) then
			love.graphics.draw(qa_pause_cursor, 99, 131)
		end
	elseif (debugPuzzleEnabled == false) then
		love.graphics.setScreen('top')
		if (selectionCursor == 1) then
			love.graphics.draw(select135, 159, 47)
		elseif (selectionCursor == 2) then
			love.graphics.draw(select246, 135, 74)
		elseif (selectionCursor == 3) then
			love.graphics.draw(select135, 159, 100)
		elseif (selectionCursor == 4) then
			love.graphics.draw(select246, 135, 126)
		elseif (selectionCursor == 5) then
			love.graphics.draw(select135, 159, 153)
		elseif (selectionCursor == 6) then
			love.graphics.draw(select246, 135, 179)
		end
	else
		love.graphics.setScreen('top')
		if (selectionCursor == 1) then
			love.graphics.draw(select135, 159, 29)
		elseif (selectionCursor == 2) then
			love.graphics.draw(select246, 135, 56)
		elseif (selectionCursor == 3) then
			love.graphics.draw(select135, 159, 82)
		elseif (selectionCursor == 4) then
			love.graphics.draw(select246, 135, 108)
		elseif (selectionCursor == 5) then
			love.graphics.draw(select135, 159, 135)
		elseif (selectionCursor == 6) then
			love.graphics.draw(select246, 135, 161)
		elseif (selectionCursor == 7) then
			love.graphics.draw(selectDebug, 153, 188)
		end
	end

end

function love.keypressed(key)
	
	if (key == 'a') then
		if (paused) then
			if (pauseCursor == 1) then
				paused = false
				selectionCursor = 1
			elseif (pauseCursor == 2) then
				paused = false
				selectionCursor = 1
			elseif (pauseCursor == 3) then
				love.event.quit()
			end
		else
			if (selectionCursor == 1) then
				puzzle3x3()
			elseif (selectionCursor == 2) then
				customPuzzle3x3()
			elseif (selectionCursor == 3) then
				puzzle4x4()
			elseif (selectionCursor == 4) then
				customPuzzle4x4()
			elseif (selectionCursor == 5) then
				puzzle5x5()
			elseif (selectionCursor == 6) then
				customPuzzle5x5()
			elseif (selectionCursor == 7) then
				debugPuzzle()
			end
		end
	end
	
	if key == 'dup' then
		if (paused) then
			if (pauseCursor == 1) then
				pauseCursor = 3
			else
				pauseCursor = pauseCursor - 1
			end
		elseif (debugPuzzleEnabled == false) then
			if (selectionCursor == 1) then
				selectionCursor = 6
			else
				selectionCursor = selectionCursor - 1
			end
		else
			if (selectionCursor == 1) then
				selectionCursor = 7
			else
				selectionCursor = selectionCursor - 1
			end
		end
	end
	
	if key == 'ddown' then
		if (paused) then
			if (pauseCursor == 3) then
				pauseCursor = 1
			else
				pauseCursor = pauseCursor + 1
			end
		elseif (debugPuzzleEnabled == false) then
			if (selectionCursor == 6) then
				selectionCursor = 1
			else
				selectionCursor = selectionCursor + 1
			end
		else
			if (selectionCursor == 7) then
				selectionCursor = 1
			else
				selectionCursor = selectionCursor + 1
			end
		end
	end
	
	if key == 'start' then
		if paused == false then
			paused = true
			pauseCursor = 1
		elseif paused == true then
			paused = false
			selectionCursor = 1
		end
	end
	
	if love.keyboard.isDown('lbutton') then
		if love.keyboard.isDown('rbutton') then
			if love.keyboard.isDown('b') then
				debugPuzzleEnabled = true
			end
		end
	end

end