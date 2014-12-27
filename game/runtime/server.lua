local ServerRuntime = upperclass:define('ServerRuntime')

function public:load()
    print("Hello Server")
end

function public:update(DT)
end

function public:draw()
end

return upperclass:compile(ServerRuntime)