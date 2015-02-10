local utils = {}

--
-- Snaps a source x,y position to a grid based on grid x width and grid y width
--
function utils:snapToGrid(SOURCE_X, SOURCE_Y, GRID_X, GRID_Y)
    local x = math.floor((SOURCE_X / GRID_X) +0.5) * GRID_X
    local y = math.floor((SOURCE_Y / GRID_Y) +0.5) * GRID_Y    
    return x, y
end

--
-- Rotates a point around another using degrees
--
function utils:rotatePointDegrees(POINT_X, POINT_Y, CENTER_X, CENTER_Y, DEG)
    local angle = (DEG) * (math.pi/180) -- Convert to radians
    return self:rotatePointRadians(POINT_X, POINT_Y, CENTER_X, CENTER_Y, angle)
end

--
-- Rotates a point around another using radians
--
function utils:rotatePointRadians(POINT_X, POINT_Y, CENTER_X, CENTER_Y, RAD)
    local angle = RAD

    local rotatedX = math.cos(angle) * (POINT_X - CENTER_X) - math.sin(angle) * (POINT_Y - CENTER_Y) + CENTER_X;
    local rotatedY = math.sin(angle) * (POINT_X - CENTER_X) + math.cos(angle) * (POINT_Y - CENTER_Y) + CENTER_Y;

    return rotatedX, rotatedY
end

return utils