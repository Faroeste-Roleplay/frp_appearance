UiApp = {}
UiApp.Registereds = {}

UiApp.Launch = function(fn)

    UiApp.SetRoute("appearance")
    UiApp.Emit('SetInterfaceDisplay', true)
    
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(true)

    if fn then
        fn()
    end
end

UiApp.Close = function(fn)
    UiApp.SetRoute("/")
    UiApp.Emit('SetInterfaceDisplay', false)

    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)

    if fn then
        fn()
    end
end

UiApp.On = function(name, ...)
    table.insert(UiApp.Registereds, 'uiapp//AppCharCreation/'.. name)
    return RegisterNUICallback('uiapp//AppCharCreation/'.. name, ...)
end

UiApp.Emit = function(name, data)
    return SendNUIMessage(
        {
            type = string.format("AppCharCreation/%s", name),
            data = data
        }
    )
end

UiApp.SetRoute = function(route)
    UiApp.Emit('SET_ROUTE', route)
end

UiApp.UnregisterAllMethods = function()
    for _, name in pairs(UiApp.Registereds) do 
        UnregisterRawNuiCallback(name)
    end

    UiApp.Registereds = {}
end