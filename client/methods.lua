Game.InitEquippedMetapedClothing = function()
    local pedId = Game.ped

    Game.pedGender = IsPedMale(pedId) and eMetapedBodyApparatusGender.Male or eMetapedBodyApparatusGender.Female

    Game.equippedMetapedClothing = Game.handleStartEditor(pedId)
    Game.StartEquippedMetapedClothing = Game.equippedMetapedClothing
    -- print("     Game.equippedMetapedClothing :: ", json.encode(    Game.equippedMetapedClothing))
end

Game.RequestMaxApparatusByType = function( type, apparel )
    local indexComp = exports.frp_lib:snakeToPascal(type)

    local apparelTypeUnkType = eMetapedBodyApparatusType[indexComp];

    if not apparelTypeUnkType then
        return nil
    end

    local apparelType = tonumber(apparelTypeUnkType);

    local componentsSize = #gMpPedsComponents[apparelType + 1][Game.pedGender][apparel]

    return componentsSize
end


Game.LoadDefaultAppConfiguration = function()
    local typesThatAllowRemoval =
    {
        'HAIR',
        'BEARDS_COMPLETE',
        'HATS',
        'SHIRTS_FULL',
        'PANTS',
        'BOOTS',
    }

    for component, value in pairs(ctxSettingsInitialState.appearance) do
        local indexComp = exports.frp_lib:snakeToPascal(component)

        local apparelTypeUnkType = eMetapedBodyApparatusType[indexComp];

        if not apparelTypeUnkType then
            goto continue
        end

        local apparelType = tonumber(apparelTypeUnkType);

        local modelSize = ConfigFileApparatusIdInputInlineList(apparelType, Game.pedGender);

        local colorSize = ConfigFileApparatusStyleInputInlineList(apparelType, Game.pedGender);

        if (component == "EYES" or component == "TEETH") then
            modelSize = colorSize;
            colorSize = 0
        end

        if includes(typesThatAllowRemoval, component) then
            ctxSettingsInitialState.appearance[component].min = 0;
        end

        ctxSettingsInitialState.appearance[component].max = modelSize

        local str = string.format("%s_COLOR", component)

        if ctxSettingsInitialState.appearance[str] then
            ctxSettingsInitialState.appearance[str].max = colorSize - 1
        end

        local equippedApparelOfType = Game.equippedMetapedClothing.equippedApparelsByType[apparelType]

        if equippedApparelOfType then
            ctxSettingsInitialState.appearance[component].defaultValue = equippedApparelOfType.id;
        
            if ctxSettingsInitialState.appearance[str] then
                ctxSettingsInitialState.appearance[str].defaultValue = equippedApparelOfType.styleId;
            end
        end

        ::continue::
    end

    local data = gMpOverlayLayers

    for overlayLayerTypeName, _  in pairs(eOverlayLayer) do

        -- Ignorar o tipo de overlay 'None'
        if overlayLayerTypeName == 'NONE' then 
            goto continue2
        end

        if overlayLayerTypeName then
            -- Transformar `MPC_OVERLAY_LAYER_SKIN_MOTTLING` em `SKIN_MOTTLING`
            local overlayLayerName = string.gsub(overlayLayerTypeName, "MPC_OVERLAY_LAYER_", "")
            
            -- Transformar `SKIN_MOTTLING` em `SkinMottling`
            local overlayLayerNameCamel = exports.frp_lib:snakeToPascal(overlayLayerName);

            local overlayNameStyle = string.format("%sStyle", overlayLayerNameCamel)

            -- Achar as informações em `SkinMottlingStyle`
            local uiOverlay = ctxSettingsInitialState.appearance[overlayNameStyle] or { min = 0, max = 1 }
            
            -- Caso não haja nenhuma informação, guardar elas
            if not ctxSettingsInitialState.appearance[overlayNameStyle] then
                ctxSettingsInitialState.appearance[overlayNameStyle] = uiOverlay
            end

            -- Achar os styles do overlaylayer no nosso datafile.
            local overlayData =  {}
            for _, e in pairs(data) do
                if e.type == overlayLayerTypeName then
                    overlayData = e
                end
            end

            -- Não tem nenhum style, a gente só ignora.
            if not overlayData then
                goto continue2
            end

            -- Calcular o número de styles (menos 1, porque começa do 0).
            local numOverlayStyles = overlayData.styles ~= nil and #overlayData.styles or 1;

            -- Salvar o máximo.
            uiOverlay.max = numOverlayStyles;

            ctxSettingsInitialState.appearance[overlayNameStyle] = uiOverlay
            -- print(" uiOverlay :: ", overlayLayerName, numOverlayStyles, uiOverlay)
        end
        ::continue2::
    end

    return ctxSettingsInitialState
end

Game.UseEditorKindClothingstore = function()
    -- local ped = Game.ped 

    -- local camCoords =  GetOffsetFromEntityInWorldCoords(ped, 0.2, 2.2, 0.2)
    -- local camPoint = GetOffsetFromEntityInWorldCoords(ped, 0.3, 0.0, -0.05)

    -- local cam = CreateCameraWithParams(
    --     'DEFAULT_SCRIPTED_CAMERA',
    --     camCoords.x,
    --     camCoords.y,
    --     camCoords.z,
    --     0.0,
    --     0.0,
    --     0.0,
    --     50.0,
    --     false,
    --     0
    -- );

    -- PointCamAtCoord(cam, camPoint.x, camPoint.y, camPoint.z);
    -- SetCamActiveWithInterp(cam, -1, 1200, 1, 1);
    -- RenderScriptCams(true, false, 3000, true, false, 0);
end

Game.UseEditorKindBarbershop = function()
    Game.UseEditorKindClothingstore()
end

Game.UseEditorKind = function(kind)
    if kind == ePersonaEditorKind.PEK_Clothingstore then
        Game.UseEditorKindClothingstore()
        UiApp.Emit('SetEnabledSteps', { event = 'store' })
        return
    elseif kind == ePersonaEditorKind.PEK_Barbershop then
        Game.UseEditorKindBarbershop();
        UiApp.Emit('SetEnabledSteps', { event = 'barbershop' })
        return
    else
        print(kind, " :: não existe para o PersonaEditor.")
    end
end

AddEventHandler("appearance:update:equippedMetapedClothing", function(map, method, type, data)
    if not Game.equippedMetapedClothing[map] then
        return
    end

    if method == "delete" then
        Game.equippedMetapedClothing[map][type] = nil
    elseif method == "set" then
        Game.equippedMetapedClothing[map][type] = data
    end
end)

AddEventHandler("appearance:update:equippedMetapedBody", function(type, data)
    if not Game.equippedMetapedClothing then
        return
    end

    for key, value in pairs(data) do 
        if method == "delete" then
            Game.equippedMetapedClothing[key] = nil
        elseif method == "set" then
            Game.equippedMetapedClothing[map] = value
        end
    end
end)