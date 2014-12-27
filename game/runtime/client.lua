--
-- Client runtime class
--
local ClientRuntime = upperclass:define('ClientRuntime')

--
-- Holds our client states
--
private.gamestates = {
    clientmenu = require('game.states.clientmenu')
}

--
-- Load callback
--
function public:load()
    hump.gamestate.push(self.gamestates.clientmenu)
end

--
-- Update callback
--
function public:update(DT)
    hump.gamestate.update(DT)
end

--
-- Draw callback
--
function public:draw()
    hump.gamestate.draw()       
end

--
-- Keypressed callback
--
function public:keypressed(KEY, IS_REPEAT)
    hump.gamestate.keypressed(KEY, IS_REPEAT)
end

--
-- Keyreleased callback
--
function public:keyreleased(KEY)
    hump.gamestate.keyreleased(KEY)
end

--
-- Mousepressed callback
--
function public:mousepressed(X, Y, BUTTON)
    hump.gamestate.mousepressed(X, Y, BUTTON)
end



-- 
-- Focus callback
--
function public:focus(FOCUS)
end

--
-- Quick callback
--
function public:quit()
end

--
-- Compile class
--
return upperclass:compile(ClientRuntime)