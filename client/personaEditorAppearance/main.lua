Game.PersonaEditorAppearance = {}

Game.PersonaEditorAppearance.Start = function(editor, equippedMetapedClothing)

end

Game.PersonaEditorAppearance.GetOverlayLayerTypeFromRequest = function(request)
    local characterEditorOption = request.characterEditorOption
    local overlayLayerType = getOverlayLayerTypeFromUiOption(characterEditorOption)

    assert(overlayLayerType, "overlayLayerType :: Não foi encontrado")

    return overlayLayerType
end

Game.PersonaEditorAppearance.UpdatePedEquippedMetapedClothingStoredOverlayLayer = function(overlayLayerType, propertiesToMerge)
    local overlayLayersMap = Game.equippedMetapedClothing.overlayLayersMap

    local current = overlayLayersMap[overlayLayerType]

    local new = exports.frp_lib:mergeObjectData(current, propertiesToMerge)

    overlayLayersMap[overlayLayerType] = new
end

Game.PersonaEditorAppearance.HandleRequestChangeOverlayLayerStyle = function(request)
    local overlayLayerType = Game.PersonaEditorAppearance.GetOverlayLayerTypeFromRequest(request)

    local styleIndex = request.styleIndex;

    Game.clothingSystemPushRequest(Game.ped, "UpdateOverlayLayer",
    {
        layerType =  overlayLayerType,
        styleIndex = styleIndex,
    });

    Game.PersonaEditorAppearance.UpdatePedEquippedMetapedClothingStoredOverlayLayer(overlayLayerType, { styleIndex = styleIndex })
end

Game.PersonaEditorAppearance.HandleRequestChangeOverlayLayerColor = function(request)
    local overlayLayerType = Game.PersonaEditorAppearance.GetOverlayLayerTypeFromRequest(request)

    local colorIndex = request.colorIndex;

    Game.clothingSystemPushRequest(Game.ped, "UpdateOverlayLayer",
    {
        layerType =  overlayLayerType,
        tint0 = colorIndex,
    });

    Game.PersonaEditorAppearance.UpdatePedEquippedMetapedClothingStoredOverlayLayer(overlayLayerType, { colorIndex = colorIndex })
end

Game.PersonaEditorAppearance.HandleRequestChangeOverlayLayerOpacity = function(request)
    local overlayLayerType = Game.PersonaEditorAppearance.GetOverlayLayerTypeFromRequest(request)

    local opacity = request.opacity;
    
    if opacity >= 1 then
        opacity = 1.0
    end 

    Game.PersonaEditorAppearance.UpdatePedEquippedMetapedClothingStoredOverlayLayer(overlayLayerType, { opacity = opacity })

    Game.clothingSystemPushRequest(Game.ped, "UpdateOverlayLayer",
    {
        layerType =  overlayLayerType,
        alpha = opacity,
    });
end

Game.PersonaEditorAppearance.HandleRequestChangeAppearance = function(data)
    local route = data.type;
    local customizingPed = Game.ped;

    if route == 'appearance' then
        Game.PersonaEditorAppearance.RequestChangeApparatus(data)
    elseif route == 'faceFeature' then
        Game.PersonaEditorAppearance.HandleRequestUpdateExpression(data)
    elseif route == 'body' then
        local subRoute = data.component

        if subRoute == "PORTE" then
            -- #TODO: Entendi porra nenhuma desse código.

            local ped = Game.ped;

            -- local offset = IsPedMale(ped) and 132 or 113;
            local offset = IsPedMale(ped) and 132 or 114;

            local finalIndex = offset + data.data;
        
            -- adicionar isso aqui em algum objeto pra salvar
            -- finalIndex
        
            Citizen.InvokeNative(0xA5BAE410B03E7371, ped, finalIndex, false, true);
    
            Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, 0, 1, 1, 1, 0);

            Game.equippedMetapedClothing.bodyKindType = finalIndex;
        elseif subRoute == 'WAIST' then
            Game.PersonaEditorAppearance.HandleRequestChangeBodyWeightOutfit(data)
        elseif subRoute == "HEIGHT" then
            Game.PersonaEditorAppearance.HandleRequestChangeBodyHeight(data)
        end

    elseif route == 'whistle' then
        Game.PersonaEditorAppearance.HandleRequestChangeWhistleConfig(data)
    end
