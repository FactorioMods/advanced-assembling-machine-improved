-- Public family names never depend on a startup setting. The old setting only
-- describes the saved layout of pre-1.1.6 aliases and their research balance.
local speeds = {20,40,80,160,320}
local old_names = {"advanced-assembling-machine-returns","advanced-assembling-machine-40",
  "advanced-assembling-machine-80","advanced-assembling-machine-160","advanced-assembling-machine-320"}
local techs = {"automation-returns","advanced-automation-orange","advanced-automation-purple",
  "advanced-automation-blue","advanced-automation-white"}
local compact = {}
for i,name in ipairs(old_names) do
  compact[i] = {entity=table.deepcopy(data.raw["assembling-machine"][name]),
    recipe=table.deepcopy(data.raw.recipe[name])}
end
require("prototypes.layout")
local function enlarge(entity)
  entity.collision_box={{-2.4,-2.4},{2.4,2.4}}
  entity.selection_box={{-2.5,-2.5},{2.5,2.5}}
  for _,box in ipairs(entity.fluid_boxes) do
    for _,connection in ipairs(box.pipe_connections) do
      connection.position[2]=connection.position[2]<0 and -2 or 2
    end
  end
  local factor=5/3
  local function visit(value,seen)
    if type(value)~="table" or seen[value] then return end
    seen[value]=true
    for key,child in pairs(value) do
      if key=="shift" and type(child)=="table" then
        value[key]={(child.x or child[1])*factor,(child.y or child[2])*factor}
      elseif key=="scale" and type(child)=="number" then value[key]=child*factor
      elseif type(child)=="table" then visit(child,seen) end
    end
    if value.intensity and value.size then value.size=value.size*factor end
  end
  visit(entity.graphics_set,{})
  for _,icons in ipairs(entity.icons_positioning or {}) do
    if icons.shift then icons.shift={icons.shift[1]*factor,icons.shift[2]*factor} end
  end
  if entity.icon_draw_specification.shift then
    local shift=entity.icon_draw_specification.shift
    entity.icon_draw_specification.shift={shift[1]*factor,shift[2]*factor}
  end
end
for i,old in ipairs(old_names) do
  local speed=speeds[i]
  for _,family in ipairs({"small","large"}) do
    local name="advanced-assembling-machine-"..family.."-"..speed
    local entity=table.deepcopy(compact[i].entity)
    entity.name=name
    entity.localised_name={"entity-name.advanced-assembler-family",{"entity-name."..old},
      {"advanced-assembler-family."..family}}
    entity.minable.result=name
    entity.next_upgrade=i<5 and "advanced-assembling-machine-"..family.."-"..speeds[i+1] or nil
    if family=="large" then
      enlarge(entity)
      if i==1 then entity.energy_usage="3750kW" end
      entity.ingredient_count=24
      -- The first four indices retain the original ports. Added ports are
      -- deliberately excluded from saved Large Legacy machines.
      for _,index in ipairs({1,2,3,4}) do
        local box=table.deepcopy(entity.fluid_boxes[index])
        box.pipe_connections[1].position[1]=index%2==1 and -2 or 2
        entity.fluid_boxes[#entity.fluid_boxes+1]=box
      end
    end
    local item=table.deepcopy(data.raw.item[old])
    item.name=name;item.localised_name=entity.localised_name;item.place_result=name
    local recipe=table.deepcopy(compact[i].recipe)
    recipe.name=name;recipe.localised_name=entity.localised_name
    recipe.results={{type="item",name=name,amount=1}}
    if family=="large" and i==1 then
      recipe.energy_required=.5
      recipe.ingredients={{type="item",name="assembling-machine-3",amount=10},
        {type="item",name="speed-module",amount=5},{type="item",name="bulk-inserter",amount=5}}
    end
    data:extend({entity,item,recipe})
    table.insert(data.raw.technology[techs[i]].effects,{type="unlock-recipe",recipe=name})

  end
  -- Keep the actual old entities, items and producer recipe IDs available to
  -- old blueprints, logistics and already-paid crafting jobs.
  data.raw["assembling-machine"][old].hidden=true
  local alias = data.raw["assembling-machine"][old]
  alias.next_upgrade=nil
  alias.localised_name={"entity-name.advanced-assembler-family",{"entity-name."..old},
    {"advanced-assembler-family."..(settings.startup["advanced-assembler-layout"].value=="legacy-5x5" and "large-legacy" or "small-legacy")}}
  alias.localised_description={"entity-description.advanced-assembler-legacy"}
  data.raw.item[old].localised_name=alias.localised_name
  data.raw.recipe[old].localised_name=alias.localised_name
  data.raw.item[old].hidden=true
  data.raw.recipe[old].hidden=true
end
