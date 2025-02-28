local Tunnel = module("frp_lib", "lib/Tunnel")
local Proxy = module("frp_lib", "lib/Proxy")

API = Proxy.getInterface("API")
Inventory = Proxy.getInterface("inventory")
cAPI = Tunnel.getInterface("API")

AppearanceServer = {}

Tunnel.bindInterface("frp_appearance", AppearanceServer)
Proxy.addInterface("frp_appearance", AppearanceServer)

function AppearanceServer.CanSaveModifications( )
    local playerId = source
    local hasMoney = Inventory.GetItem(playerId, "money", nil, true) >= PriceDefaultToPay
    return hasMoney
end

local function RemoveMoneyToSave(source)
    return Inventory.RemoveItem(source, "money", PriceDefaultToPay)
end

function AppearanceServer.updateAppearancePerformMerge( equippedApparelsByType, isNewOutfit, outfitName ) 
    local playerId = source
    local User = API.GetUserFromSource(playerId)
    local Character = User:GetCharacter()
    local currentOutfitId = Character.outfitId

    local paid = RemoveMoneyToSave(playerId)

    if not paid then
        cAPI.Notify(playerId, "error", string.format(i18n.translate("error.does_not_have_money", PriceDefaultToPay)))
        return paid
    end

    if not isNewOutfit then
        if Character:UpdateCharacterOutfitData( currentOutfitId, equippedApparelsByType ) then
            return true
        end
    end

    local newOutfitId = Character:CreateCharacterOutfit( equippedApparelsByType, outfitName )
    if newOutfitId then
        Character:SetCurrentOutfit( newOutfitId )
        Character:SetGameAppearance()
        return true
    end

    return false
end

function AppearanceServer.updateAppearanceBarberShop( equippedApparelsByType, overlayData )
    local playerId = source
    local User = API.GetUserFromSource(playerId)
    local Character = User:GetCharacter()

    local paid = RemoveMoneyToSave(playerId)

    if not paid then
        return cAPI.Notify(playerId, "error", string.format(i18n.translate("error.does_not_have_money", PriceDefaultToPay)))
    end

    local hairApparatusId, hairApparatusStyleId = equippedApparelsByType[eMetapedBodyApparatusType.Hair]?.id, equippedApparelsByType[eMetapedBodyApparatusType.Hair]?.styleId
    local mustacheApparatusId, mustacheApparatusStyleId = equippedApparelsByType[eMetapedBodyApparatusType.BeardsComplete]?.id, equippedApparelsByType[eMetapedBodyApparatusType.BeardsComplete]?.styleId

    local appearanceCustomizable =
    {
        hairApparatusId = hairApparatusId,
        hairApparatusStyleId = hairApparatusStyleId,

        mustacheApparatusId = mustacheApparatusId,
        mustacheApparatusStyleId = mustacheApparatusStyleId,
    }

    local appearanceOverlays = exports.frp_creator:formatOverlaysToSave( overlayData )

    -- local characterNode = {
    --     componentsCustomizable = appearanceCustomizable,
    --     overlaysCustomizable = appearanceOverlays.appearanceOverlaysCustomizable
    -- }

    Character:SetCharacterFaceHairAppearanceCustomizable( appearanceCustomizable )
    Character:SetCharacterAppearanceOverlaysCustomizable( appearanceOverlays.appearanceOverlaysCustomizable )
    
    -- Character:SetGameAppearance()
    return true
end

function AppearanceServer.GetOutfitList()
    local playerId = source
    local User = API.GetUserFromSource(playerId)
    local Character = User:GetCharacter()

    return Character:GetOutfitList()
end

function AppearanceServer.SetCurrentOutfit( outfitId )
    local playerId = source
    local User = API.GetUserFromSource(playerId)
    local Character = User:GetCharacter()

    Character:SetCurrentOutfit( outfitId )
    Character:SetGameAppearance()
end

function AppearanceServer.DeleteOutfit( outfitId )
    local playerId = source
    local User = API.GetUserFromSource(playerId)
    local Character = User:GetCharacter()

    Character:DeleteOutfitFromId( outfitId )
end