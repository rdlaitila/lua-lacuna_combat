local ServerRuntime = upperclass:define('ServerRuntime')

--
-- Holds our gamestates
--
private.gamestates = {
    serverlobby = require('game.states.serverlobby')
}

function public:load()
    print("Hello Server")
    hump.gamestate.push(private.gamestates.serverlobby)
end

function public:update(DT)        
    hump.gamestate.update(DT)
end

function public:draw()
    --do nothing
end

return upperclass:compile(ServerRuntime)