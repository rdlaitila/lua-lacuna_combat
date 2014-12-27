local GameObject = upperclass:define("GameObject")

--
-- Object Unique ID
--
public.id = 0

--
-- Is the object network synced
--
public._NET_SYNCED = false

--
-- Network sync interval in seconds
--
public._NET_SYNC_INTERVAL = 1

--
-- Network Sync timeout
--
public._NET_SYNC_TIMEOUT = 1

--
-- Is the object client side predicted
--
public._NET_CLIENT_PREDICT = false

--
-- Compile class
--
return upperclass:compile(GameObject)