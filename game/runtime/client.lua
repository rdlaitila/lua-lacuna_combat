--
-- Client runtime class
--
local ClientRuntime = upperclass:define('ClientRuntime')

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
-- Holds our client states
--
public.gamestates = {
    clientmenu = require('game.states.clientmenu'),
    clientlobby = require('game.states.clientlobby')
}

--
-- Load callback
--
function public:load()        
    self.gamestateManager:push(self.gamestates.clientmenu, self)
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
    self.gamestateManager:keypressed(KEY, IS_REPEAT)
end

--
-- Keyreleased callback
--
function public:keyreleased(KEY)
    self.gamestateManager:keyreleased(KEY)
end

--
-- Mousepressed callback
--
function public:mousepressed(X, Y, BUTTON)
    self.gamestateManager:mousepressed(X, Y, BUTTON)
end

--
-- Mousereleased callback
--
function public:mousereleased(X, Y, BUTTON)
    self.gamestateManager:mousereleased(X, Y, BUTTON)
end

-- 
-- Focus callback
--
function public:focus(FOCUS)
    self.gamestateManager:focus(FOCUS)
end

--
-- Quick callback
--
function public:quit()
    self.gamestateManager:quit()
end

--
-- Compile class
--
return upperclass:compile(ClientRuntime)