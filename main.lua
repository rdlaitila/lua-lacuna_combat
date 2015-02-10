game      = require('game.init')
runtime   = nil

--
-- Called upon love2d startup, after boostrap & config
--
function love.load()  -- Load appropriate game runtime
    game.lib.lovebird.wrapprint = true
    
    if ARGS["SERVER"] == true then
        print("Starting Lacuna Server")
        runtime = game.runtime.Server()
        game.lib.lovebird.port = 8001        
    else
        runtime = game.runtime.Client()
        game.lib.lovebird.port = 8000        
    end    
    
    runtime:load()
end

--
-- Main Love2d update loop
--
function love.update(DT)
    --game.lib.lovebird.update(DT)
    runtime:update(DT)
end

--
-- Main love2d draw loop
--
function love.draw()    
    runtime:draw()    
end

--
-- Main love2d mousepressed callback
--
function love.mousepressed(X, Y, BUTTON)
    runtime:mousepressed(X, Y, BUTTON)
end

--
-- Main love2d mousereleased callback
--
function love.mousereleased(X, Y, BUTTON)
    runtime:mousereleased(X, Y, BUTTON)
end

--
-- Main love2d keypressed callback
--
function love.keypressed(KEY, IS_REPEAT)
    runtime:keypressed(KEY, IS_REPEAT)
end

--
-- Main love2d keyreleased callback
--
function love.keyreleased(KEY)
    runtime:keyreleased(KEY)
end

--
-- Main love2d focus callback
--
function love.focus(FOCUS)
    runtime:focus(FOCUS)
end

--
-- Main love2d quit callback
--
function love.quit()
    runtime:quit()
end