fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'Appearance Editor'
version '0.4'
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

    'config.lua',
}

shared_scripts {
	"@ox_lib/init.lua",
	"@frp_core/lib/utils.lua",
	"@frp_core/lib/i18n.lua",
    'config.lua',
	'locales/*.lua',
}

client_scripts {
	"config.lua",

	"data/eOverlayLayer.lua",
	"data/expressions.lua",
	"data/initialState.lua",
	"data/metapedBodyApparatus.lua",

	"client/main.lua",
	'client/framework.lua',
	"client/methods.lua",
	"client/utils.lua",
	"client/utils.js",

	"client/personaEditorAppearance/main.lua",
	"client/personaEditorCameraManager/main.lua",
	"client/uiApp/main.lua",
}

server_scripts {
	'server/main.lua'
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