local isMale = true
local shirtoff = false
local braoff = false
local pantsoff = false
local pantiesoff = false
local shoesoff = false
local chainoff = false
local decalsoff = false
local vestoff = false
local bagoff = false
local maskoff = false
local hatoff = false
local glassesoff = false
local earringsoff = false
local watchoff = false
local braceletoff = false
local glovesoff = false

local CurrentShirt = 0
local CurrentShirtColor = 0
local CurrentUndershirt = 0
local CurrentUndershirtColor = 0
local CurrentTorso = 0
local CurrentPants = 0
local CurrentPantsColor = 0
local CurrentShoes = 0
local CurrentShoesColor = 0
local CurrentChain = 0
local CurrentChainColor = 0
local CurrentDecals = 0
local CurrentDecalsColor = 0
local CurrentVest = 0
local CurrentVestColor = 0
local CurrentBag = 0
local CurrentBagColor = 0
local CurrentMask = 0
local CurrentMaskColor = 0
local CurrentHat = 0
local CurrentHatColor = 0
local CurrentGlasses = 0
local CurrentGlassesColor = 0
local CurrentEarrings = 0
local CurrentEarringsColor = 0
local CurrentWatch = 0
local CurrentWatchColor = 0
local CurrentBracelet = 0
local CurrentBraceletColor = 0

TriggerEvent('chat:addSuggestion', '/shirt', 'Toggle your shirt.', {{ name="on | off", help="Toggle your shirt on and off."}})
TriggerEvent('chat:addSuggestion', '/bra', 'Toggle your bra.', {{ name="on | off", help="Toggle your bra on and off."}})
TriggerEvent('chat:addSuggestion', '/pants', 'Toggle your pants.', {{ name="on | off", help="Toggle your pants on and off."}})
TriggerEvent('chat:addSuggestion', '/panties', 'Toggle your panties.', {{ name="on | off", help="Toggle your panties on and off."}})
TriggerEvent('chat:addSuggestion', '/shoes', 'Toggle your shoes.', {{ name="on | off", help="Toggle your shoes on and off."}})
TriggerEvent('chat:addSuggestion', '/chain', 'Toggle your chain.', {{ name="on | off", help="Toggle your chain on and off."}})
TriggerEvent('chat:addSuggestion', '/decals', 'Toggle your decals.', {{ name="on | off", help="Toggle your decals on and off."}})
TriggerEvent('chat:addSuggestion', '/vest', 'Toggle your vest.', {{ name="on | off", help="Toggle your vest on and off."}})
TriggerEvent('chat:addSuggestion', '/bag', 'Toggle your bag.', {{ name="on | off", help="Toggle your bag on and off."}})
TriggerEvent('chat:addSuggestion', '/mask', 'Toggle your mask.', {{ name="on | off", help="Toggle your mask on and off."}})
TriggerEvent('chat:addSuggestion', '/hat', 'Toggle your hat.', {{ name="on | off", help="Toggle your hat on and off."}})
TriggerEvent('chat:addSuggestion', '/glasses', 'Toggle your glasses.', {{ name="on | off", help="Toggle your glasses on and off."}})
TriggerEvent('chat:addSuggestion', '/earrings', 'Toggle your earrings.', {{ name="on | off", help="Toggle your earrings on and off."}})
TriggerEvent('chat:addSuggestion', '/watch', 'Toggle your watch.', {{ name="on | off", help="Toggle your watch on and off."}})
TriggerEvent('chat:addSuggestion', '/bracelet', 'Toggle your bracelet.', {{ name="on | off", help="Toggle your bracelet on and off."}})

function getSex()
	if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then
		isMale = true
	elseif GetEntityModel(PlayerPedId()) == GetHashKey("mp_f_freemode_01") then
		isMale = false
	end
	return isMale
end

RegisterNetEvent('shirtoff')
AddEventHandler('shirtoff', function()
	local ped = PlayerPedId()
	local ShirtConfig = Config.Shirt

	CurrentShirt = GetPedDrawableVariation(ped, 11)
	CurrentShirtColor = GetPedTextureVariation(ped, 11)
	CurrentTorso = GetPedDrawableVariation(ped, 3)

	if getSex() then
		SetPedComponentVariation(ped, 11, ShirtConfig.Male.Shirt, 0, 2)
		SetPedComponentVariation(ped, 3, ShirtConfig.Male.Torso, 0, 2)
		shirtoff = true
	else
		SetPedComponentVariation(ped, 11, ShirtConfig.Female.Shirt, 0, 2)
		SetPedComponentVariation(ped, 3, ShirtConfig.Female.Torso, 0, 2)
		shirtoff = true
	end
end)

