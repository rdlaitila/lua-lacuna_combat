local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Define class
--
local SceneGraph = game.lib.upperclass:define("SceneGraph", game.classes.SceneNode)

--
-- Returns the box2d world
--
property : world {
    nil;
    get='public';
    set='private';
    type='any';
}

--
-- Returns the scene camera
--
property : camera {
    nil;
    get='public';
    set='private';
    type='any';
}

--
-- Class Constructor
--
function private:__construct()
    -- Ensure we set this node's owner node to self
    self.ownerNode = self
    
    -- Setup world
    self.world = love.physics.newWorld()
    
    -- Setup Camera
    self.camera = game.lib.HumpCamera(love.graphics.getWidth()/2, love.graphics.getHeight()/2)
end



--
-- Compile Class
--
return game.lib.upperclass:compile(SceneGraph)