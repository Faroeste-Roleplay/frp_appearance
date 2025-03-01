Game = {}

Game.ped = nil


usePedCam()
useControllablePedCam()



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
    -- Game.PersonaEditorCameraManager.Start()

    Game.StartPedCam( ped )

    Game.clonePedId = ClonePed(Game.ped, true, true, false)
    SetEntityVisible(Game.clonePedId, false);
    SetEntityCollision(Game.clonePedId, false, true)
    
    if kind == nil then
        -- if Game.ped ~= PlayerPedId() then
            gMetapedClothingSystemOverlayHandler = MetapedClothingSystemOverlayHandler.createPlayer()
            
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

    -- if kind == ePersonaEditorKind.PEK_Barbershop or kind == ePersonaEditorKind.PEK_Clothingstore then
        Game.ThreadToBlockControls();
    -- end

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

        UiApp.On("SET_FOCUS_UI_STATE", function(data, cb)
            SetNuiFocusKeepInput(data.body)
            cb({ ok = true });
        end)

        UiApp.On("REQUEST_CLOSE", function(data, cb)
            if Game.onBeforeUndoCb and Game.onBeforeUndoCb() then
                Game.Undo()
            end
            cb({ ok = true });
        end)

        UiApp.On("change_persona_appearance", function(data, cb)
            Game.PersonaEditorAppearance.HandleRequestChangeAppearance(data.body);
            Game.PersonaEditorAppearance.HandleRequestNewMaxAppearanceStatus(data.body);
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
            -- Game.PersonaEditorCameraManager.HandleRequest(data.body);
            cb({ ok = true });
        end)
    end)

    return Game.GetEquippedMetapedClothing()
end
exports("Start", Game.Start)

Game.Stop = function()
    UiApp.Close()

    UiApp.UnregisterAllMethods()

    Game.StopPedCam()

    RenderScriptCams(false, true, 500, true, true, 0);

    DestroyAllCams(true);

    DeletePed(Game.clonePedId);

    ClearPedTasks(Game.ped)

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
    if Game.onConfirmCb then
        local data = Game.GetEquippedMetapedClothing()
        Game.onConfirmCb(data)
        -- print("Confirm ")
        -- Game.OnStop()
    end
end

local function apparelsLength(equippedApparelsByType)
    local length = 0

    for _, _ in pairs(equippedApparelsByType) do 
        length += 1
    end

    -- print(" apparelsLength :: ", length)

    return length
end

RegisterNetEvent("startscript.scrPersonaEditor", function(options, kindName)
    -- print(" startscript.scrPersonaEditor  :: ", kindName)


    local kind = ePersonaEditorKind[kindName]
    local ped = PlayerPedId()
    
    local function onConfirmHandler(personaData)
        -- print(" onConfirm  :: ", json.encode(personaData, {indent=true}))

        local res = AppearanceServer.CanSaveModifications()

        -- print(" res  :: ", res)

        if not res then
            cAPI.Notify("error", string.format(i18n.translate("error.does_not_have_money", PriceDefaultToPay)), 5000)
            return false
        end
        
        local res = lib.alertDialog({
            header = i18n.translate("info.do_you_wanna_save"),
            content = i18n.translate("info.have_sure"),
            centered = true,
            cancel = true
        })

        if res == "cancel" then
            return
        end
        
        local equippedApparelsByType = personaData.equippedApparelsByType

        -- for _, value in pairs(Game.equippedMetapedClothing.equippedApparelsByType) do 
        --     table.insert(equippedApparelsByType, value)
        -- end

        if apparelsLength(equippedApparelsByType) > 0 then
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
                local apparelsToChange = Game.GetOnlyOutfitApparels( equippedApparelsByType )

                local res = AppearanceServer.updateAppearancePerformMerge(apparelsToChange, isNewOutfit, outfitName)
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
            cancel = true,
            labels = {
                confirm = i18n.translate("info.close")
            }
        })

        return alert == 'confirm'
    end

    local onUndo = options.onUndo

    Game.Start(ped, kind, onConfirmHandler, onBeforeUndo, onUndo)
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

function Game.ThreadToBlockControls()
    CreateThread(function()
        while Game.Enabled do 
            DisableAllControlActions(0)
            Wait(0)
        end
    end)
end

function Game.StartPedCam(entityId)
    if entityId then
        local cameraPosition = GetOffsetFromEntityInWorldCoords( entityId, 0.13, 0.0, 0.05 )

        SetPedCamLookAtPosition(cameraPosition)
    
        SetPedCamDistanceToLookAtPos(3.0)
        SetPedCamMinDistanceToLookAtPos(0.4)
        SetPedCamMaxDistanceToLookAtPos(3.0)

        SetPedCamAngleY(0)
    
        EnableControllablePedCam()
        
        gPedCamPreviewIsEnabled = true
    end
end

function Game.StopPedCam()
    DisableControllablePedCam(true)
    ClearFocus()
    gPedCamPreviewIsEnabled = false
end

AddEventHandler("onResourceStop", function(resName)
    if resName == GetCurrentResourceName() then
        Game.Stop()
    end
end)

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