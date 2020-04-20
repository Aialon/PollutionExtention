-------------------------------------------------------------------------------
--FACTORIO MOD: PollutionExtention
--Adds additional pollution-based challenges to the game
--Author: Aialon
--Date: 19.04.2020
-------------------------------------------------------------------------------

--ToDO
--Check normal pollution values

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

script.on_nth_tick(60,function(event)
	pollutionAirEffects(event)
	pollutionRadiationEffects(event)
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
		table.insert(global.radiators.reactors, entity)
	end
	elseif entity.name == "centrifuge" then
		if global.radiators == nil then
			global.radiators = {}
		end
		if global.radiators.centrifuges == nil then
			global.radiators.centrifuges = {}
		end
		table.insert(global.centrifuges, entity)
	end
end

function pollutionAirEffects(event)
	for k, surf in pairs(game.surfaces) do
	--remove x% of smog 
		for l, smog in pairs(surf.find_entities_filtered{name="smog"}) do
			if game.create_random_generator() < 0.2 then
				smog.destroy
			end
		end
		--iterate all chunks
		for chunk in surf.get_chunks() do
		--check pollution value
			if surf.get_pollution(chunk.x,chunk.y)
	
				--add smog
				--randomly landfill
			end
		end
		--check total pollution, 
		for l=1,surf.get_total_pollution()/100 do
		surf.get_random_chunk.x*32+game.create_random_generator(-16,16)
			surf.get_random_chunk.y*32+game.create_random_generator(-16,16)
			--add acid rain
		end
	end
end

function pollutionRadiationEffects(event)
	global.radiators ~= nil then
		for k, reactor in pairs(global.radiators.reactors) do
			--spawn a fallout ore in a random location nearby
		end
		for k, centrifuge in pairs(global.radiators.centrifuge) do
			--spawn a fallout ore in a random location nearby
		end
	end
end