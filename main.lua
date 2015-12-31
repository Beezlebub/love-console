local console = require 'console'

function love.load()
  -- Step 1: load console, parameters are optional, defaults enumerated below
  --  The key to open/close console == `
  --  font size == 14
  --  false = no key repeat by default, pressing (and not releasing backspace) will act in a strange way  
  --  nil == function called when user press return, see console.lua and defaultInputCallback function

  -- It is fine not to run console.load() 
  console.load(love.graphics.newFont("inconsolata/Inconsolata.otf", 16))

  console.defineCommand(
    "hello",
    "World",
    function()     
      console.i("Hello World!!!")
    end
  )
end

function love.update( dt )
  -- Step 2: Make sure that you update console with dt
  console.update(dt)

  -- Use it console.i(msg), console.d(msg), console.e(msg)
  -- if somethingHappend then
  --   console.i("Something ...")
  -- end
end

function love.draw()
  drawGrid()

  -- Step 3: draw console last inside the 'love.draw' function
  console.draw()
end

function love.keypressed(key)
  -- Step 4: let console consume keys so that it can open and close (default `) and consume user input while open
  if console.keypressed(key) then
    return
  end

  if key == "escape" then
    love.event.quit()
  end
end

function love.textinput(t)
  console.textinput(t)
end

function love.resize( w, h )
  -- Step 5: If your application allows a resize-able window, then call console.resize on love.resize
  console.resize(w, h)
end


function love.mousepressed(x, y, button)
  -- Step 6: When the console is open, the mouse scrolls the console text
  if console.mousepressed(x, y, button) then
    return 
  end

end


function drawGrid( )
  for i =0, math.floor(1920/100) do
    for j=0, math.floor(1080/100) do
      if (i + j) % 2 == 0 then
        love.graphics.setColor(255, 255, 255, 200)
      else
        love.graphics.setColor(255, 255, 255, 220)
      end 
      love.graphics.rectangle("fill", i*100, j*100, 100, 100)
    end
  end
end
