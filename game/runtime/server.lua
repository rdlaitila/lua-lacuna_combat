local ServerRuntime = upperclass:define('ServerRuntime')

private.state = require('game.states.serverlobby')

function public:load()
    print("Hello Server")
end

function public:update(DT)    
    self.state:update(DT)
end

function public:draw()
end

return upperclass:compile(ServerRuntime)