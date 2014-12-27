local ClientRuntime = upperclass:define('ClientRuntime')

function public:load()
end

function public:update(DT)
end

function public:draw()
    love.graphics.print("Hello Client", 0, 0)
end

return upperclass:compile(ClientRuntime)