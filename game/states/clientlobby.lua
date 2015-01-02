--
-- Define Class
--
local ClientLobby = upperclass:define("ClientLobby")

--
-- Holds a reference to our runtime which we need for various sub-systems
-- the runtime object is obtained through the enter() method
--
property : runtime {
    {};
    get='public';
    set='private';
}

--
-- Holds the server we are connecting to
--
private.serverAddress = ""

--
-- Holds the server port we are connecting to
--
private.serverPort = 0

--
-- Gamtestate enter method
--
function public:enter(RUNTIME, SERVER_ADDRESS, SERVER_PORT)
    self.runtime = RUNTIME
    self.serverAddress = SERVER_ADDRESS
    self.serverPort = SERVER_PORT
    
    self.runtime.networkManager:connect(self.serverAddress, self.serverPort)
end

--
-- Gamestate update method
--
function public:update(DT)
end

--
-- Gamestate draw method
--
function public:draw()
end

--
-- Compile Class
--
return upperclass:compile(ClientLobby)