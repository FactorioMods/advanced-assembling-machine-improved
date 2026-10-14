local base_name = "advanced-assembling-machine-returns"
local previous = base_name
local tiers = {
  {speed=40, power="7500kW", pollution=40, health=800, color="orange", count=600,
   module="speed-module-2", modules=5, circuits=100, structures=50, science="production-science-pack"},
  {speed=80, power="15000kW", pollution=80, health=1000, color="purple", count=1000,
   module="speed-module-2", modules=10, circuits=100, structures=100, science="utility-science-pack"},
  {speed=160, power="30000kW", pollution=160, health=1200, color="blue", count=2000,
   module="speed-module-3", modules=10, circuits=200, structures=100, science="utility-science-pack"},
  {speed=320, power="60000kW", pollution=320, health=1600, color="white", count=4000,
   module="speed-module-3", modules=20, circuits=300, structures=200, science="utility-science-pack"}
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
  entity.graphics_set.animation.filename = path.."machine.png"
  entity.graphics_set.working_visualisations[1].animation.filename = path.."machine-working.png"
  entity.icon = path.."icon.png"
  data.raw["assembling-machine"][previous].next_upgrade = name

  local item = table.deepcopy(data.raw.item[base_name])
  item.name = name
  item.localised_name = entity.localised_name
  item.place_result = name
  item.order = "c[advanced-assembling-machine]-"..i
  item.icon = entity.icon

  local recipe = {
    type="recipe",name=name,localised_name=entity.localised_name,enabled=false,energy_required=15*i,
    ingredients={{type="item",name=previous,amount=2},
      {type="item",name=tier.module,amount=tier.modules},
      {type="item",name="processing-unit",amount=tier.circuits},
      {type="item",name="low-density-structure",amount=tier.structures}},
    results={{type="item",name=name,amount=1}}
  }
  local science = {{"automation-science-pack",2},{"logistic-science-pack",2},{"chemical-science-pack",1},{"production-science-pack",1}}
  if i>1 then science[#science+1]={"utility-science-pack",1} end
  local technology = {
    type="technology",name="advanced-automation-"..tier.color,
    localised_name={"technology-name.advanced-automation-"..tier.speed},
    icon="__advanced-assembling-machine-improved__/graphics/"..tier.speed.."/technology.png",icon_size=256,
    prerequisites={i==1 and "automation-returns" or "advanced-automation-"..tiers[i-1].color,
      tier.module,tier.science=="production-science-pack" and "production-science-pack" or "utility-science-pack"},
    effects={{type="unlock-recipe",recipe=name}},unit={count=tier.count,time=30,ingredients=science},order="a-e-e-"..i
  }
  if mods["space-age"] then
    local gate = ({"foundry", "electromagnetic-plant", "cryogenic-plant", "quantum-processor"})[i]
    technology.prerequisites[#technology.prerequisites+1] = gate
    technology.unit.ingredients[#technology.unit.ingredients+1] = {"space-science-pack",1}
    technology.unit.ingredients[#technology.unit.ingredients+1] = {"metallurgic-science-pack",1}
    if i>=2 then technology.unit.ingredients[#technology.unit.ingredients+1] = {"electromagnetic-science-pack",1} end
    if i>=3 then
      technology.unit.ingredients[#technology.unit.ingredients+1] = {"agricultural-science-pack",1}
      technology.unit.ingredients[#technology.unit.ingredients+1] = {"cryogenic-science-pack",1}
    end
    local extra = {
      {{type="item",name="foundry",amount=1},{type="item",name="tungsten-plate",amount=50}},
      {{type="item",name="electromagnetic-plant",amount=1},{type="item",name="superconductor",amount=100}},
      {{type="item",name="cryogenic-plant",amount=1},{type="item",name="lithium-plate",amount=100}},
      {{type="item",name="quantum-processor",amount=100},{type="item",name="superconductor",amount=200}}
    }
    for _,ingredient in ipairs(extra[i]) do recipe.ingredients[#recipe.ingredients+1] = ingredient end
    -- Every science pack used in research must itself be unlocked first.
    for _,ingredient in ipairs(technology.unit.ingredients) do
      technology.prerequisites[#technology.prerequisites+1] = ingredient[1]
    end
  end
  local seen, prerequisites = {}, {}
  for _,prerequisite in ipairs(technology.prerequisites) do
    if not seen[prerequisite] then
      prerequisites[#prerequisites+1] = prerequisite
      seen[prerequisite] = true
    end
  end
  technology.prerequisites = prerequisites
  data:extend({entity,item,recipe,technology})
  previous = name
end
