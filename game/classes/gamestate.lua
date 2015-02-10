local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Define Class
--
local Gamestate = game.lib.upperclass:define("Gamestate")

function public:leave()
end

function public:suspend()
end

function public:resume()
end

function public:update(DT)       
end

function public:draw()
end

function public:keypressed()
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

function public:focus()
end

--
-- Compile Class
--
return game.lib.upperclass:compile(Gamestate)

