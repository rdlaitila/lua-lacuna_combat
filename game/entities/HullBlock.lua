local game = require(select('1', ...):match(".-game%.")..'init')

--
-- Define class
--
local HullBlock = game.lib.upperclass:define("HullBlock")

--
-- Compile Class
--
return game.lib.upperclass:compile(HullBlock)