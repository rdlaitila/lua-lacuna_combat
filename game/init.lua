-- Obtain our base require path
local BASE_PATH = select('1', ...):match(".-game%.")

-- Holds all of our game data
local game = {}

-- Setup some constants
game.BLOCK_WIDTH    = 20
game.BLOCK_HEIGHT   = 20

-- Our game libraries
game.lib                    = require(BASE_PATH..'lib.dynamicrequire')()
game.lib.DynamicRequire     = (BASE_PATH..'lib.dynamicrequire')
game.lib.upperclass         = (BASE_PATH..'lib.upperclass.upperclass')
game.lib.lovebird           = (BASE_PATH..'lib.lovebird.lovebird')
game.lib.utils              = (BASE_PATH..'lib.utils')
game.lib.HumpCamera         = (BASE_PATH..'lib.hump.camera')

-- Our game classes
game.classes                  = game.lib.DynamicRequire()
game.classes.Gamestate        = (BASE_PATH..'classes.Gamestate')
game.classes.GamestateManager = (BASE_PATH..'classes.GamestateManager')
game.classes.NetworkManager   = (BASE_PATH..'classes.NetworkManager')
game.classes.SceneGraph       = (BASE_PATH..'classes.SceneGraph')
game.classes.SceneNode        = (BASE_PATH..'classes.SceneNode')
game.classes.SceneNodeList    = (BASE_PATH..'classes.SceneNodeList')

-- Our game entities
game.entities           = game.lib.DynamicRequire()
game.entities.Ship      = (BASE_PATH..'entities.Ship')
game.entities.HullBlock = (BASE_PATH..'entities.HullBlock')

-- Our game runtimes
game.runtime          = game.lib.DynamicRequire()
game.runtime.Client   = (BASE_PATH..'runtime.Client')
game.runtime.Server   = (BASE_PATH..'runtime.Server')

-- Our game states
game.states                     = game.lib.DynamicRequire()
game.states.ClientLobby         = (BASE_PATH..'states.ClientLobby')
game.states.ClientMenu          = (BASE_PATH..'states.ClientMenu')
game.states.ClientShipBuilder   = (BASE_PATH..'states.ClientShipBuilder')
game.states.ServerLobby         = (BASE_PATH..'states.ServerLobby')

-- Return the game
return game