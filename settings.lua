data:extend({
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