RegisterNetEvent('shirton')
AddEventHandler('shirton', function()
	local ped = PlayerPedId()

	SetPedComponentVariation(ped, 11, CurrentShirt, CurrentShirtColor, 2)
	SetPedComponentVariation(ped, 3, CurrentTorso, 0, 2)
	shirtoff = false
end)

RegisterNetEvent('undershirtoff')
AddEventHandler('undershirtoff', function()
	local ped = PlayerPedId()
	local UndershirtConfig = Config.Undershirt

	CurrentUndershirt = GetPedDrawableVariation(ped, 8)
	CurrentUndershirtColor = GetPedTextureVariation(ped, 8)

	if getSex() then
		SetPedComponentVariation(ped, 8, UndershirtConfig.Male, 0, 2)
	else
		SetPedComponentVariation(ped, 8, UndershirtConfig.Female, 0, 2)
	end
end)

RegisterNetEvent('undershirton')
AddEventHandler('undershirton', function()
	local ped = PlayerPedId()

	SetPedComponentVariation(ped, 8, CurrentUndershirt, CurrentUndershirtColor, 2)
end)

RegisterNetEvent('braoff')
AddEventHandler('braoff', function()
	local ped = PlayerPedId()
	local BraConfig = Config.Bra

	if getSex() then
		return
	else
		SetPedComponentVariation(ped, 11, BraConfig.Off, 0, 2)
		braoff = true
	end
end)

RegisterNetEvent('braon')
AddEventHandler('braon', function()
	local ped = PlayerPedId()
	local BraConfig = Config.Bra

	SetPedComponentVariation(ped, 11, BraConfig.On, 0, 2)
	braoff = false
end)

RegisterNetEvent('pantsoff')
AddEventHandler('pantsoff', function()
	local ped = PlayerPedId()
	local PantsConfig = Config.Pants

	CurrentPants = GetPedDrawableVariation(ped, 4)
	CurrentPantsColor = GetPedTextureVariation(ped, 4)

	if getSex() then
		SetPedComponentVariation(ped, 4, PantsConfig.Male, 0, 2)
		pantsoff = true
	else
		SetPedComponentVariation(ped, 4, PantsConfig.Female, 0, 2)
		pantsoff = true
	end
end)

RegisterNetEvent('pantson')
AddEventHandler('pantson', function()
	local ped = PlayerPedId()

	SetPedComponentVariation(ped, 4, CurrentPants, CurrentPantsColor, 2)
	pantsoff = false
end)

RegisterNetEvent('pantiesoff')
AddEventHandler('pantiesoff', function()
	local ped = PlayerPedId()
	local PantiesConfig = Config.Panties

	if getSex() then
		return
	else
		SetPedComponentVariation(ped, 4, PantiesConfig.Off, 0, 2)
		pantiesoff = true
	end
end)

RegisterNetEvent('pantieson')
AddEventHandler('pantieson', function()
	local ped = PlayerPedId()
	local PantiesConfig = Config.Panties

	SetPedComponentVariation(ped, 4, PantiesConfig.On, 0, 2)
	pantiesoff = false
end)

RegisterNetEvent('shoesoff')
AddEventHandler('shoesoff', function()
	local ped = PlayerPedId()
	local ShoesConfig = Config.Shoes

	CurrentShoes = GetPedDrawableVariation(ped, 6)
	CurrentShoesColor = GetPedTextureVariation(ped, 6)

	if getSex() then
		SetPedComponentVariation(ped, 6, ShoesConfig.Male, 0, 2)
		shoesoff = true
	else
		SetPedComponentVariation(ped, 6, ShoesConfig.Female, 0, 2)
		shoesoff = true
	end
end)

RegisterNetEvent('shoeson')
AddEventHandler('shoeson', function()
	local ped = PlayerPedId()

	SetPedComponentVariation(ped, 6, CurrentShoes, CurrentShoesColor, 2)
	shoesoff = false
end)

RegisterNetEvent('chainoff')
AddEventHandler('chainoff', function()
	local ped = PlayerPedId()
	local ChainConfig = Config.Chain

	CurrentChain = GetPedDrawableVariation(ped, 7)
	CurrentChainColor = GetPedTextureVariation(ped, 7)

	if getSex() then
		SetPedComponentVariation(ped, 7, ChainConfig.Male, 0, 2)
		chainoff = true
	else
		SetPedComponentVariation(ped, 7, ChainConfig.Female, 0, 2)
		chainoff = true
	end
end)

RegisterNetEvent('chainon')
AddEventHandler('chainon', function()
	local ped = PlayerPedId()

	SetPedComponentVariation(ped, 7, CurrentChain, CurrentChainColor, 2)
	chainoff = false
end)

