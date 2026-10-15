local module_slot_setting = settings.startup["module-slot"].value
data:extend({
	{
		type = "item",
		name = "advanced-assembling-machine-returns",
		localised_name = {"entity-name.advanced-assembling-machine-returns"},
		icon = "__advanced-assembling-machine-improved__/graphics/icon.png",
		icon_size = 64,
		subgroup = "production-machine",
		order = "c[advanced-assembling-machine-returns]",
		place_result = "advanced-assembling-machine-returns",
		stack_size = 50
	}
})
data:extend({
	{
		type = "assembling-machine",
		name = "advanced-assembling-machine-returns",
		localised_name = {"entity-name.advanced-assembling-machine-returns"},
		icon = "__advanced-assembling-machine-improved__/graphics/icon.png",
		icon_size = 64,
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "advanced-assembling-machine-returns"},
		max_health = 600,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
        circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions["assembling-machine"],
		resistances =
		{
			{
			type = "fire",
			percent = 70
			}
		},
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_picture = assembler3pipepictures(),
				pipe_covers = pipecoverspictures(),
                volume = 1000,
				pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-1, 1} }}
			},
			{
				production_type = "input",
				pipe_picture = assembler3pipepictures(),
				pipe_covers = pipecoverspictures(),
                volume = 1000,
				pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {1, 1} }}
			},
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                volume = 100,
                pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-1, -1} }}
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                volume = 100,
                pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {1, -1} }}
            }
		},
        fluid_boxes_off_when_no_fluid_recipe = true,
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        impact_category = "metal",
		vehicle_impact_sound =	{ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound =
			{
				{
					filename = "__base__/sound/assembling-machine-t2-1.ogg",
					volume = 0.8
				},
				{
					filename = "__base__/sound/assembling-machine-t2-2.ogg",
					volume = 0.8
				},
			},
			idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
			apparent_volume = 1.5,
		},
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		drawing_box_vertical_extension = 1.75,
		fast_replaceable_group = "assembling-machine",
        graphics_set = require("prototypes.graphics")(20),
        match_animation_speed_to_activity = true,
        perceived_performance = {minimum=0,maximum=2},
        crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},
		crafting_speed = 20,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = { pollution = 20 }
		},
		energy_usage = "375kW",
		ingredient_count = 12,
        module_slots = module_slot_setting,
		allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
	}
})



data:extend({
	{
		type = "recipe",
		name = "advanced-assembling-machine-returns",
		localised_name = {"entity-name.advanced-assembling-machine-returns"},
		enabled = false,
        energy_required = 5,
		ingredients =
		{
			{type = "item", name = "assembling-machine-2", amount = 1},
			{type = "item", name = "iron-gear-wheel", amount = 10},
			{type = "item", name = "steel-plate", amount = 5},
            {type = "item", name = "electronic-circuit", amount = 5}
		},
		results = {{type="item", name="advanced-assembling-machine-returns", amount=1}}
	}
})
data:extend({
	{
		type = "technology",
		name = "automation-returns",
		localised_name = {"technology-name.automation-returns"},
		icon = "__advanced-assembling-machine-improved__/graphics/technology.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "advanced-assembling-machine-returns"
			}
		},
        prerequisites = {"automation-2"},
        unit = {count=50,ingredients={{"automation-science-pack",1},{"logistic-science-pack",1}},time=10},
		upgrade = true,
		order = "a-e-d"
	}
})
