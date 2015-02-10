local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Define class
--
local Ship = game.lib.upperclass:define("Ship", game.classes.SceneNode)

--
-- Ship Principle Grid Position
-- this position is used to establish the hull block grid plane
-- In addition, the first hull block added to the ship will be centered
-- on this position
--
property : principleGridPosition {
    nil;
    get='public';
    set='private';
    type='table';
}

--
-- Ship's Box2d Body
--
property : body {
    nil;
    get='public';
    set='private';
}

--
-- Ship rotation in radians
--
property : rotation {
    0;
    get='public';
    set='public';
    type='number';
}

--
-- Holds our Hull Canvas
--
property : hullCanvas {
    nil;
    get='public';
    set='private';
    type='any';
}

--
-- Holds our Hull Blocks
--
property : hullBlocks {
    nil;
    get='public';
    set='private';
    type='table';
}

--
-- Holds the count of Hull Blocks
--
property : hullBlockCount {
    0;
    get='public';
    set='private';
    type='number';
}

--
-- Holds our Interior Canvas
--
property : interiorCanvas {
    nil;
    get='public';
    set='private';
    type='any';
}

--
-- Holds our Exterior Canvas
--
property : exteriorCanvas {
    nil;
    get='public';
    set='private';
    type='any';
}

--
-- Class Constructor
--
function private:__construct(POSX, POSY)
    -- Initialize our principle grid position
    self.principleGridPosition = {x = POSX, y = POSY}
    
    -- Initialize the ship's physics body
    --self.body = love.physics.newBody(s, POSX, POSY)
        
    -- Initialize our Hull Blocks table
    self.hullBlocks = {}
end

--
-- Adds a hull block to the ship
--
function public:addHullBlock(BLOCK, GRIDX, GRIDY)
    if self.hullBlocks[GRIDX] == nil then self.hullBlocks[GRIDX] = {} end
    if self.hullBlocks[GRIDX][GRIDY] == nil then self.hullBlocks[GRIDX][GRIDY] = BLOCK end
end

--
-- Gets a the grid position relative to the ship principle grid position
-- when supplying an arbitrary x,y value in world coordinates
--
function public:getGridPosition(WORLD_X, WORLD_Y)        
    local xdiff = 0
    local ydiff = 0
    local xgrid = 0
    local ygrid = 0
    
    if WORLD_X > self.principleGridPosition.x then
        xdiff = WORLD_X - self.principleGridPosition.x
        xgrid = math.floor((xdiff / game.BLOCK_WIDTH) +0.5)
    elseif WORLD_X < self.principleGridPosition.x then
        xdiff = self.principleGridPosition.x - WORLD_X        
        xgrid = math.floor((xdiff / game.BLOCK_WIDTH) +0.5) * -1                
        if xgrid == -0 then xgrid = 0 end
    end
    
    if WORLD_Y > self.principleGridPosition.y then
        ydiff = WORLD_Y - self.principleGridPosition.y
        ygrid = math.floor((ydiff / game.BLOCK_HEIGHT) +0.5)
     elseif WORLD_Y < self.principleGridPosition.y then
        ydiff = self.principleGridPosition.y - WORLD_Y
        ygrid = math.floor((ydiff / game.BLOCK_HEIGHT) +0.5) * -1
        if ygrid == -0 then ygrid = 0 end
    end
    
    return xgrid, ygrid
end

--
-- Gets the grid pixel coordinates when supplying a grid X Y
--
function public:getGridCoordinates(GRID_X, GRID_Y)
    local x, y = 0
    if GRID_X < 0 then
        x = self.principleGridPosition.x - (game.BLOCK_WIDTH * math.abs(GRID_X))
    elseif GRID_X > 0 then
        x = self.principleGridPosition.x + (game.BLOCK_WIDTH * math.abs(GRID_X))
    else
        x = self.principleGridPosition.x
    end
    
    if GRID_Y < 0 then
        y = self.principleGridPosition.y - (game.BLOCK_HEIGHT * math.abs(GRID_Y))
    elseif GRID_Y > 0 then
        y = self.principleGridPosition.y + (game.BLOCK_HEIGHT * math.abs(GRID_Y))
    else
        y = self.principleGridPosition.y
    end
    
    return game.lib.utils:rotatePointRadians(x, y, self.principleGridPosition.x, self.principleGridPosition.x, self.rotation * -1)
end

--
-- Checks if a hull block grid placement is valid
--
function public:checkHullGridPlacement(GRID_X, GRID_Y)
    -- If we have no hull blocks yet, you must place on grid 0, 0
    if self.hullBlockCount == 0 and GRID_X ~= 0 or GRID_Y ~= 0 then
        return false
    elseif self.hullBlockCount == 0 and GRID_X == 0 and GRID_Y == 0 then
        return true
    end
    
    return false
end

--
-- Compile Class
--
return game.lib.upperclass:compile(Ship)