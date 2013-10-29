----------------------------------------------------------------------------------
--
-- products.lua
-- by Conor Gilmer (Conor.gilmer@gmail.com)
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- ui library for buttons 
local ui = require("ui") 
local widget = require("widget")
display.setStatusBar( display.HiddenStatusBar ) 

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

function coffees (event)
	if event.phase == "ended" then
	  storyboard.gotoScene( "coffees" )
  end --end of if
end -- end of coffees function

function teas (event)
	if event.phase == "ended" then
	  storyboard.gotoScene( "teas" )
	end -- end if
end -- enf teas function

function biscuits (event)
	if event.phase == "ended" then
	  storyboard.gotoScene( "biscuits" )
	end -- end if
end -- end biscuits function

--function softdrinks (event)
	--if event.phase == "ended" then
	--  storyboard.gotoScene( "food" )
 -- end -- end if
--end -- end softdrinks function


function food (event)
	if event.phase == "ended" then
	  storyboard.gotoScene( "food" )
  end -- end if
end -- end food function


local homemenuPressed = function( event )
        --nameField.text = "Button 1 pressed"
        --nameField.text = "hello"
    print "homemenu pressed"
    storyboard.gotoScene( true, "homemenu", "fade", 800  )
end 



local aboutPressed = function( event )
        --nameField.text = "Button 1 pressed"
        --nameField.text = "hello"
    print "about pressed"
    storyboard.gotoScene( true, "about", "fade", 800  )
end

local contactaPressed = function( event )
        --nameField.text = "Button 1 pressed"
        --nameField.text = "hello"
    print "contact pressed"
    storyboard.gotoScene( true, "contact", "fade", 800  )
end

local productsPressed = function( event )
        --nameField.text = "Button 1 pressed"
        --nameField.text = "hello"
    print "products pressed"
    storyboard.gotoScene( true, "products", "fade", 800  )
end



-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	background = display.newImageRect ( "background.jpg", 320,480)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	group:insert(background)
  
  -- set generic navbar (menu) to true
  navbar.isVisible = true
	--Setup the nav bar 
local navBar = ui.newButton{
	default = "navBar.png",
	onRelease = scrollToTop
}

navBar.x = display.contentWidth*.5
navBar.y = math.floor(display.screenOriginY + navBar.height*0.5) -- screenOriginY is used in cases like iphone 5 where borders are added to screen
group:insert(navBar)

local navHeader = display.newText("Products", 0, 0, native.systemFontBold, 16)
navHeader:setTextColor(255, 255, 255)
navHeader.x = display.contentWidth*.5
navHeader.y = navBar.y
group:insert(navHeader)
	
-- menubar
    nbheight = navBar.y * 2
    button1 = widget.newButton(
	{
		id= "homemenubutton",
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
		onPress = homemenuPressed, --btnOnPressHandler ,
		onDrag = btnOnDragHandler,
		onRelease = homemenu --btnOnReleaseHandler
		
	})
	
	button1.x = 40
	button1.y = 16 + nbheight--display.contentHeight/2
	group:insert(button1)
	
	button2 = widget.newButton(
	{
		id= "products menu button",
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
		onPress = productsPressed, --btnOnPressHandler ,
		onDrag = btnOnDragHandler,
		onRelease = btnOnReleaseHandler
		
	})
	
	button2.x = 120
	button2.y = 16 + nbheight --display.contentHeight/2
	group:insert(button2)
	
	  button3 = widget.newButton(
	{
		id= "about menu button",
		left = 0,
		top = 0,
		label = "About",
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
		onPress = aboutPressed, --btnOnPressHandler ,
		onDrag = btnOnDragHandler,
		onRelease = btnOnReleaseHandler
		
	})
	
	button3.x = 200
	button3.y = 16 + nbheight --display.contentHeight/2
	group:insert(button3)
	
    button4 = widget.newButton(
	{
		id= "contact button",
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
		onPress = contactsPressed, --btnOnPressHandler ,
		onDrag = btnOnDragHandler,
		onRelease = btnOnReleaseHandler
		
	})
	
	button4.x = 280
	button4.y = 16 +nbheight --display.contentHeight/2
	group:insert(button4)

	-----------------------------------------------------------------------------
	
	--message = display.newText( "PRODUCTS", 160, 50, nil, 60 )
--	message.x = display.contentWidth/2
--	message.y = 25
--	group:insert(message)

    -- coffee Icon 
    coffeeArrow = display.newImageRect ( "coffees/coffee3.png", 75,75)
    coffeeArrow.x = _W/4
	  coffeeArrow.y = _H/4
    group:insert(coffeeArrow)
    
    -- teas Icon
    teasArrow = display.newImageRect ( "teas/tea90.png", 75,75)
    teasArrow.x = (_W/4) * 3
	  teasArrow.y = _H/4
    group:insert(teasArrow)
    
    -- biscuits Icon
    biscuitsArrow = display.newImageRect ( "biscuits/chocchip.png", 75,75)
    biscuitsArrow.x = (_W/4) 
	  biscuitsArrow.y = (_H/4) * 3
    group:insert(biscuitsArrow)
    
    -- food/snacks Icon
    foodArrow = display.newImageRect ( "food/curr.jpg", 75,75)
    foodArrow.x = (_W/4) *3
	  foodArrow.y = (_H/4 ) *3
    group:insert(foodArrow)
    
    --softdrinks Icon
    --softdrinksArrow = display.newImageRect ( "food/curr.jpg", 60,60)
    --softdrinksArrow.x = (_W/4) *3
	  --softdrinksArrow.y = (_H/4 ) *3
    --group:insert(softdrinksArrow)


	-----------------------------------------------------------------------------
	
end -- end of scene:createScene function


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	-- show navbar 
  navbar.isVisible = true
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	--message:setTextColor( 255,0,0 )
  -- listen when Icons are clicked
	coffeeArrow:addEventListener ("touch", coffees)
	teasArrow:addEventListener ("touch", teas)
	biscuitsArrow:addEventListener ("touch", biscuits)
	--softdrinksArrow:addEventListener ("touch", softdrinks)
  foodArrow:addEventListener ("touch", food)
	
	
	-----------------------------------------------------------------------------
	
end -- end of scene:enterScene


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end -- end of scene:exitScene


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end --end of scene:destroyScene


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