local GameState = require('game.classes.gamestate')

--
-- Define class
--
local ClientMenu = upperclass:define("ClientMenu", GameState)

--
-- Holds a reference to our runtime which we need for various sub-systems
-- the runtime object is obtained through the enter() method
--
property : runtime {
    {};
    get='public';
    set='private';
}


private.connectToServer = false
private.connectToServerInput = ""

function public:enter(RUNTIME)    
    self.runtime = RUNTIME
end

function public:draw()
    love.graphics.print("-=Client Menu=-", 0, 0)    
    love.graphics.print("1.) Connect To Server", 0, 15)    
end

function public:keypressed(KEY, IS_REPEAT)    
    if KEY == "1" then
        self.runtime.gamestateManager:push(self.runtime.gamestates.clientlobby, self.runtime, "127.0.0.1", 6000)
    end
end

--
-- Compile class
--
return upperclass:compile(ClientMenu)