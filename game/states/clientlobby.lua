local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Define Class
--
local ClientLobby = game.lib.upperclass:define("ClientLobby", game.classes.Gamestate)

--
-- Holds the server we are connecting to
--
private.serverAddress = "127.0.0.1"

--
-- Holds the server port we are connecting to
--
private.serverPort = 6000

--
-- Class Constructor
--
function private:__construct()
end

--
-- Gamtestate enter method
--
function public:enter(RUNTIME, SERVER_ADDRESS, SERVER_PORT)           
    self:__constructparent(RUNTIME)
    
    self.serverAddress = SERVER_ADDRESS
    
    self.serverPort = SERVER_PORT
    
    self.runtime.networkManager:connect(self.serverAddress, self.serverPort)
end

--
-- Compile Class
--
return game.lib.upperclass:compile(ClientLobby)