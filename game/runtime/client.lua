local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Client runtime class
--
local ClientRuntime = game.lib.upperclass:define('ClientRuntime')

--
-- Holds our Network Manager
--
property : networkManager { 
    nil;
    get='public'; 
    set='private';
    type='any'
}

--
-- Holds our Gamestate Manager
--
property : gamestateManager {   
    nil;
    get='public';
    set='private';
    type='any';
}

--
-- Holds our gamestate objects
--
property : gamestates {
    nil;
    get='public';
    set='private';
    type='table';
}

--
-- Class Constructor
--
function private:__construct()    
    self.gamestates = {
        clientMenu              = game.states.ClientMenu();
        clientLobby             = game.states.ClientLobby();
        clientShipBuilder       = game.states.ClientShipBuilder();
        clientShipPlayground    = game.states.ClientShipPlayground();
    }
    
    self.networkManager = game.classes.NetworkManager()    
    self.gamestateManager = game.classes.GamestateManager()    
end

--
-- Load callback
--
function public:load()    
    self.gamestateManager:push(self.gamestates.clientMenu, self)        
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
return game.lib.upperclass:compile(ClientRuntime)