
Game.PersonaEditorCameraManager = {}

Game.PersonaEditorCameraManager.Start = function()
    Game.PersonaEditorCameraManager.CamerasInfo = {
        cameras = {
            default = {
                coords = { x = 0, y = 2.2, z = 0.2 },
                point = { x = 0.0, y = 0, z = -0.05 }
            },
            head = {
                coords = { x = 0, y = 0.5, z = 0.6 },
                point = { x = 0.0, y = 0, z = 0.6 }
            },
            body = {
                coords = { x = 0, y = 1.2, z = 0.2 },
                point = { x = 0.0, y = 0, z = 0.2 }
            },
            bottom = {
                coords = { x = 0, y = 1.0, z = -0.6 },
                point = { x = 0.0, y = 0, z = -0.8 }
            }
        },
        offsets = {
            default = { x = 1.5, y = -1 },
            head = { x = 0.7, y = -0.6 },
            body = { x = 1.2, y = -0.45 },
            bottom = { x = 1.0, y = -0.45 }
        }
    }
end

Game.PersonaEditorCameraManager.HandleRequest = function(data)
    local camData
    local customizingPed = Game.ped

    Game.PersonaEditorCameraManager.isCameraInterpolating = false;

    local direction

    if data == 'camera_1' then
        -- local boneIndex = GetPedBoneIndex(customizingPed, 21030) -- skel_head
        -- local hX, hY, headCoordsZ = GetWorldPositionOfEntityBone(customizingPed, boneIndex)
        camData = 'head'
    elseif data == 'camera_2' then
        camData = 'body'
    elseif data == 'camera_3' then
        camData = 'bottom'
    elseif data == 'left' then
        direction = 'left'
        camData = 'rotation'
    elseif data == 'right' then
        direction = 'right'
        camData = 'rotation'
    elseif data == 'turnAround' then
        Game.PersonaEditorCameraManager.PedTurnAround(customizingPed)
    elseif data == 'discart' then
        if Game.onBeforeUndoCb and Game.onBeforeUndoCb() then
            Game.Undo()
        end
    elseif data == 'save' then
        Game.Confirm()
    end
    
    if not Game.PersonaEditorCameraManager.initialCamera then
        Game.PersonaEditorCameraManager.initialCamera = GetRenderingCam();
    end

    if camData then
        Game.PersonaEditorCameraManager.CreateFakeCam(camData, customizingPed, direction)
    end
end

Game.PersonaEditorCameraManager.CreateFakeCam = function(data, customPed, direction)
    
    if data == Game.PersonaEditorCameraManager.currentCamera then
        SetCamActiveWithInterp(Game.PersonaEditorCameraManager.initialCamera, Game.PersonaEditorCameraManager.gCamInterpolation, 1200, 1, 1)
        Game.PersonaEditorCameraManager.currentCamera = 'default'
        Game.PersonaEditorCameraManager.gCamInterpolation = Game.PersonaEditorCameraManager.initialCamera
        return
    elseif data == 'rotation' then
        data = Game.PersonaEditorCameraManager.currentCamera or 'default'
    end
    
    if  Game.PersonaEditorCameraManager.isCameraInterpolating then
        return
    end
    
    if data ~= 'current' then
        Game.PersonaEditorCameraManager.currentCamera = data
    end
    
    local customizingPed = Game.ped
    local customizingPedId = customizingPed
    
    local dataFile = Game.PersonaEditorCameraManager.CamerasInfo.cameras[Game.PersonaEditorCameraManager.currentCamera]
    
    local coords = dataFile.coords
    local point = dataFile.point
    
    local offset = { x = 0, y = 0 }
    
    local reverseFactor = Game.PersonaEditorCameraManager.reverseCamera and -1 or 1
    
    local sideFactor = 0
    
    if direction == 'left' then
        sideFactor = 1
    elseif direction == 'right' then
        sideFactor = -1
    end
    
    if sideFactor ~= 0 then
        offset = Game.PersonaEditorCameraManager.CamerasInfo.offsets[Game.PersonaEditorCameraManager.currentCamera]
    end
    
    local offsetNui = Game.PersonaEditorCameraManager.reverseCamera and -0.2 or 0.2
    
    local camCoords = GetOffsetFromEntityInWorldCoords(customizingPedId,
        (coords.x + offset.x + offsetNui) * sideFactor * reverseFactor,
        (coords.y + offset.y) * reverseFactor,
        coords.z)
    
    local camPoint = GetOffsetFromEntityInWorldCoords(customizingPedId, point.x + offsetNui, point.y - offsetNui, point.z)
    
    if data == "head" then
        local boneIndex = GetPedBoneIndex(customizingPedId, 21030) -- skel_head
        local hX, hY, headCoordsZ = GetWorldPositionOfEntityBone(customizingPedId, boneIndex)
        camCoords = vec3(camCoords.x, camCoords.y, headCoordsZ or camCoords.z)
    end
    
    local tmpCamera = CreateCameraWithParams(
        GetHashKey('DEFAULT_SCRIPTED_CAMERA'),
        camCoords.x,
        camCoords.y,
        camCoords.z,
        0.2,
        0.0,
        0.0,
        50.0,
        false,
        0
    )
    
    PointCamAtCoord(tmpCamera, camPoint.x, camPoint.y, camPoint.z)
    
    if not Game.PersonaEditorCameraManager.gCamInterpolation then
        Game.PersonaEditorCameraManager.gCamInterpolation = Game.PersonaEditorCameraManager.initialCamera
    end
    
    SetCamActiveWithInterp(tmpCamera, Game.PersonaEditorCameraManager.gCamInterpolation, 1000, 1, 1)
    RenderScriptCams(true, false, 1, true, true, 0)
    
    Game.PersonaEditorCameraManager.isCameraInterpolating = true
    

    Wait(500)

    if not IsCamInterpolating(Game.PersonaEditorCameraManager.gCamInterpolation) and IsCamActive(tmpCamera) then
        if Game.PersonaEditorCameraManager.gCamInterpolation ~= Game.PersonaEditorCameraManager.initialCamera then
            DestroyCam(Game.PersonaEditorCameraManager.gCamInterpolation, false);
        end
        Game.PersonaEditorCameraManager.gCamInterpolation = tmpCamera;
    end
end

Game.PersonaEditorCameraManager.PedTurnAround = function(ped)
    Game.PersonaEditorCameraManager.reverseCamera = not Game.PersonaEditorCameraManager.reverseCamera;
    local pedHeading = GetEntityHeading(ped);

    SetPedDesiredHeading(ped, pedHeading - 180);
end