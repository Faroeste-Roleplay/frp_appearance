Game = {}

Game.ped = nil

ePersonaEditorKind =
{
    PEK_Default = 0,
    PEK_Clothingstore = 1,
    PEK_Barbershop = 2,
};

Game.equippedMetapedClothing = {}

Game.Start = function(ped, kind, onConfirm, onBeforeUndo, onUndo) 
    Game.ped = ped

    Game.Enabled = true

    Game.kind = kind

    local lang = i18n.getCurrentLanguage()
    local locales = i18n.exportData()
    local translation = locales[lang]

    Game.onConfirmCb = onConfirm
    Game.onBeforeUndoCb = onBeforeUndo
    Game.onUndoCb = onUndo

    -- Game.app
    Game.InitEquippedMetapedClothing()

    Game.PersonaEditorAppearance.Start()
    Game.PersonaEditorCameraManager.Start()

    Game.clonePedId = ClonePed(Game.ped, true, true, false)
    SetEntityVisible(Game.clonePedId, false);
    SetEntityCollision(Game.clonePedId, false, true)
    
    if kind == nil then
        -- if Game.ped ~= PlayerPedId() then
            
            Game.clothingSystemPushRequest(Game.ped, 'CreateHeadOverlay', { });

            local eMetapedHeadOverlayTypeRDR3 =
            {
                'MPC_OVERLAY_LAYER_SKIN_MOTTLING',
                'MPC_OVERLAY_LAYER_AGEING',
                'MPC_OVERLAY_LAYER_COMPLEXION',
                -- 'MPC_OVERLAY_LAYER_COMPLEXION_2',
                'MPC_OVERLAY_LAYER_FRECKLES',
                'MPC_OVERLAY_LAYER_MOLES',
                'MPC_OVERLAY_LAYER_SPOTS',
                'MPC_OVERLAY_LAYER_FOUNDATION',
                'MPC_OVERLAY_LAYER_BLUSHER',
                'MPC_OVERLAY_LAYER_EYELINER',
                'MPC_OVERLAY_LAYER_EYESHADOW',
                'MPC_OVERLAY_LAYER_LIPSTICK',
                'MPC_OVERLAY_LAYER_EYEBROWS',
                'MPC_OVERLAY_LAYER_GRIME',
                -- 'MPC_OVERLAY_LAYER_FACE_PAINT', // A gente não vai usar a Mascara.
                'MPC_OVERLAY_LAYER_SCAR',
                'MPC_OVERLAY_LAYER_FACIAL_HAIR',
                'MPC_OVERLAY_LAYER_HEAD_HAIR',
            }

            for _, overlay in pairs(eMetapedHeadOverlayTypeRDR3) do
                Game.clothingSystemPushRequest(Game.ped, "UpdateOverlayLayer",
                {
                    layerType =  eOverlayLayer[overlay],
                    styleIndex = 1,
                    alpha =  0.0,
                });
            end
        -- end
    end

    -- print(" INICIOU UMA VEZ ::::::::::::::::::")

    UiApp.Launch(function()
        local defaultConfig = Game.LoadDefaultAppConfiguration()

        UiApp.Emit('SetLocale', translation)
        UiApp.Emit("SetInitialState", defaultConfig)

        -- local success, result = pcall()
        -- if not success then
            -- print("Ocorreu um error enquanto carregava as configurações inicias")
        -- end

        if kind ~= nil then
            Game.UseEditorKind(kind)
        end

        UiApp.On("REQUEST_CLOSE", function(data, cb)
            if Game.onBeforeUndoCb and Game.onBeforeUndoCb() then
                Game.Undo()
            end
            cb({ ok = true });
        end)

        UiApp.On("change_persona_appearance", function(data, cb)
            Game.PersonaEditorAppearance.HandleRequestChangeAppearance(data.body);
            cb({ ok = true });
        end)

        UiApp.On("RequestChangeOverlayLayerStyle", function(data, cb)
            Game.PersonaEditorAppearance.HandleRequestChangeOverlayLayerStyle(data.body);
            cb({ ok = true });
        end)

        UiApp.On("RequestChangeOverlayLayerColor", function(data, cb)
            Game.PersonaEditorAppearance.HandleRequestChangeOverlayLayerColor(data.body);
            cb({ ok = true });
        end)

        UiApp.On("RequestChangeOverlayLayerOpacity", function(data, cb)
            Game.PersonaEditorAppearance.HandleRequestChangeOverlayLayerOpacity(data.body);
            cb({ ok = true });
        end)

        UiApp.On("confirm_character", function(data, cb)
            Game.Confirm();
            cb({ ok = true });
        end)

        UiApp.On("button_action", function(data, cb)
            Game.PersonaEditorCameraManager.HandleRequest(data.body);
            cb({ ok = true });
        end)
    end)

    return Game.GetEquippedMetapedClothing()
