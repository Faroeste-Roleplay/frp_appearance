local Tunnel = module("frp_core", "lib/Tunnel")
local Proxy = module("frp_core", "lib/Proxy")

API = Tunnel.getInterface("API")
cAPI = Proxy.getInterface("API")

Tunnel.bindInterface("frp_appearance", Game)
Proxy.addInterface("frp_appearance", Game)