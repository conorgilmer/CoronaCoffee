-----------------------------------------------------------------------------------------
--
-- contact.lua
-- by conorgilmer@gmail.com
--
-- Just list the contact details information
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

function right (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "coffees" )
    end
end


function left (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "teas" )
	end
end



function openGoogleMaps (event)
   --Latitude & longtitude updated to from www.geocoder.com
  lat = 53.341946
  lng = -6.283815
	url = "http://maps.google.com/maps?z=12&t=m&q=loc:"..lat.."+"..lng
  system.openURL( url )        
 end -- end opengooglemaps
  
  
 function phoneCall (event)
   if event.phase == "ended" then
      system.openURL( "tel:0035386068764")
       --print("tel")
    end --endif
end -- end phonecall

function sendMail (event)
   if event.phase == "ended" then
        system.openURL( "mailto:conor.gilmer@gmail.com")
        --print("mail")
   end --endif
end -- end sendmail
	

--function openLink (event)
	--	url = "http://www.appwayz.com"
    ---url = event.object2
     --    system.openURL( url )        
	--end
	
-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	--background = display.newImageRect ( "sceneB G.png", 320,480)
	--background.x = display.contentWidth/2
	--background.y = display.contentHeight/2
	--group:insert(background)

	--message = display.newText( "CONTACTS", 160, 50, nil, 60 )
	--message.x = display.contentWidth/2
	--message.y = display.contentHeight/2
	--group:insert(message)


  --rightArrow = display.newImageRect ( "arrowRight.png", 60,60)
  --rightArrow.x = display.contentWidth/2 + 100
	--rightArrow.y = display.contentHeight/2 + 80
  --group:insert(rightArrow)


  -- set background to be white
  local background = display.newRect(0, 0, _W, _H)
  background:setFillColor(255)   
  group:insert(background)
  
  -- display text (user black text)
  local title = display.newText("Contact Details", 0, 0, native.systemFont, 32 )
  title:setTextColor(0)      
  title:setReferencePoint(_C)
  title.x = _W * 0.5
  title.y = 100
  group:insert(title)
  
  -- page content text
  -- todo import this text or format it using html? embed map?
  --local description = display.newText("Cafe Libre\nCrane Street,\nThomas Street,\nDublin 2.\n\nPhone: 01-8118055\nEmail:conor.gilmer@gmail.com\nSkype:cafelibred2\nFacebook:www.facebook.com/cafelibred2\nTwitter:www.twitter.com/cafelibred2", 0, 0, 300, 300, native.systemFont, 14)
  local address = display.newText("Cafe Libre\nCrane Street,\nThomas Street,\nDublin 2.\n\n", 0, 0, 300, 300, native.systemFont, 14)
  address:setTextColor(0) -- black
  address:setReferencePoint(_C)
  address.x = _W * 0.5 + 10
  address.y = title.y + 200
  group:insert(address)
  
  
--Phone: 01-8118055\nEmail:conor.gilmer@gmail.com\nSkype:cafelibred2\nFacebook:www.facebook.com/cafelibred2\nTwitter:www.twitter.com/cafelibred2

local phone = display.newText("Phone: 0868068764\n", 0, 0, 300, 300, native.systemFont, 14)
  phone:setTextColor(0) -- black
  phone:setReferencePoint(_C)
  phone.x = _W * 0.5 + 10
  phone.y = address.y + 90
  group:insert(phone)
  phone:addEventListener("tap", phoneCall)
  
  local emailA = display.newText("Email: conor.gilmer@gmail.com\n", 0, 0, 300, 300, native.systemFont, 14)
  emailA:setTextColor(0) -- black
  emailA:setReferencePoint(_C)
  emailA.x = _W * 0.5 + 10
  emailA.y = phone.y + 20
  group:insert(emailA)
  emailA:addEventListener("tap", sendMail)
  
  local skype = display.newText("Skype: cafelibred2\n", 0, 0, 300, 300, native.systemFont, 14)
  skype:setTextColor(0) -- black
  skype:setReferencePoint(_C)
  skype.x = _W * 0.5 + 10
  skype.y = emailA.y + 20
  group:insert(skype)
  
  local fb = display.newText("Facebook: www.facebook.com/cafelibre\n", 0, 0, 300, 300, native.systemFont, 14)
  fb:setTextColor(0) -- black
  fb:setReferencePoint(_C)
  fb.x = _W * 0.5 + 10
  fb.y = skype.y + 20
  group:insert(fb)
  
  
  local twitter = display.newText("Twitter: www.twitter.com/cafelibre\n", 0, 0, 300, 300, native.systemFont, 14)
  twitter:setTextColor(0) -- black
  twitter:setReferencePoint(_C)
  twitter.x = _W * 0.5 + 10
  twitter.y = fb.y + 20
  group:insert(twitter)
  
  -- show screenshot of the google map and link this image to a browser opening in google maps
  local mapImage = display.newImageRect ("assets/gmap.png", 125,94)
  mapImage.x = (_W/2) +  80
	mapImage.y = title.y  + 80
  group:insert(mapImage)
  mapImage:addEventListener("tap", openGoogleMaps)

  
  --local linkText = display.newText("www.appwayz.com", 0 ,0, 300, 300, native.systemFont, 14)
  --linkText.x = _W *0.5
  --linkText.y = _H -100
  --linkText:addEventListener("tap", goToURL)
  --group:insert(linkText)
  --insert link to google map
  --local gmapsButton = display.newText("Location", 0, 0, native.systemFont, 20)
	--gmapsButton.x = _W/2
	--gmapsButton.y = description.y +50
	--gmapsButton:setTextColor(0, 125, 125)
	--gmapsButton:addEventListener("tap", openGoogleMaps)


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
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	--message:setTextColor( 255,0,0 ) -- cg not using this field for now

	--rightArrow:addEventListener ("touch", right)
	-----------------------------------------------------------------------------
	
  
  -- set generic navbar (menu) to true
  navbar.isVisible = true
  
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