--
-- Define class
--
local ClientMenu = upperclass:define("ClientMenu")

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
    
    lure.load("lib/lure/tests/layout/block-layouts/index.html")
end

function public:leave()
end

function public:suspend()
end

function public:resume()
end

function public:update(DT)   
    lure.update(DT)
end

function public:draw()
    love.graphics.print("-=Client Menu=-", 0, 0)    
    love.graphics.print("1.) Connect To Server", 0, 15)
    lure.draw()
end

function public:focus()
end

function public:keypressed(KEY, IS_REPEAT)    
    if KEY == "1" then
        self.runtime.gamestateManager:push(self.runtime.gamestates.clientlobby, self.runtime, "127.0.0.1", 6000)
    end
end

function public:keyreleased()
end

function public:mousepressed()
end

function public:mousereleased()
end

function public:joystickpressed()
end

function public:joystickreleased()
end

function public:quit()
end

--
-- Compile class
--
return upperclass:compile(ClientMenu)