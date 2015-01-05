--
-- Define Class
--
local GameState = upperclass:define("GameState")

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
return upperclass:compile(GameState)

