local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Server Runtime Class
--
local ServerRuntime = game.lib.upperclass:define('ServerRuntime')

--
-- Holds our Network Manager
--
property : networkManager { 
    nil;
    get='public'; 
    set='private'
}

--
-- Holds our Gamestate Manager
--
property : gamestateManager {
    nil;
    get='public',
    set='private'
}

--
-- Holds our gamestates
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
    game.lib.lovebird.port = 8001
    self.gamestates = {
        serverLobby = game.states.ServerLobby()
    }
    self.networkManager = game.classes.NetworkManager()
    self.gamestateManager = game.classes.GamestateManager()
end

--
-- Load callback
--
function public:load()
    self.gamestateManager:push(self.gamestates.serverLobby, self)    
end

--
-- Update callback
--
function public:update(DT)  
    game.lib.lovebird.update(DT)
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
return game.lib.upperclass:compile(ServerRuntime)