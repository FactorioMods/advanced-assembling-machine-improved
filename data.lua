require("prototypes.advanced-assembling-machine-returns")

local machine = data.raw["assembling-machine"]["advanced-assembling-machine-returns"]
-- Keep recipe overlays on the front apron, clear of moving machinery.
machine.icon_draw_specification = {scale=0.6, shift={0,0.65}}
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
