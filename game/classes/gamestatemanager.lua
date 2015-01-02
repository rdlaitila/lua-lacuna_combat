--
-- Define Class
--
local GamestateManager = upperclass:define("GamestateManager")

--
-- Holds our state stack
--
property : stack {
    {},
    get='public',
    set='private'
}

--
-- Pushes a new gamestate to the stack
--
function public:push(GAMESTATE_OBJECT, ...)
    -- call suspend on previous stack gamestate, if exists
    if #self.stack > 0 then
        self.stack[#self.stack]:suspend()
    end
    
    -- insert gamestate into stack
    table.insert(self.stack, GAMESTATE_OBJECT)
    
    -- call the enter function of gamestate
    self.stack[#self.stack]:enter(...)
end

--
-- Pops a gamestate from the stack
--
function public:pop(...)
    if #self.stack > 0 then
        -- call the leave function of gamestate
        self.stack[#self.stack]:leave(...)
        
        -- remove the gamestate from the stack
        table.remove(self.stack)
        
        -- call the new stack's resume method
        if #self.stack > 0 then
            self.stack[#self.stack]:resume()
        end
    else
        error("No Available Gamestates In Stack To POP")
    end
end

--
-- Calls the update method on active gamestate
--
function public:update(DT, ...)
    self.stack[#self.stack]:update(DT, ...)
end

--
-- Calls the draw method on active gamestate
--
function public:draw(...)
    self.stack[#self.stack]:draw(...)
end

--
-- Calls the keypressed method on active gamestate
--
function public:keypressed(...)
    self.stack[#self.stack]:keypressed(...)
end

--
-- Calls the keyreleased method on active gamestate
--
function public:keyreleased(...)
    self.stack[#self.stack]:keyreleased(...)
end

--
-- Calls the mousepressed method on active gamestate
--
function public:mousepressed(...)
    self.stack[#self.stack]:mousepressed(...)
end

--
-- Calls the mousereleased method on active gamestate
--
function public:mousereleased(...)
    self.stack[#self.stack]:mousereleased(...)
end

--
-- Calls the focus method on active gamestate
--
function public:focus(...)
    self.stack[#self.stack]:focus(...)
end

--
-- Calls the quit method on active gamestate
--
function public:quit(...)
    self.stack[#self.stack]:quit(...)
end

--
-- Compile Class
--
return upperclass:compile(GamestateManager)

