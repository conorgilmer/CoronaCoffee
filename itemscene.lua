----------------------------------------------------------------------------------
--
-- itemscene.lua
--
-- takes the parameters passed (Options) from the Products sand displays their
-- individual information on a page
--
-- by Conor Gilmer
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Screen dimensions
local _W = display.contentWidth 
local _H = display.contentHeight
local _C = display.CenterReferencePoint -- not so sure about this

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


-- Wrap text
function wrap(str, limit, indent, indent1)
  indent = indent or ""
  indent1 = indent1 or indent
  limit = limit or 72
  local here = 1-#indent1
  return indent1..str:gsub("(%s+)()(%S+)()",
                          function(sp, st, word, fi)
                            if fi-here > limit then
                              here = st - #indent
                              return "\n"..indent..word
                            end
                          end)
end
 
function explode(div,str)
  if (div=='') then return false end
  local pos,arr = 0,{}
  -- for each divider found
  for st,sp in function() return string.find(str,div,pos,true) end do
    table.insert(arr,string.sub(str,pos,st-1)) -- Attach chars left of current divider
    pos = sp + 1 -- Jump past current divider
  end
  table.insert(arr,string.sub(str,pos)) -- Attach chars right of last divider
  return arr
end
 
 
function wrappedText(str, limit, size, font, color, indent, indent1)
        str = explode("\n", str)
        size = tonumber(size) or 12
        color = color or {255, 255, 255}
        font = font or "Helvetica"      
 
        --apply line breaks using the wrapping function
        local i = 1
        local strFinal = ""
    while i <= #str do
                strW = wrap(str[i], limit, indent, indent1)
                strFinal = strFinal.."\n"..strW
                i = i + 1
        end
        str = strFinal
        
        --search for each line that ends with a line break and add to an array
        local pos, arr = 0, {}
        for st,sp in function() return string.find(str,"\n",pos,true) end do
                table.insert(arr,string.sub(str,pos,st-1)) 
                pos = sp + 1 
        end
        table.insert(arr,string.sub(str,pos)) 
                        
        --iterate through the array and add each item as a display object to the group
        local g = display.newGroup()
        local i = 1
    while i <= #arr do
                local t = display.newText( arr[i], 0, 0, font, size )    
                t:setTextColor( color[1], color[2], color[3] )
                t.x = math.floor(t.width/2)
                t.y = (size*1.3)*(i-1)
                g:insert(t)
                i = i + 1
        end
        return g
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	navbar.isVisible = true
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	local params = event.params
      	  print(params.var1) -- Title
      	  print(params.var2) -- Subtitle
      	  print(params.var3) -- image

   --local textMessage = display.newText( "Hello Corona User!nHope you're having a great day.", 160, 325, "Helvetica", 18 )
   --textMessage:setTextColor( 7 )
  -- group:insert(textMessage)
--local myText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc euismod justo sapien, at sollicitudin lacus. Quisque vestibulum commodo felis id posuere."
--local myTextObject = wrappedText( myText, 46, 16, "Helvetica", {255, 0, 0} )
--local myGroup = display.newGroup()
--group:insert( myTextObject )
 
   -- set background to be white
  local background = display.newRect(0, 0, _W, _H)
  background:setFillColor(255)   
  group:insert(background)
  
  -- display text (user black text)
  local title = display.newText(params.var1, 0, 0, native.systemFont, 32 )
  title:setTextColor(0)      
  title:setReferencePoint(_C)
  title.x = _W * 0.5
  title.y = 100
  group:insert(title)
  
  -- get passed image and display
  itemImage = display.newImageRect ( params.var3, 60,60)
  itemImage.x = (_W/4) *3 
	itemImage.y = 200
  group:insert(itemImage)

  -- page content text
  -- todo import this text or format it using html? embed map?
  local description = display.newText(params.var2, 0, 0, 300, 300, native.systemFont, 14)
  description:setTextColor(0) -- black
  description:setReferencePoint(_C)
  description.x = _W * 0.5 + 10
  description.y = title.y + 200
  group:insert(description)

 
 
 

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