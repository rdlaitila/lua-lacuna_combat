--
-- Called upon love2d startup, after boostrap & config
--
function love.load()
    -- Require upperclass dependency
    upperclass = require('lib.upperclass.upperclass')
    
    -- Load appropriate game runtime
    if IS_SERVER == true then
        runtime = require('game.runtime.server')        
    else
        runtime = require('game.runtime.client')
    end
    runtime:load()
end

--
-- Main Love2d update loop
--
function love.update(DT)
    runtime:update(DT)
end

--
-- Main love2d draw loop
--
function love.draw()    
    runtime:draw()
end