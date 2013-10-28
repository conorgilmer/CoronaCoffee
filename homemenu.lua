----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local widget = require("widget")

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
	background = display.newImageRect ( "background.jpg", 320,480)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	group:insert(background)

  -- page title text ... Logo?
	message = display.newText( "Cafe Libre", 160, 50, nil, 60 )
	message.x = display.contentWidth/2
	message.y = display.contentHeight/5
	group:insert(message)


    aboutArrow = display.newImageRect ( "arrowRight.png", 60,60)
    aboutArrow.x = display.contentWidth/2 + 100
	  aboutArrow.y = display.contentHeight/2 - 80
    group:insert(aboutArrow)


    productsArrow = display.newImageRect ( "arrowRight.png", 60,60)
    productsArrow.x = display.contentWidth/2 + 100
	  productsArrow.y = display.contentHeight/2 
    group:insert(productsArrow)


    contactArrow = display.newImageRect ( "arrowRight.png", 60,60)
    contactArrow.x = display.contentWidth/2 + 100
	contactArrow.y = display.contentHeight/2 + 80
    group:insert(contactArrow)

--endEvent Handlers
    button1 = widget.newButton(
	{
		id= "button 1",
		left = 0,
		top = 0,
		label = "Home",
		width = 80,
		height = 32,
		font = Helvetica,
		fontSize = 15,
		labelColor = {
				default={0,0,0},
				over= {255,255,255}
		},
		defaultColor={201,107,61},
		overColor = {219,146,85},
		onPress = btnOnPressHandler ,
		onDrag = btnOnDragHandler,
		onRelease = btnOnReleaseHandler
		
	})
	
	button1.x = 40
	button1.y = 16--display.contentHeight/2
	group:insert(button1)
	
	button2 = widget.newButton(
	{
		id= "button 2",
		left = 0,
		top = 0,
		label = "Products",
		width = 80,
		height = 32,
		font = Helvetica,
		fontSize = 15,
		labelColor = {
				default={0,0,0},
				over= {255,255,255}
		},
		defaultColor={201,107,61},
		overColor = {219,146,85},
		onPress = btnOnPressHandler ,
		onDrag = btnOnDragHandler,
		onRelease = btnOnReleaseHandler
		
	})
	
	button2.x = 120
	button2.y = 16 --display.contentHeight/2
	group:insert(button2)
	
	  button3 = widget.newButton(
	{
		id= "button 3",
		left = 0,
		top = 0,
		label = "about",
		width = 80,
		height = 32,
		font = Helvetica,
		fontSize = 15,
		labelColor = {
				default={0,0,0},
				over= {255,255,255}
		},
		defaultColor={201,107,61},
		overColor = {219,146,85},
		onPress = btnOnPressHandler ,
		onDrag = btnOnDragHandler,
		onRelease = btnOnReleaseHandler
		
	})
	
	button3.x = 200
	button3.y = 16 --display.contentHeight/2
	group:insert(button3)
	
    button4 = widget.newButton(
	{
		id= "button 4",
		left = 0,
		top = 0,
		label = "Contact",
		width = 80,
		height = 32,
		font = Helvetica,
		fontSize = 15,
		labelColor = {
				default={0,0,0},
				over= {255,255,255}
		},
		defaultColor={201,107,61},
		overColor = {219,146,85},
		onPress = btnOnPressHandler ,
		onDrag = btnOnDragHandler,
		onRelease = btnOnReleaseHandler
		
	})
	
	button4.x = 280
	button4.y = 16 --display.contentHeight/2
	group:insert(button4)

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
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	message:setTextColor( 255,0,0 )

	aboutArrow:addEventListener ("touch", about)
	productsArrow:addEventListener ("touch", products)
	contactArrow:addEventListener ("touch", contact)
	
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