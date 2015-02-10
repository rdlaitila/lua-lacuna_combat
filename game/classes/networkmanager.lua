local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Define class
--
local NetworkManager = game.lib.upperclass:define("NetworkManager")

--
-- Holds our enet host object
--
property : host {
    nil;
    get='public';
    set='private';
    type='any';
}

--
-- Holds our enet server object
--
property : server {
    nil;
    get='public';
    set='private';
    type='any';
}

--
-- Holds our event calbacks
--
property : callbacks { 
    nil;
    get='public'; 
    set='private';
}

--
-- Class Constructor
--
function private:__construct()
    require('enet')
    
    self.callbacks = {
        connect     = {};
        disconnect  = {};
        receive     = {};
    }
end

--
-- Creates a new Enet UDP server
--
function public:serve(ADDRESS, PORT, MAX_CLIENTS)    
    self.host = enet.host_create(ADDRESS..":"..PORT, MAX_CLIENTS)    
end

--
-- Connects to a Enet UDP server
--
function public:connect(ADDRESS, PORT)     
    self.host = enet.host_create()
    self.server = self.host:connect(ADDRESS..":"..PORT)
end

--
-- Processes data
--
function public:update(DT)    
    local netevent = nil
    
    -- Process network events and call registered callbacks
    if self.host ~= nil then
        local netevent = self.host:service()
    end
    
    -- Process netevent
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
 return game.lib.upperclass:compile(NetworkManager)