end

Game.PersonaEditorAppearance.RequestChangeApparatus = function(request)
    local equippedMetapedClothing = Game.requestChangeApparatus(Game.ped, request)
end

Game.PersonaEditorAppearance.HandleRequestChangeBodyWeightOutfit = function(data)
    local waistIndex = data.data;
    local ped = Game.ped;

    Game.clothingSystemPushRequest(Game.ped, "UpdateCurrentBodyWeightOutfit",
    {
        type = waistIndex
    });

    Game.equippedMetapedClothing.bodyWeightOufitType = waistIndex;
end

Game.PersonaEditorAppearance.HandleRequestChangeBodyHeight = function(data)
    local ped = Game.ped;
    local value = data.data;

    local isPositive = value > 185;
    local variation = (math.abs(185 - value) * 0.005333)

    if not isPositive then
        variation = -(variation)
    end

    SetPedScale(ped, 1.0 + variation);

    Game.equippedMetapedClothing.height = value;
end


Game.PersonaEditorAppearance.HandleRequestChangeWhistleConfig = function(data)
    local pedId = Game.ped;
    local value = tonumber(data.data) + 0.0001;

    local whistleConfig

    if data.component == "WHISTLE_CLARITY" then
        whistleConfig = 'Ped.WhistleClarity';
        Game.equippedMetapedClothing.whistleClarity = value;
    elseif data.component == "WHISTLE_STYLE" then
        whistleConfig = 'Ped.WhistleShape';
        Game.equippedMetapedClothing.whistleShape = value;
    elseif data.component == "WHISTLE_PITCH" then
        whistleConfig = 'Ped.WhistlePitch';
        Game.equippedMetapedClothing.whistlePitch = value;
    end

    -- _SET_WHISTLE_CONFIG_FOR_PED
    N_0x9963681a8bc69bf3(pedId, whistleConfig, value);

    TaskWhistleAnim(pedId, GetHashKey('WHISTLEHORSELONG'), 0);
end

Game.PersonaEditorAppearance.HandleRequestUpdateExpression = function(data)

    local expressionTypeNameOrPairName, value = data.component, data.data

    local expressionPairTypes = expressionSettings[expressionTypeNameOrPairName] or { eExpression[expressionTypeNameOrPairName] }

    local expressionPairValues

    if #expressionPairTypes > 1 then 
        if value?.x and value?.y then
            expressionPairValues = { value.x, value.y }
        end
    else
        expressionPairValues = type(value) == "object" and { value?.x } or { value }
    end

    local expressionsToUpdate = {}

    for index, expressionType in pairs(expressionPairTypes) do
        local expressionValue = expressionPairValues[index];

        
        expressionValue = (expressionValue - 10) / 10;

        expressionValue = expressionValue + 0.0001;

        expressionValue = math.min(0.999, expressionValue); /* Não pode ser maior ou igual a 1.0 */

        expressionValue = math.max(-0.999, expressionValue);

        table.insert(expressionsToUpdate, { expressionType= expressionType, expressionValue= expressionValue})
    end

    local ped = Game.ped

    local expressionsMap = Game.equippedMetapedClothing.expressionsMap

    for _, ex in pairs(expressionsToUpdate) do
        local expressionType, expressionValue = ex.expressionType, ex.expressionValue

        local res = Game.clothingSystemPushRequest(ped, "UpdateCurrentExpression",
        {
            expressionType = expressionType,
            expressionValue = expressionValue,
        });

        Game.equippedMetapedClothing.expressionsMap[expressionType] = expressionValue
    end
end