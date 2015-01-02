--
-- Server Runtime Class
--
local ServerRuntime = upperclass:define('ServerRuntime')

--
-- Holds our Network Manager
--
property : networkManager { 
    require('game.classes.networkmanager')(); 
    get='public'; 
    set='private'
}

--
-- Holds our Gamestate Manager
--
property : gamestateManager {
    require('game.classes.gamestatemanager')(),
    get='public',
    set='private'
}

--
-- Holds our gamestates
--
private.gamestates = {
    serverlobby = require('game.states.serverlobby')
}

--
-- Load callback
--
function public:load()          
    self.gamestateManager:push(self.gamestates.serverlobby, self)    
end

--
-- Update callback
--
function public:update(DT)    
    self.networkManager:update(DT)
    self.gamestateManager:update(DT)
end

--
-- Draw callback
--
function public:draw()
    self.gamestateManager:draw()   
end

--
-- Keypressed callback
--
function public:keypressed(KEY, IS_REPEAT)
    --hump.gamestate.keypressed(KEY, IS_REPEAT)
end

--
-- Keyreleased callback
--
function public:keyreleased(KEY)
    --hump.gamestate.keyreleased(KEY)
end

--
-- Mousepressed callback
--
function public:mousepressed(X, Y, BUTTON)
    --hump.gamestate.mousepressed(X, Y, BUTTON)
end

--
-- Mousereleased callback
--
function public:mousereleased(X, Y, BUTTON)    
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
return upperclass:compile(ServerRuntime)