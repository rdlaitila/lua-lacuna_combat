--
-- Define our module
--
local LoveConsole = {}

--
-- Love Metatable
--
local LoveMetatable = {}

--
-- Holds the love callbacks
--
LoveConsole._love = {
    load        = function() end;
    update      = function(DT) end;
    draw        = function() end;    
}

-- 
-- Set the metatable of the global love table
--
setmetatable(love, LoveMetatable)

--
-- LoveMetatable __index metamethod
--
function LoveMetatable.__index(TABLE, KEY)     
    if KEY == 'load' or KEY == 'draw' or KEY == 'update' then
        return LoveConsole[KEY]
    else
        return rawget(TABLE, KEY)
    end    
end

--
-- LoveMetatable __newindex metamethod
--
function LoveMetatable.__newindex(TABLE, KEY, VALUE)    
    if KEY == 'load' or KEY == 'update' or KEY == 'draw' then
        LoveConsole._love[KEY] = VALUE    
    else
        rawset(TABLE, KEY, VALUE)
    end    
end

--
-- LoveConsole Load
--
function LoveConsole.load(...)     
    LoveConsole._love.load(...)
end

--
-- Update
--
function LoveConsole.update(DT)    
    LoveConsole._love.update(DT)
end

--
-- Draw
--
function LoveConsole.draw() 
    love.graphics.print("LoveConsole", love.graphics.getWidth()/2, love.graphics.getHeight()/2)
    LoveConsole._love.draw()
end

--
-- Return LoveConsole
--
return LoveConsole