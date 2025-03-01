

function includes(arr, str)
    for _, item in pairs(arr) do 
        if item == str then
            return true
        end
    end
end

function DEBUG(...)
    if DEBUG_MODE then
        print("[DEBUG] - ", ...)
    end
end

function getOverlayLayerTypeFromUiOption(s)
    if s == 'LipstickStyle' or s == 'LipstickColor' or s == 'LipstickOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_LIPSTICK
    elseif s == 'EyeshadowStyle' or s == 'EyeshadowColor' or s == 'EyeshadowOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_EYESHADOW
    elseif s == 'ScarStyle' or s == 'ScarColor' or s == 'ScarOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_SCAR
    elseif s == 'AgeingStyle' or s == 'AgeingOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_AGEING
    elseif s == 'EyebrowsStyle' or s == 'EyebrowsColor' or s == 'EyebrowsOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_EYEBROWS
    elseif s == 'BlusherStyle' or s == 'BlusherColor' or s == 'BlusherOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_BLUSHER
    elseif s == 'ComplexionStyle' or s == 'ComplexionColor' or s == 'ComplexionOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_COMPLEXION
    elseif s == 'SkinMottlingStyle' or s == 'SkinMottlingColor' or s == 'SkinMottlingOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_SKIN_MOTTLING
    elseif s == 'FrecklesStyle' or s == 'FrecklesColor' or s == 'FrecklesOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_FRECKLES
    elseif s == 'GrimeStyle' or s == 'GrimeColor' or s == 'GrimeOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_GRIME
    elseif s == 'FacialHairStyle' or s == 'FacialHairColor' or s == 'FacialHairOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_FACIAL_HAIR
    elseif s == 'HeadHairStyle' or s == 'HeadHairColor' or s == 'HeadHairOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_HEAD_HAIR
    elseif s == 'MolesStyle' or s == 'MolesColor' or s == 'MolesOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_MOLES
    elseif s == 'SpotsStyle' or s == 'SpotsColor' or s == 'SpotsOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_SPOTS
    elseif s == 'EyeLinerColor' or s == 'EyeLinerOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_EYELINER
    elseif s == 'FacePaintColor' or s == 'FacePaintOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_FACE_PAINT
    elseif s == 'FoundationColor' or s == 'FoundationOpacity' then
        return eOverlayLayer.MPC_OVERLAY_LAYER_FOUNDATION
    else
        return nil
    end
end

function ConfigFileApparatusIdInputInlineList(apparatusType, genderSelected)
    -- enviar a informação com o minimo e maximo de cada component para a ui
    return #gMpPedsComponents[apparatusType + 1][genderSelected]
end

function ConfigFileApparatusStyleInputInlineList (apparatusType, genderSelected)
    local num = 1;

    if (apparatusType == 0 or apparatusType == 39) then
        num = 1
    end

    -- enviar a informação com o minimo e maximo de cada estilo dos components para a ui
    for id = num, #gMpPedsComponents[apparatusType + 1][genderSelected] do
        return #gMpPedsComponents[apparatusType + 1][genderSelected][id]
    end
end

local apparelsNotAllowedToOutfit = {
    [eMetapedBodyApparatusType.Hair] = true,
    [eMetapedBodyApparatusType.Heads] = true,
    [eMetapedBodyApparatusType.BodiesLower] = true,
    [eMetapedBodyApparatusType.BodiesUpper] = true,
    [eMetapedBodyApparatusType.Teeth] = true,
    [eMetapedBodyApparatusType.Eyes] = true,
    [eMetapedBodyApparatusType.BeardsComplete] = true
}

function Game.GetOnlyOutfitApparels( equippedApparelsByType )
    for appId, value in pairs ( equippedApparelsByType ) do
        local isNotAllowed = apparelsNotAllowedToOutfit[tonumber(appId)]
        -- print(" appId :: ", appId, isNotAllowed)

        if isNotAllowed then
            equippedApparelsByType[appId] = nil
        end
    end

    return equippedApparelsByType
end

-- function Game.GetOnlyBarberApparels( equippedApparelsByType )

-- end