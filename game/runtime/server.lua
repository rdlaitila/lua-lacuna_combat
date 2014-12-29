local ServerRuntime = upperclass:define('ServerRuntime')

local host = enet.host_create("localhost:6789")

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
    hump.gamestate.push(self.gamestates.serverlobby)
end

--
-- Update callback
--
function public:update(DT)    
    local event = host:service()
    if event ~= nil then
        if event.type == "receive" then
            print("Got message: ", event.data, event.peer)            
        elseif event.type == "connect" then
            print(event.peer .. " connected.")
        elseif event.type == "disconnect" then
            print(event.peer .. " disconnected.")
        end
        event = host:service()
    end
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
    hump.gamestate.mousereleased(X, Y, BUTTON)
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