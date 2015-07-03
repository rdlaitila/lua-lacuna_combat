local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Define Class
--
local Gamestate = game.lib.upperclass:define("Gamestate")

--
-- Holds a reference to our runtime which we need for various sub-systems
-- the runtime object is obtained through the enter() method
--
property : runtime {
    nil;
    get='public';
    set='protected';
}

--
-- Gamestate Enter
--
function public:enter(RUNTIME)
    self.runtime = RUNTIME
end

--
-- Gamestate Leave
--
function public:leave()
end

--
-- Gamestate Suspend
--
function public:suspend()
end

--
-- Gamestate resume
--
function public:resume()
end

--
-- Gamestate update
--
function public:update(DT)       
end

--
-- Gamestate draw
--
function public:draw()
end

--
-- Gamestate keypressed
--
function public:keypressed()
end

--
-- Gamestate keyreleased
--
function public:keyreleased()
end

--
-- Gamestate mousepressed
--
function public:mousepressed()
end

--
-- Gamestate mousereleased
--
function public:mousereleased()
end

--
-- Gamestate joystickpressed
--
function public:joystickpressed()
end

--
-- Gamestate joystickreleased
--
function public:joystickreleased()
end

--
-- Gamestate quit
--
function public:quit()
end

--
-- Gamestate focus
--
function public:focus()
end

--
-- Compile Class
--
return game.lib.upperclass:compile(Gamestate)

