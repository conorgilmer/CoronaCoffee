----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local widget = require("widget")

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

function products (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "products" )
    end
end


function about (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "about" )
	end -- end of if
end -- end of about function

local aboutPressed = function( event )
        --nameField.text = "Button 1 pressed"
        --nameField.text = "hello"
    storyboard.gotoScene( true, "about", "fade", 800  )
end -- end of aboutPressed function

local productPressed = function( event )
        --nameField.text = "Button 1 pressed"
        --nameField.text = "hello"
    storyboard.gotoScene( true, "products", "fade", 800  )
end -- end of productPressed function

local contactPressed = function( event )
        --nameField.text = "Button 1 pressed"
        --nameField.text = "hello"
    storyboard.gotoScene( true, "contact", "fade", 800  )
end -- end of contactPressed function

function contact (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "contact" )
    end --end of if
end -- end of contact function


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
  navbar.isVisible = true -- set navbar to ture
	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
  --set background
	--background = display.newImageRect ( "background.jpg", 320,480)
	--background.x = _W/2
	--background.y = _H/2
	--group:insert(background)
  
     -- set background to be white
  local background = display.newRect(0, 0, _W, _H)
  background:setFillColor(255)   
  group:insert(background)
  

  -- page title text ... Logo?
	--message = display.newText( "Cafe Libre", 160, 50, nil, 60 )
	--message.x = display.contentWidth/2
	--message.y = display.contentHeight/5
	--group:insert(message)


  -- show logo  page
  local logoImage = display.newImageRect ("cafelogo.png", 320,100)
  logoImage.x = (_W/2)
	logoImage.y = 100
  group:insert(logoImage)

    --aboutArrow = display.newImageRect ( "arrowRight.png", 60,60)
    --aboutArrow.x = display.contentWidth/2 + 100
	  --aboutArrow.y = display.contentHeight/2 - 80
    --group:insert(aboutArrow)


    --productsArrow = display.newImageRect ( "arrowRight.png", 60,60)
    --productsArrow.x = _W/2 + 100
	  --productsArrow.y = _H/2 
    --group:insert(productsArrow)


    --contactArrow = display.newImageRect ( "arrowRight.png", 60,60)
    --contactArrow.x = display.contentWidth/2 + 100
	  --contactArrow.y = display.contentHeight/2 + 80
    --group:insert(contactArrow)

--endEvent Handlers
   
	-----------------------------------------------------------------------------
	
   Pbutton = widget.newButton(
	{
		id= "Products button",
		left = 0,
		top = 0,
		label = "Products",
		width = 280,
		height = 64,
		font = Helvetica,
		fontSize = 21,
		labelColor = {
				default={0,0,0},
				over= {255,255,255}
		},
		defaultColor={201,107,61},
		overColor = {219,146,85},
		onPress = productPressed ,
		onDrag = btnOnDragHandler,
		onRelease = btnOnReleaseHandler
		
	})
	
	Pbutton.x = display.contentWidth/2
	Pbutton.y = display.contentHeight/2
	group:insert(Pbutton)

    Abutton = widget.newButton(
	{
		id= "About button",
		left = 0,
		top = 0,
		label = "About",
		width = 280,
		height = 64,
		font = Helvetica,
		fontSize = 21,
		labelColor = {
				default={0,0,0},
				over= {255,255,255}
		},
		defaultColor={201,107,61},
		overColor = {219,146,85},
		onPress = aboutPressed ,
		onDrag = btnOnDragHandler,
		onRelease = btnOnReleaseHandler
		
	})
	
	Abutton.x = display.contentWidth/2
	Abutton.y = (display.contentHeight/2) + 64
	group:insert(Abutton)

  
    Cbutton = widget.newButton(
	{
		id= "Contat button",
		left = 0,
		top = 0,
		label = "Contact",
		width = 280,
		height = 64,
		font = Helvetica,
		fontSize = 21,
		labelColor = {
				default={0,0,0},
				over= {255,255,255}
		},
		defaultColor={201,107,61},
		overColor = {219,146,85},
		onPress = contactPressed,--btnOnPressHandler ,
		onDrag = btnOnDragHandler,
		onRelease = contacts --btnOnReleaseHandler
		
	})
	
	Cbutton.x = display.contentWidth/2
	Cbutton.y = (display.contentHeight/2) + 128
	group:insert(Cbutton)

  
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
  
  -- set generic navbar (menu) to true
  navbar.isVisible = true
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	--message:setTextColor( 255,0,0 )

	--aboutArrow:addEventListener ("touch", about)
	--productsArrow:addEventListener ("touch", products)
	--contactArrow:addEventListener ("touch", contact)
	
	-----------------------------------------------------------------------------
	
end -- end function scene:enterScene


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end -- end function scene:exitScene


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end -- end scene:destroyScene


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