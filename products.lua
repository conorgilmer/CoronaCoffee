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
	  storyboard.gotoScene( true, "biscuits", "fade", 500 )
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
	
	--background = display.newImageRect ( "background.jpg", 320,480)
	--background.x = display.contentWidth/2
	--background.y = display.contentHeight/2
	--group:insert(background)
  
     -- set background to be white
  local background = display.newRect(0, 80, _W, _H)
  background:setFillColor(255)   
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
navHeader.y = navBar.y + 40
group:insert(navHeader)
	

	-----------------------------------------------------------------------------
	
	--message = display.newText( "PRODUCTS", 160, 50, nil, 60 )
--	message.x = display.contentWidth/2
--	message.y = 25
--	group:insert(message)

    -- coffee Icon 
    coffeeArrow = display.newImageRect ( "coffees/coffee3.png", 75,75)
    coffeeArrow.x = _W/4
	  coffeeArrow.y = (_H/4) + 20
    group:insert(coffeeArrow)
    -- text beneath icon
    local ctitle =  display.newText( "Coffees", 0, 0, native.systemFontBold, 14 )
    ctitle:setTextColor(0, 0, 0)
    ctitle.x = coffeeArrow.x
    ctitle.y = coffeeArrow.y + 45
    group:insert(ctitle)
    
    -- teas Icon
    teasArrow = display.newImageRect ( "teas/tea9090.png", 75,75)
    teasArrow.x = (_W/4) * 3
	  teasArrow.y = (_H/4) + 20
    group:insert(teasArrow)
    --text beneath icon
    local ttitle =  display.newText( "Teas", 0, 0, native.systemFontBold, 14 )
    ttitle:setTextColor(0, 0, 0)
    ttitle.x = teasArrow.x
    ttitle.y = teasArrow.y + 45
    group:insert(ttitle)
    
    -- biscuits Icon
    biscuitsArrow = display.newImageRect ( "biscuits/chocchip9090.png", 75,75)
    biscuitsArrow.x = (_W/4) 
	  biscuitsArrow.y = (_H/4) * 3
    group:insert(biscuitsArrow)
    --text beneath icon
    local btitle =  display.newText( "Biscuits", 0, 0, native.systemFontBold, 14 )
    btitle:setTextColor(0, 0, 0) 
    btitle.x = biscuitsArrow.x
    btitle.y = biscuitsArrow.y + 45
    group:insert(btitle)
    
    -- food/snacks Icon
    foodArrow = display.newImageRect ( "food/curr9090.png", 75,75)
    foodArrow.x = (_W/4) *3
	  foodArrow.y = (_H/4 ) *3
    group:insert(foodArrow)
    --text beneath icon
    local ftitle =  display.newText( "Food", 0, 0, native.systemFontBold, 14 )
    ftitle:setTextColor(0, 0, 0)
    ftitle.x = foodArrow.x
    ftitle.y = foodArrow.y + 45
    group:insert(ftitle)
    
    --softdrinks Icon
    --softdrinksArrow = display.newImageRect ( "food/curr.jpg", 60,60)
    --softdrinksArrow.x = (_W/4) *3
	  --softdrinksArrow.y = (_H/4 ) *3
    --group:insert(softdrinksArrow)

-- show logo in middle
  local logoImage = display.newImageRect ("cafelogo.png", 320,100)
  logoImage.x = (_W/2)
	logoImage.y = (_H/2) 
  group:insert(logoImage)
  group:insert(navHeader)
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