RegisterNetEvent('decalsoff')
AddEventHandler('decalsoff', function()
	local ped = PlayerPedId()
	local DecalsConfig = Config.Decals

	CurrentDecals = GetPedDrawableVariation(ped, 10)
	CurrentDecalsColor = GetPedTextureVariation(ped, 10)

	if getSex() then
		SetPedComponentVariation(ped, 10, DecalsConfig.Male, 0, 2)
		decalsoff = true
	else
		SetPedComponentVariation(ped, 10, DecalsConfig.Female, 0, 2)
		decalsoff = true
	end
end)

RegisterNetEvent('decalson')
AddEventHandler('decalson', function()
	local ped = PlayerPedId()

	SetPedComponentVariation(ped, 10, CurrentDecals, CurrentDecalsColor, 2)
	decalsoff = false
end)

RegisterNetEvent('vestoff')
AddEventHandler('vestoff', function()
	local ped = PlayerPedId()
	local VestConfig = Config.Vest

	CurrentVest = GetPedDrawableVariation(ped, 9)
	CurrentVestColor = GetPedTextureVariation(ped, 9)

	if getSex() then
		SetPedComponentVariation(ped, 9, VestConfig.Male, 0, 2)
		vestoff = true
	else
		SetPedComponentVariation(ped, 9, VestConfig.Female, 0, 2)
		vestoff = true
	end
end)

RegisterNetEvent('veston')
AddEventHandler('veston', function()
	local ped = PlayerPedId()

	SetPedComponentVariation(ped, 9, CurrentVest, CurrentVestColor, 2)
	vestoff = false
end)

RegisterNetEvent('bagoff')
AddEventHandler('bagoff', function()
	local ped = PlayerPedId()
	local BagsConfig = Config.Bags

	CurrentBag = GetPedDrawableVariation(ped, 5)
	CurrentBagColor = GetPedTextureVariation(ped, 5)

	if getSex() then
		SetPedComponentVariation(ped, 5, BagsConfig.Male, 0, 2)
		bagoff = true
	else
		SetPedComponentVariation(ped, 5, BagsConfig.Female, 0, 2)
		bagoff = true
	end
end)

RegisterNetEvent('bagon')
AddEventHandler('bagon', function()
	local ped = PlayerPedId()

	SetPedComponentVariation(ped, 5, CurrentBag, CurrentBagColor, 2)
	bagoff = false
end)

RegisterNetEvent('maskoff')
AddEventHandler('maskoff', function()
	local ped = PlayerPedId()
	local MaskConfig = Config.Mask

	CurrentMask = GetPedDrawableVariation(ped, 1)
	CurrentMaskColor = GetPedTextureVariation(ped, 1)

	if getSex() then
		SetPedComponentVariation(ped, 1, MaskConfig.Male, 0, 2)
		maskoff = true
	else
		SetPedComponentVariation(ped, 1, MaskConfig.Female, 0, 2)
		maskoff = true
	end
end)

RegisterNetEvent('maskon')
AddEventHandler('maskon', function()
	local ped = PlayerPedId()

	SetPedComponentVariation(ped, 1, CurrentMask, CurrentMaskColor, 2)
	maskoff = false
end)

RegisterNetEvent('hatoff')
AddEventHandler('hatoff', function()
	local ped = PlayerPedId()

	CurrentMask = GetPedPropIndex(ped, 0)
	CurrentMaskColor = GetPedPropTextureIndex(ped, 0)

	if getSex() then
		ClearPedProp(ped, 0)
		hatoff = true
	else
		ClearPedProp(ped, 0)
		hatoff = true
	end
end)

RegisterNetEvent('haton')
AddEventHandler('haton', function()
	local ped = PlayerPedId()

	SetPedPropIndex(ped, 0, CurrentMask, CurrentMaskColor, false)
	hatoff = false
end)

RegisterNetEvent('glassesoff')
AddEventHandler('glassesoff', function()
	local ped = PlayerPedId()

	CurrentGlasses = GetPedPropIndex(ped, 1)
	CurrentGlassesColor = GetPedPropTextureIndex(ped, 1)

	if getSex() then
		ClearPedProp(ped, 1)
		glassesoff = true
	else
		ClearPedProp(ped, 1)
		glassesoff = true
	end
end)

RegisterNetEvent('glasseson')
AddEventHandler('glasseson', function()
	local ped = PlayerPedId()

	SetPedPropIndex(ped, 1, CurrentGlasses, CurrentGlassesColor, false)
	glassesoff = false
end)

RegisterNetEvent('earringsoff')
AddEventHandler('earringsoff', function()
	local ped = PlayerPedId()

	CurrentEarrings = GetPedPropIndex(ped, 2)
	CurrentEarringsColor = GetPedPropTextureIndex(ped, 2)

	if getSex() then
		ClearPedProp(ped, 2)
		earringsoff = true
	else
		ClearPedProp(ped, 2)
		earringsoff = true
	end
end)

