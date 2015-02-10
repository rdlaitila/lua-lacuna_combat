local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Define class
--
local SceneNode = game.lib.upperclass:define("SceneNode")

--
-- Returns a list of this node's attributes
--
property : attributes {
    nil;
    get='public';
    set='private';
    type='table';
}

--
-- Returns a list of child nodes
--
property : childNodes {
    nil;
    get='public';
    set='private';
    type='table';
}

--
-- Returns the nodes parent node
--
property : parentNode {
    nil;
    get='public';
    set='public';
    type='any';
}

--
-- Returns the node's owner which should always be the top-level node
--
property : ownerNode {
    nil;
    get='public';
    set='public';
    type='any';
}

--
-- Class Constructor
--
function private:__construct()
    -- Set the owner node.
    self.ownerNode = self
    
    -- Initialize NodeList
    self.childNodes = game.classes.SceneNodeList()
end

--
-- Appends a node as child
--
function public:appendChild(SCENE_NODE)
    -- Set the node's parent as self
    SCENE_NODE.parentNode = self
    
    -- Set the node's owner 
    SCENE_NODE.ownerNode = self.ownerNode
    
    -- Push to children
    self.childNodes:push(SCENE_NODE)
end

--
-- Sets an attribute on this node
--
function public:setAttribute(NAME, VALUE)
    -- Push attribute to node
    self.attributes[NAME] = VALUE
end

--
-- Update
--
function public:update(DT)
end

--
-- Draw
--
function public:draw()
end

--
-- Compile Class
--
return game.lib.upperclass:compile(SceneNode)