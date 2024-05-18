function Start()
    OnStart()
end

function Stop()
    OnStop()
end

AddEventHandler('API:onSessionStartedPlaying', Start)

AddEventHandler('API:onSessionStoppedPlaying', Stop)

CreateThread(function()
    if cAPI.IsPlayerInitialized() then
        Start()
    end
end)

lum.onCurrentResourceStopped:connect(Stop)

--[[ ]]

local VOLUME_RADIUS = 2.5

local gTick

local gCurrentAppearanceEditorInfo

local gPromptGroupId
local gPromptId__Open

function OnStart()
    for _, appearanceEditorInfo in ipairs(AppearanceEditorInfoDatabase) do

        local positions in appearanceEditorInfo

        for _, position in ipairs(positions) do
            local point = lib.points.new(position, VOLUME_RADIUS)

            function point:onEnter()
                --[[ Sair do volume atual ]]
                OnExitAppearanceEditorVolume()

                OnEnterAppearanceEditorVolume(appearanceEditorInfo, position)
            end
            
            function point:onExit()
                OnExitAppearanceEditorVolume()
            end

            lum.onCurrentResourceStopped:connect(function()
                point:remove()
            end)
        end
    end
end

function OnStop()
    OnExitAppearanceEditorVolume()
end

function OnEnterAppearanceEditorVolume(appearanceEditorInfo, position)
    local kind, displayName in appearanceEditorInfo

    gCurrentAppearanceEditorInfo = appearanceEditorInfo

    gPromptGroupId = GetRandomIntInRange(0, 0xffffff)

    gPromptId__Open = PromptBuilder:new()
                                :setControl(`INPUT_CONTEXT_Y`)

                                :setText('Abrir')

                                :setMode('Hold', 500)

                                -- :setPoint(position)
                                -- :setRadius(1.0)

                                :setGroup(gPromptGroupId)
                                :build()

    local tick

    tick = scheduler:setTick(function()

        -- PromptSetEnabled(gPromptId__Open, not glow:UiAppIsLaunched('AppCharCreation'))

        if promptHelper:hasPromptHoldModeCompleted(gPromptId__Open) then

            --[[ TODO: Melhorar isso, parar de usar evento, talvez? 
                Checar se tem uma cadeira próxima e abrir a animação do barbeiro
            ]]
            if kind == 'PEK_Barbershop' then

                animToSeatOnChair(GetEntityCoords(PlayerPedId()))

                -- Delay de maluco para esperar a animação está ok
                while not Citizen.InvokeNative(0xAA135F9482C82CC3, PlayerPedId(), `PROP_PLAYER_BARBER_SEAT`) do
                    Wait(100)
                end
            end
            
            TriggerEvent('startscript.scrPersonaEditor',
            {
                onUndo = function()
                    ClearPedTasks(PlayerPedId(), 0, 0)
                end,
            }, kind)
        end

        PromptSetActiveGroupThisFrame(gPromptGroupId, CreateVarString(10, 'LITERAL_STRING', displayName))
    end)

    gTick = tick
end

function OnExitAppearanceEditorVolume()
    if not gCurrentAppearanceEditorInfo then
        return
    end

    gCurrentAppearanceEditorInfo = nil

    gTick = scheduler:clearTick(gTick)

    gPromptGroupId = nil

    gPromptId__Open = PromptDelete(gPromptId__Open)

    TriggerEvent('stopscript.scrPersonaEditor')

    ClearPedTasks(PlayerPedId(), 0, 0)
end


function animToSeatOnChair()
    
    local DataStruct = DataView.ArrayBuffer(256 * 4) 

    local is_data_exists = Citizen.InvokeNative(0x345EC3B7EBDE1CB5, GetEntityCoords(PlayerPedId()), 3.0, DataStruct:Buffer(), 10)

    for i = 1, 10, 1 do
        local scenario = DataStruct:GetInt32(8 * i)

        if scenario ~= 0 then

            if GetHashKey("PROP_PLAYER_BARBER_SEAT") == Citizen.InvokeNative(0xA92450B5AE687AAF, scenario) or -289473187 == Citizen.InvokeNative(0xA92450B5AE687AAF,scenario) then 

                ClearPedTasks(PlayerPedId())
                Citizen.InvokeNative(0xFCCC886EDE3C63EC,PlayerPedId(),false,true)
                TaskUseScenarioPoint(PlayerPedId(), scenario ,  "" , -1.0, true, false, 0, false, -1.0, true)

            else

                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)

                for i = 1, #chairsAllow do
                    local objectModel = chairsAllow[i]

                    local obj = GetClosestObjectOfType(playerCoords, 2.0, objectModel, false, 0, 0)

                    if obj ~= 0 then
                        local chairCoords = GetEntityCoords(obj)
                        local chairHeading = GetEntityHeading(obj)

                        -- local dx, dy = chairCoords.x - playerCoords.x, chairCoords.y - playerCoords.y

                        -- local chairHeading = GetHeadingFromVector_2d(dx, dy)

                        TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey('PROP_PLAYER_BARBER_SEAT'), chairCoords.x, chairCoords.y, chairCoords.z + 0.6, chairHeading - 180, -1, false, true, 0, false)
                        break
                    else
                        Citizen.InvokeNative(0x322BFDEA666E2B0E, PlayerPedId(), playerCoords, 2.0, -1, true, true, true, true)
                    end
                end
                
            end
        end
    end
end

-- -- To cancel scenario with infinite duration u can use CLEAR_PED_TASKS (ped plays exit animation) or CLEAR_PED_TASKS_IMMEDIATELY (ped dont play exit animation):
-- Citizen.InvokeNative(0xE1EF3C1216AFF2CD, PlayerPedId(), 0, 0)  -- CLEAR_PED_TASKS
-- -- OR:
-- Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId(), 0, 0)  -- CLEAR_PED_TASKS_IMMEDIATELY
------------------------------------------------------------------------------