RegisterNetEvent('earringson')
AddEventHandler('earringson', function()
	local ped = PlayerPedId()

	SetPedPropIndex(ped, 2, CurrentEarrings, CurrentEarringsColor, false)
	earringsoff = false
end)

RegisterNetEvent('watchoff')
AddEventHandler('watchoff', function()
	local ped = PlayerPedId()

	CurrentWatch = GetPedPropIndex(ped, 6)
	CurrentWatchColor = GetPedPropTextureIndex(ped, 6)

	if getSex() then
		ClearPedProp(ped, 6)
		watchoff = true
	else
		ClearPedProp(ped, 6)
		watchoff = true
	end
end)

RegisterNetEvent('watchon')
AddEventHandler('watchon', function()
	local ped = PlayerPedId()

	SetPedPropIndex(ped, 6, CurrentWatch, CurrentWatchColor, false)
	watchoff = false
end)

RegisterNetEvent('braceletoff')
AddEventHandler('braceletoff', function()
	local ped = PlayerPedId()

	CurrentBracelet = GetPedPropIndex(ped, 7)
	CurrentBraceletColor = GetPedPropTextureIndex(ped, 7)

	if getSex() then
		ClearPedProp(ped, 7)
		braceletoff = true
	else
		ClearPedProp(ped, 7)
		braceletoff = true
	end
end)

RegisterNetEvent('braceleton')
AddEventHandler('braceleton', function()
	local ped = PlayerPedId()

	SetPedPropIndex(ped, 7, CurrentBracelet, CurrentBraceletColor, false)
	braceletoff = false
end)

RegisterCommand('shirt', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not shirtoff then
		TriggerEvent('shirtoff')
		TriggerEvent('undershirtoff')

	elseif name == 'on' and shirtoff then
		TriggerEvent('shirton')
		TriggerEvent('undershirton')
	end
end)

RegisterCommand('bra', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and shirtoff and not braoff then
		TriggerEvent('braoff')
	
	elseif name == 'on' and braoff then
		TriggerEvent('braon')
	end
end)

RegisterCommand('pants', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not pantsoff then
		TriggerEvent('pantsoff')
	
	elseif name == 'on' and pantsoff then
		TriggerEvent('pantson')
	end
end)

RegisterCommand('panties', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not pantiesoff and pantsoff then
		TriggerEvent('pantiesoff')
	
	elseif name == 'on' and pantiesoff and pantsoff then
		TriggerEvent('pantieson')
	end
end)

RegisterCommand('shoes', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not shoesoff then
		TriggerEvent('shoesoff')

	elseif name == 'on' and shoesoff then
		TriggerEvent('shoeson')
	end
end)

RegisterCommand('chain', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not chainoff then
		TriggerEvent('chainoff')

	elseif name == 'on' and chainoff then
		TriggerEvent('chainon')
	end
end)

RegisterCommand('decals', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not decalsoff then
		TriggerEvent('decalsoff')

	elseif name == 'on' and decalsoff then
		TriggerEvent('decalson')
	end
end)

RegisterCommand('vest', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not vestoff then
		TriggerEvent('vestoff')

	elseif name == 'on' and vestoff then
		TriggerEvent('veston')
	end
end)

RegisterCommand('bag', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not bagoff then
		TriggerEvent('bagoff')

	elseif name == 'on' and bagoff then
		TriggerEvent('bagon')
	end
end)

RegisterCommand('mask', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not maskoff then
		TriggerEvent('maskoff')

	elseif name == 'on' and maskoff then
		TriggerEvent('maskon')
	end
end)

RegisterCommand('hat', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not hatoff then
		TriggerEvent('hatoff')

	elseif name == 'on' and hatoff then
		TriggerEvent('haton')
	end
end)

RegisterCommand('glasses', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not glassesoff then
		TriggerEvent('glassesoff')

	elseif name == 'on' and glassesoff then
		TriggerEvent('glasseson')
	end
end)

RegisterCommand('earrings', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not earringsoff then
		TriggerEvent('earringsoff')

	elseif name == 'on' and earringsoff then
		TriggerEvent('earringson')
	end
end)

RegisterCommand('watch', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not watchoff then
		TriggerEvent('watchoff')

	elseif name == 'on' and watchoff then
		TriggerEvent('watchon')
	end
end)

RegisterCommand('bracelet', function(source, args, rawCommand)
	local name = string.lower(args[1])

	if name == 'off' and not braceletoff then
		TriggerEvent('braceletoff')

	elseif name == 'on' and braceletoff then
		TriggerEvent('braceleton')
	end
end)