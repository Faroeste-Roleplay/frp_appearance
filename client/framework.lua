local Tunnel = module("frp_lib", "lib/Tunnel")
local Proxy = module("frp_lib", "lib/Proxy")

cAPI = Proxy.getInterface("API")

Tunnel.bindInterface("frp_appearance", Game)
Proxy.addInterface("frp_appearance", Game)