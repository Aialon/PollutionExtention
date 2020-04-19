-------------------------------------------------------------------------------
--FACTORIO MOD: PollutionExtention
--Adds additional pollution-based challenges to the game
--Author: Aialon
--Date: 19.04.2020
-------------------------------------------------------------------------------

--ToDO
--Building removed
--Can be done by checking if valid

--run every delay ticks
local delay=60

script.on_event(defines.events.on_built_entity,
	function (event)
		saveBuildings(event.created_entity)	
	end
)

script.on_event(defines.events.on_robot_built_entity,
	function (event)
		saveBuildings(event.created_entity)	
	end
)

script.on_event({defines.events.on_tick},
	function(event)
	local tick = event.tick
	--prevent lag by processing every delay ticks
	if tick % delay == 0 then
		pollutionAirEffects(event)
		pollutionRadiationEffects(event)
		end
	end
)

function saveBuildings(entity)
	if entity.name == "nuclear-reactor" then
		if global.radiators == nil then
			global.radiators = {}
		end
		if global.radiators.reactors == nil then
			global.radiators.reactors = {}
		end
		if not global.radiators.reactors[1] then
			global.radiators.reactors[1] = {}
		end
		table.insert(global.radiators.reactors[1], entity)
	end
	elseif entity.name == "centrifuge" then
		if global.radiators == nil then
			global.radiators = {}
		end
		if global.radiators.centrifuges == nil then
			global.radiators.centrifuges = {}
		end
		if not global.radiators.centrifuges[1] then
			global.radiators.centrifuges[1] = {}
		end
		table.insert(global.centrifuges[1], entity)
	end
end

function pollutionAirEffects(event)
	--iterate all chunks
		--remove x% of smog 
		--check pollution value
			--add smog
			--randomly landfill
	--check total pollution
		--add acid rain
end

function pollutionRadiationEffects(event)
	global.radiators ~= nil then
		for k, reactor in pairs(global.radiators.reactors[1]) do
			--spawn a fallout ore in a random location nearby
		end
		for k, centrifuge in pairs(global.radiators.centrifuge[1]) do
			--spawn a fallout ore in a random location nearby
		end
	end
end