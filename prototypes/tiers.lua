local base_name = "advanced-assembling-machine-returns"
local previous = base_name
local tiers = {
  {speed=40, power="750kW", pollution=40, health=800, color="orange"},
  {speed=80, power="1500kW", pollution=80, health=1000, color="purple"},
  {speed=160, power="3000kW", pollution=160, health=1200, color="blue"},
  {speed=320, power="6000kW", pollution=320, health=1600, color="white"}
}
for i,tier in ipairs(tiers) do
  local name = "advanced-assembling-machine-"..tier.speed
  local entity = table.deepcopy(data.raw["assembling-machine"][base_name])
  entity.next_upgrade = nil
  entity.name = name
  entity.localised_name = {"entity-name."..name}
  entity.minable.result = name
  entity.crafting_speed = tier.speed
  entity.energy_usage = tier.power
  entity.energy_source.emissions_per_minute.pollution = tier.pollution
  entity.max_health = tier.health
  local path = "__advanced-assembling-machine-improved__/graphics/"..tier.speed.."/"
  entity.graphics_set = require("prototypes.graphics")(tier.speed)
  if tier.speed == 320 then
    -- Keep the process chamber visible; center the recipe on the front panel, with modules below.
    entity.icon_draw_specification = {scale=0.9,shift={0,0.95}}
    entity.icons_positioning = {{inventory_index=defines.inventory.assembling_machine_modules,
      shift={0,1.80},scale=0.5,max_icons_per_row=6,max_icon_rows=1}}
  end
  entity.icon = path.."icon.png"
  data.raw["assembling-machine"][previous].next_upgrade = name

  local item = table.deepcopy(data.raw.item[base_name])
  item.name = name
  item.localised_name = entity.localised_name
  item.place_result = name
  item.order = "c[advanced-assembling-machine]-"..i
  item.icon = entity.icon

  local ingredients = {
    {type="item",name="assembling-machine-2",amount=1},
    {type="item",name="steel-plate",amount=i==4 and 20 or 10},
    {type="item",name="iron-gear-wheel",amount=20}
  }
  local technology = {
    type="technology",name="advanced-automation-"..tier.color,
    localised_name={"technology-name.advanced-automation-"..tier.speed},
    icon="__advanced-assembling-machine-improved__/graphics/"..tier.speed.."/technology.png",icon_size=256,
    order="a-e-e-"..i
  }
  if mods["space-age"] then
    local starters = {
      {gate="foundry",milestone="tungsten-carbide",material="tungsten-carbide",amount=5},
      {gate="holmium-processing",milestone="holmium-plate",material="holmium-plate",amount=5},
      {gate="lithium-processing",milestone="lithium-plate",material="lithium-plate",amount=5},
      {gate="cryogenic-plant",milestone="cryogenic-plant",material="lithium-plate",amount=10}
    }
    local starter = starters[i]
    technology.prerequisites = {starter.gate}
    technology.research_trigger = {type="craft-item",item=starter.milestone,count=i==4 and 1 or 5}
    ingredients[#ingredients+1] = {type="item",name=starter.material,amount=starter.amount}
    ingredients[#ingredients+1] = {type="item",name=i>=3 and "processing-unit" or "electronic-circuit",amount=i==4 and 20 or 10}
    if i==2 then ingredients[#ingredients+1] = {type="item",name="advanced-circuit",amount=5} end
    if i==4 then ingredients[#ingredients+1] = {type="item",name="superconductor",amount=10} end
  else
    local gates = {"advanced-circuit", "chemical-science-pack", "production-science-pack", "utility-science-pack"}
    technology.prerequisites = {"automation-returns",gates[i]}
    local science = {{"automation-science-pack",1},{"logistic-science-pack",1}}
    if i>=2 then science[#science+1]={"chemical-science-pack",1} end
    if i>=3 then science[#science+1]={"production-science-pack",1} end
    if i>=4 then science[#science+1]={"utility-science-pack",1} end
    technology.unit = {count=50+i*25,time=10,ingredients=science}
    ingredients[#ingredients+1]={type="item",name=i>=3 and "processing-unit" or "advanced-circuit",amount=i==4 and 20 or 10}
  end
  local recipe = {
    type="recipe",name=name,localised_name=entity.localised_name,enabled=false,energy_required=5,
    ingredients=ingredients,results={{type="item",name=name,amount=1}}
  }
  technology.effects={{type="unlock-recipe",recipe=name}}
  data:extend({entity,item,recipe,technology})
  previous = name
end
