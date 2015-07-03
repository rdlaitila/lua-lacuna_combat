local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Define Class
--
local ClientShipPlayground = game.lib.upperclass:define("ClientShipPlayground", game.classes.Gamestate)

--
-- Returns the scene
--
property : scene {
    nil;
    get='public';
    set='private';
    type='table';
}

private.ship = nil

--
-- Class Constructor
--
function private:__construct()
    self.scene = game.classes.SceneGraph()
    
    self.ship = game.entities.Ship(self.scene.camera.x, self.scene.camera.y)
    
    self.scene:appendChild(self.ship)
end

--
-- Update
--
function public:update(DT)
    if love.keyboard.isDown("left") then
        self.scene.camera.x = self.scene.camera.x - 200 * DT
    end
    
    if love.keyboard.isDown("right") then
        self.scene.camera.x = self.scene.camera.x + 200 * DT
    end
    
    if love.keyboard.isDown("up") then
        self.scene.camera.y = self.scene.camera.y - 200 * DT
    end
    
    if love.keyboard.isDown("down") then
        self.scene.camera.y = self.scene.camera.y + 200 * DT
    end
end


--
-- Draw
--
function public:draw()
    love.graphics.print("Ship Playground "..os.clock(), 0, 0)    
    self.scene:draw()    
end

--
-- Compile CLass
--
return game.lib.upperclass:compile(ClientShipPlayground)