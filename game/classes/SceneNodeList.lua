local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Define class
--
local SceneNodeList = game.lib.upperclass:define("SceneNodeList")

--
-- Returns the list of nodes maintained by this NodeList
--
property : nodes {
    nil;
    get='public';
    set='private';
    type='table';
}

--
-- Class Constructor
--
function private:__construct()
    -- Intatiate node list
    self.nodes = {}
end

--
-- __index
--
function private:__index(KEY)
    if type(KEY) == 'number' then
        return self.nodes[KEY]
    elseif KEY == 'length' then
        return #self.nodes
    end
    
    return UPPERCLASS_DEFAULT_BEHAVIOR
end

--
-- Pushes a node to the list
--
function public:push(NODE)
    table.insert(self.nodes, NODE)
end

--
-- Pops a node from the list
--
function public:pop(INDEX)
    if INDEX == nil then
        return table.remove(self.nodes, #self.nodes)
    else
        return table.remove(self.nodes, INDEX)
    end
end

--
-- Compile Class
--
return game.lib.upperclass:compile(SceneNodeList)