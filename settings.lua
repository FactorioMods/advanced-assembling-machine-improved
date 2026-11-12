data:extend({
	{
	type = "string-setting",
	name = "advanced-assembler-layout",
	hidden = false,
	setting_type = "startup",
	default_value = "compact-3x3",
	allowed_values = {"compact-3x3", "legacy-5x5"},
	order = "0"
	},
	{
	type = "int-setting",
	name = "module-slot",
	setting_type = "startup",
	default_value = 4,
	minimum_value = 3,
	maximum_value = 6,
	order = "a"
	}
})
if mods["space-age"] then
   data:extend({
	   {
        type = "bool-setting",
        name = "space-age-productivity",
        setting_type =  "startup",
        default_value = false,
        order = "b"
        }
    })
end
if mods["space-exploration"] then
   data:extend({
	   {
        type = "bool-setting",
        name = "space-exploration-productivity",
        setting_type =  "startup",
        default_value = false,
        order = "c"
        }
    })
end