end
exports("Start", Game.Start)

Game.Stop = function()
    UiApp.Close()

    UiApp.UnregisterAllMethods()

    RenderScriptCams(false, true, 1000, true, true, 0);

    DestroyAllCams(true);

    DeletePed(Game.clonePedId);

    Game.Enabled = false

    Game.kind = nil
end


Game.GetPed = function()
    return Game.ped;
end


Game.GetEquippedMetapedClothing = function()
    local data = Game.equippedMetapedClothing
    -- Game.equippedMetapedClothing.overlayLayersMap = {}
    -- Game.equippedMetapedClothing.expressionsMap = {}

    -- print(" GetEquippedMetapedClothing ", json.encode(data, {indent=true}))

    return data
end

Game.Undo = function()
    -- if Game.kind == nil then
        -- if Game.ped ~= PlayerPedId() then
            ClonePedToTarget(Game.clonePedId, Game.ped);
        -- end
    -- end

    if Game.onUndoCb then
        Game.onUndoCb(Game.GetEquippedMetapedClothing())
    end

    Game.Stop();
end

Game.Confirm = function()
    if Game.onConfirmCb and Game.onConfirmCb(Game.GetEquippedMetapedClothing()) then
        -- Game.OnStop()
    end
end

RegisterNetEvent("startscript.scrPersonaEditor", function(options, kindName)
    local kind = ePersonaEditorKind[kindName]
    local ped = PlayerPedId()
    
    local function onConfirm(personaData)

        local res = AppearanceServer.CanSaveModifications()

        if not res then
            cAPI.Notify("error", string.format(i18n.translate("error.does_not_have_money", PriceDefaultToPay)), 5000)
            return false
        end

        
        local equippedApparelsByType = personaData.equippedApparelsByType

        -- for _, value in pairs(Game.equippedMetapedClothing.equippedApparelsByType) do 
        --     table.insert(equippedApparelsByType, value)
        -- end

        if #equippedApparelsByType > 0 then
            if kind == ePersonaEditorKind.PEK_Clothingstore then
                local res = lib.alertDialog({
                    header = i18n.translate("info.save_new_outfit"),
                    content = i18n.translate("info.have_sure"),
                    centered = true,
                    cancel = true
                })

                local isNewOutfit = res == "confirm"
                local outfitName = ""

                if isNewOutfit then
                    local input = lib.inputDialog(i18n.translate("info.new_outfit_name"), {i18n.translate("info.outfit")})

                    if input and input[1] then
                        outfitName = input[1]
                    end
                end

                local res = AppearanceServer.updateAppearancePerformMerge(equippedApparelsByType, isNewOutfit, outfitName)
                if res then
                    Game.Stop()
                end
            end
            if kind == ePersonaEditorKind.PEK_Barbershop then
                local res = AppearanceServer.updateAppearanceBarberShop(equippedApparelsByType, Game.equippedMetapedClothing.overlayLayersMap)
                if res then
                    Game.Stop()
                end
            end
        end

        return true
    end
    local function onBeforeUndo()
        local alert = lib.alertDialog({
            header = i18n.translate("info.cancel_appearance"),
            content = i18n.translate("info.have_sure"),
            centered = true,
            cancel = true
        })

        return alert == 'confirm'
    end

    local onUndo = options.onUndo

    Game.Start(ped, kind, onConfirm, onBeforeUndo, onUndo)
end)

-- RegisterCommand("openc", function()
--     local ped = PlayerPedId()

--     local function onConfirm(personaData)
--         -- local success = Game.RequestCreatePersona(personaData);

--         -- if success then
--             --- RETORNAR Criação de personagem
--             Game.Stop();
--         -- end
--         return true
--     end
    
--     local function onBeforeUndo()
--         local alert = lib.alertDialog({
--             header = i18n.translate("info.cancel_appearance"),
--             content = i18n.translate("info.have_sure"),
--             centered = true,
--             cancel = true
--         })

--         return alert == 'confirm'
--     end

--     local function onUndo(personaData)
--         -- Game.Undo();
--         return true
--     end

--     local equippedMetapedClothing = Game.Start(ped, ePersonaEditorKind.PEK_Clothingstore, onConfirm, onBeforeUndo, onUndo)
-- end)

RegisterNetEvent("stopscript.scrPersonaEditor", function()
    if Game.Enabled then
        local alert = lib.alertDialog({
            header = i18n.translate("info.cancel_appearance"),
            content = i18n.translate("info.have_sure"),
            centered = true,
            cancel = true
        })

        if  alert == 'confirm' then
            Game.Undo()
        end
    end
end)