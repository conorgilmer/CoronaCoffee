-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Assignment 2 - based on Coffee Menu Example
-- by Conor Gilmer (conor.gilmer@gmail.com)
-----------------------------------------------------------------------------------------

local storyboard = require("storyboard")
local widget = require("widget")

display.setStatusBar( display.HiddenStatusBar )
-- Screen dimensions
local _W = display.contentWidth 
local _H = display.contentHeight

_G.lastScene = "homemenu"

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc.):

local function segmentedControlListener( event )

	local menuItemName = event.target.segmentLabel  -- get menu item selected name
	local currentSceneName = storyboard.getCurrentSceneName() --get current scene/page name
	
  --if menu item is selected go to that scene(page)
	if menuItemName == 'Home' then
		navbar.isVisible = false
		storyboard.gotoScene('homemenu')
  
	elseif (menuItemName == 'Products') and (currentSceneName ~= 'products') then
		navbar.isVisible = true
		storyboard.gotoScene('products')
	
  elseif (menuItemName == 'About') and (currentSceneName ~= 'about') then
		navbar.isVisible = true
		storyboard.gotoScene('about')
	
  elseif (menuItemName == 'Contact') and (currentSceneName ~= 'contact') then
		navbar.isVisible = true
		storyboard.gotoScene('contact')
  
  --else
  --  navbar.isVisible = false
	--	storyboard.gotoScene('homemenu')
	
  end -- end of if

end -- end  of segmentedControlleListener function

--navbar(topmenu) widget
navbar = widget.newSegmentedControl 
{
    left = 0,
    top = 0,
    segmentWidth = _W/4,
    segments = { "Home", "Products", "About", "Contact" },
    defaultSegment = 1,
    onPress = segmentedControlListener,
}
--navbar is not visible by default needs to be set on scenes
navbar.isVisible = false 

--load the homemenu page
storyboard.gotoScene( "homemenu" )