local name, addon = ...

local Config = {}
addon.Config = Config

Config.Colors = {
    ['Power'] = { 
 		['MANA'] = { 0.31, 0.45, 0.63 }, 
 		['RAGE'] = { 0.69, 0.31, 0.31 }, 
 		['FOCUS'] = { 0.71, 0.43, 0.27 }, 
 		['ENERGY'] = { 0.65, 0.63, 0.35 }, 
 		['CHI'] = { 0.71, 1, 0.92 }, 
 		['RUNES'] = { 0.55, 0.57, 0.61 }, 
 		['RUNIC_POWER'] = { 0, 0.82, 1 }, 
 		['SOUL_SHARDS'] = { 0.50, 0.32, 0.55 }, 
 		['HOLY_POWER'] = { 0.95, 0.90, 0.60 }, 
 		['FUEL'] = { 0, 0.55, 0.5 }, 
 	}, 
 	['Totems'] = { 
 		[1] = { 0.58, 0.23, 0.10 }, 
 		[2] = { 0.23, 0.45, 0.13 }, 
 		[3] = { 0.19, 0.48, 0.60 }, 
 		[4] = { 0.42, 0.18, 0.74 }, 
 	},
}

Config.Units = {
    ['Player'] = {
        ['Height'] = 44,
        ['Width'] = 182,
        ['CastBar'] = {
            ['Enabled'] = true,
            ['Height'] = 25,
            ['Width'] = 182,
        },
    },
}

Config.Textures = {
    ['StatusBar'] = 'Interface\\AddOns\\berwynUF\\texture\\StatusBar'
}

Config.Backdrop = {
	['bgFile'] = 'Interface\\ChatFrame\\ChatFrameBackground',
	['tile'] = true,
	['tileSize'] = 16,
	['insets'] = {
		['left'] = -2,
		['right'] = -2,
		['top'] = -2,
		['bottom'] = -2,
	},
}

Config.Fonts = {
	['Font'] = 'Interface\\AddOns\\berwynUF\\font\\NotoSans-Regular.ttf',
	['Size'] = 10,
	['Style'] = 'OUTLINE',
}