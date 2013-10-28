-----------------------------------------------------------------------------------------
--
-- contactmap.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--       unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view

-- Create a native MapView (requires XCode Simulator build or device build)
--Here map is set to display 0px from left, 20px from top, 320px wide, 400px long
local myMap = native.newMapView( 0, 20, 320, 400)
myMap.mapType = "standard" -- other mapType options are "satellite" or "hybrid"

local marker= myMap:addMarker(  53.364901, -6.262876, {title="Neighbour", subtitle="next door" } )


-- Initializes map to a location in China
--myMap:setCenter( 37.331692, -122.030456 )

local function callMap()
        -- Fetch the user's current location
        -- Note: in XCode Simulator, the current location defaults to Apple headquarters in Cupertino, CA
        local currentLocation = myMap:getUserLocation()
        local currentLatitude = currentLocation.latitude
        local currentLongitude = currentLocation.longitude

        -- Move map so that current location is at the center
        myMap:setCenter( currentLatitude, currentLongitude, true )

        -- Look up nearest address to this location (this is returned as a "mapAddress" event, handled above)
        myMap:nearestAddress( currentLatitude, currentLongitude )
end

-- A function to handle the "mapAddress" event (also known as "reverse geocoding")
--Nothing happens when this is called. 
local mapAddressHandler = function( event )
        local locationText =
                "Latitude: " .. currentLatitude .. 
                ", Longitude: " .. currentLongitude ..
                ", Address: " .. event.streetDetail .. " " .. event.street ..
                ", " .. event.city ..
                ", " .. event.region ..
                ", " .. event.country ..
                ", " .. event.postalCode

        local alert = native.showAlert( "You Are Here", locationText, { "OK" } )
end

-- A listener for the address lookup result
-- (This could also be a table listener on the map itself, in case you have more than one simultaneous map.)
Runtime:addEventListener( "mapAddress", mapAddressHandler )

timer.performWithDelay( 1000, callMap )         -- get current location after 1 second
--print ("test2")


    --- create a white background to fill screen
    local bg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
    bg:setFillColor( 255 )  -- white

    -- create some text
    local title = display.newRetinaText( "First View", 0, 0, native.systemFont, 32 )
    title:setTextColor( 0 ) -- black
    title:setReferencePoint( display.CenterReferencePoint )
    title.x = display.contentWidth * 0.5
    title.y = 125

    local summary = display.newRetinaText( "Loaded by the first tab 'onPress' listener\n— specified in the 'tabButtons' table.", 0, 0, 292, 292, native.systemFont, 14 )
    summary:setTextColor( 0 ) -- black
    summary:setReferencePoint( display.CenterReferencePoint )
    summary.x = display.contentWidth * 0.5 + 10
    summary.y = title.y + 215

    -- all objects must be added to group (e.g. self.view)
    group:insert( bg )
    group:insert( title )
    group:insert( summary )
    group:insert( myMap )
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view

    -- Do nothing
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view

    -- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)

end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
    local group = self.view

    -- INSERT code here (e.g. remove listeners, remove widgets, save state variables, etc.)

end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene