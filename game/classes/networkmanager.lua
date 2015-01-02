require('enet')

--
-- Define class
--
local NetworkManager = upperclass:define("NetworkManager")

--
-- Holds our enet values
--
property : enet { {} ; get='public' ; set='private' }

--
-- Holds our event calbacks
--
property : callbacks { {
    connect = {},
    disconnect = {},
    receive = {}
} ; get='public' ; set='private' }

--
-- Class Constructor
--
function private:__construct()
end

--
-- Creates a new Enet UDP server
--
function public:serve(ADDRESS, PORT, MAX_CLIENTS)
    self.enet.host = enet.host_create(ADDRESS..":"..PORT, MAX_CLIENTS)
end

--
-- Connects to a Enet UDP server
--
function public:connect(ADDRESS, PORT)
    self.enet.host = enet.host_create()
    self.enet.server = self.enet.host:connect(ADDRESS..":"..PORT)
end

--
-- Processes data
--
function public:update(DT)
    -- Halt update if we have no host defined
    if self.enet.host == nil then
        return
    end
    
    -- Process network events and call registered callbacks
    local netevent = self.enet.host:service()
    if netevent then
        local passargs = {netevent.data, netevent.peer}
        if netevent.type == "receive" then
            for a=1, #self.callbacks.receive do
                self:invokeCallback(self.callbacks.receive[a], {netevent})
            end
        elseif netevent.type == "connect" then
            for a=1, #self.callbacks.connect do
                self:invokeCallback(self.callbacks.connect[a], {netevent})
            end
        elseif netevent.type == "disconnect" then
            for a=1, #self.callbacks.disconnect do
                self:invokeCallback(self.callbacks.disconnect[a], {netevent})
            end
        end
    end
end

--
-- Registers a callback
--
function public:registerCallback(TYPE, CALLBACK)
    if TYPE:lower() == "connect" then
        table.insert(self.callbacks.connect, CALLBACK)
    elseif TYPE:lower() == "disconnect" then
        table.insert(self.callbacks.disconnect, CALLBACK)
    elseif TYPE:lower() == "receive" then
        table.insert(self.callbacks.recieve, CALLBACK)
    end
end

--
-- Unregisters a callback
--
function public:unregisterCallback(CALLBACK)
    for a=1, #self.callbacks.connect do
        if self.callbacks.connect[a] == CALLBACK then
            table.remove(self.callbacks.connect, a)
        end
    end
    
    for a=1, #self.callbacks.disconnect do
        if self.callbacks.disconnect[a] == CALLBACK then
            table.remove(self.callbacks.disconnect, a)
        end
    end
    
    for a=1, #self.callbacks.recieve do
        if self.callbacks.recieve[a] == CALLBACK then
            table.remove(self.callbacks.recieve, a)
        end
    end
end

--
-- Invokes a callback depending if its a single function, or an object
--
function private:invokeCallback(CALLBACK, ARGS)
    if type(CALLBACK) == "table" then
        CALLBACK[1][CALLBACK[2]](CALLBACK[1], unpack(ARGS))
    elseif type(CALLBACK) == "function" then
        CALLBACK(unpack(ARGS))
    end
end

-- 
-- Compile Class
--
 return upperclass:compile(NetworkManager)
