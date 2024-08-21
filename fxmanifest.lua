fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'Appearance Editor'
version '0.8.1'
author 'KlandesTino'

escrow_ignore {
    'data/eOverlayLayer.lua',
    'data/expressions.lua',
    'data/initialState.lua',
    'data/metapedBodyApparatus.lua',
	'client/main.lua',
	'client/framework.lua',
	'locales/*.lua',
	'server/main.lua',

	"client/appearance-editor/client/main.lua",
	"client/appearance-editor/data/AppearanceEditorInfoDatabase.lua",
	"client/appearance-editor/data/barberChairsAllowed.lua",

    'config.lua',

	------
	"client/methods.lua",
	"client/utils.lua",

	"client/personaEditorAppearance/main.lua",
	"client/personaEditorCameraManager/main.lua",
	"client/uiApp/main.lua",

	"client/appearance/constants.lua",
	-- "client/appearance/overlays.lua",
	-- "client/appearance/main.lua",
	-- "client/appearance/apparatusDatabase.lua",
	-- "client/appearance/applyPersonaAppearance.lua",
	-- "client/appearance/clothingSystemResolvers.lua",
	-- "client/appearance/utils.lua",
	
	"client/appearance-editor/client/main.lua",
	"client/appearance-editor/data/AppearanceEditorInfoDatabase.lua",
	"client/appearance-editor/data/barberChairsAllowed.lua",
	
	'server/main.lua'
}

shared_scripts {
	"@ox_lib/init.lua",
	"@frp_lib/library/linker.lua",
    'config.lua',
	'locales/*.lua',
}

client_scripts {
	"config.lua",
	"@frp_lib/data/horses_components.lua",
	"@frp_lib/data/mp_overlay_layers.lua",
	"@frp_lib/data/mp_peds_components.lua",

	"data/eOverlayLayer.lua",
	"data/expressions.lua",
	"data/initialState.lua",
	"data/metapedBodyApparatus.lua",

	"client/main.lua",
	'client/framework.lua',
	"client/methods.lua",
	"client/utils.lua",

	"client/personaEditorAppearance/main.lua",
	"client/personaEditorCameraManager/main.lua",
	"client/uiApp/main.lua",

	"client/outfit/menu.lua",

	"client/appearance/constants.lua",
	"client/appearance/overlays.lua",
	"client/appearance/main.lua",
	"client/appearance/apparatusDatabase.lua",
	"client/appearance/applyPersonaAppearance.lua",
	"client/appearance/clothingSystemResolvers.lua",
	"client/appearance/utils.lua",
	
	"client/appearance-editor/client/main.lua",
	"client/appearance-editor/data/AppearanceEditorInfoDatabase.lua",
	"client/appearance-editor/data/barberChairsAllowed.lua",
}

server_scripts {
	'server/main.lua',
	"data/metapedBodyApparatus.lua",
}


ui_page "web/dist/index.html"

files {
	"web/dist/index.html",
	"web/dist/assets/*.png",
	"web/dist/assets/*.svg",
	"web/dist/assets/*.ttf",
	"web/dist/assets/*.css",
	"web/dist/assets/*.js",
}

lua54 'yes'
dependency '/assetpacks'