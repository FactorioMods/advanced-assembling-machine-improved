-- Original saves used a 5x5 machine. Keep the compact layout as the default,
-- but allow the existing IDs to retain their original physical connections.
if settings.startup["advanced-assembler-layout"].value ~= "legacy-5x5" then
  return
end

local factor = 5 / 3
local function scale_position(position)
  return {(position.x or position[1]) * factor, (position.y or position[2]) * factor}
end

local function scale_graphics(value, seen)
  if type(value) ~= "table" or seen[value] then return end
  seen[value] = true
  for key, child in pairs(value) do
    if key == "shift" and type(child) == "table" then
      value[key] = scale_position(child)
    elseif key == "scale" and type(child) == "number" then
      value[key] = child * factor
    elseif type(child) == "table" then
      scale_graphics(child, seen)
    end
  end
  if value.intensity and value.size then value.size = value.size * factor end
end

for _, name in ipairs({
  "advanced-assembling-machine-returns", "advanced-assembling-machine-40",
  "advanced-assembling-machine-80", "advanced-assembling-machine-160",
  "advanced-assembling-machine-320"
}) do
  local machine = data.raw["assembling-machine"][name]
  machine.collision_box = {{-2.4, -2.4}, {2.4, 2.4}}
  machine.selection_box = {{-2.5, -2.5}, {2.5, 2.5}}
  for _, box in ipairs(machine.fluid_boxes) do
    for _, connection in ipairs(box.pipe_connections) do
      connection.position[2] = connection.position[2] < 0 and -2 or 2
    end
  end
  scale_graphics(machine.graphics_set, {})
  if machine.icon_draw_specification and machine.icon_draw_specification.shift then
    machine.icon_draw_specification.shift = scale_position(machine.icon_draw_specification.shift)
  end
  for _, icons in ipairs(machine.icons_positioning or {}) do
    if icons.shift then icons.shift = scale_position(icons.shift) end
  end
end

-- This is the only tier in the original mod. Keep its original power budget;
-- the additional tiers retain the fork's published power requirements.
data.raw["assembling-machine"]["advanced-assembling-machine-returns"].energy_usage = "3750kW"

local recipe = data.raw.recipe["advanced-assembling-machine-returns"]
recipe.energy_required = 0.5
recipe.ingredients = {
  {type = "item", name = "assembling-machine-3", amount = 10},
  {type = "item", name = "speed-module", amount = 5},
  {type = "item", name = "bulk-inserter", amount = 5}
}

local technology = data.raw.technology["automation-returns"]
technology.prerequisites = {"speed-module", "logistics-2", "advanced-circuit", "automation-3"}
technology.unit = {
  count = 300,
  ingredients = {{"automation-science-pack", 2}, {"logistic-science-pack", 2}, {"chemical-science-pack", 1}},
  time = 30
}
