require("prototypes.advanced-assembling-machine-returns")

local machine = data.raw["assembling-machine"]["advanced-assembling-machine-returns"]
-- Retain vanilla icon sizing and module layout; center the recipe over the production chamber.
machine.icon_draw_specification = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].icon_draw_specification)
machine.icon_draw_specification.shift = {0,-0.30}
machine.icons_positioning = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].icons_positioning)
if mods["space-age"] then
  machine.heating_energy = "100kW"
end
for _,name in ipairs({"space-age-productivity", "space-exploration-productivity"}) do
  local setting = settings.startup[name]
  if setting and setting.value then
    machine.effect_receiver = {base_effect = {productivity = 0.5}}
    break
  end
end

require("prototypes.tiers")
