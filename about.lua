-----------------------------------------------------------------------------------------
--
-- about.lua
-- by conorgilmer@gmail.com
--
-- Just about information
-- black text on white background
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Screen dimensions
local _W = display.contentWidth 
local _H = display.contentHeight
local _C = display.CenterReferencePoint

----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
  -- set background to be white
  local background = display.newRect(0, 0, _W, _H)
  background:setFillColor(255)   
  group:insert(background)
  

  -- set generic navbar (menu) to true
  navbar.isVisible = true
  
  -- display text (user black text)
  local title = display.newText("About Us.", 0, 0, native.systemFont, 32 )
  title:setTextColor(0)      
  title:setReferencePoint(_C)
  title.x = _W * 0.5
  title.y = 100
  group:insert(title)
  
  -- page content text
  -- todo import this text or format it using html? embed map?
  local description = display.newText("Cafe Libre\n\tIs a cafe which specialises in coffees, teas and continential cuisine. Located in the historic heart of dublin the cafe is famous for our blend of teas, and brewed coffees from around the world.\n \tDunk your favorite biscuit from our range of biscuits, you can also select from our range of snack foods.", 0, 0, 300, 300, native.systemFont, 14)
  description:setTextColor(0) -- black
  description:setReferencePoint(_C)
  description.x = _W * 0.5 + 10
  description.y = title.y + 200
  group:insert(description)
  

  -- show logo at bottom of page
  local logoImage = display.newImageRect ("cafelogo.png", 320,100)
  logoImage.x = (_W/2)
	logoImage.y = _H-100
  group:insert(logoImage)
  

	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
  
  -- set generic navbar (menu) to true
  navbar.isVisible = true
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	--message:setTextColor( 255,0,0 )

	--rightArrow:addEventListener ("touch", right)
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene