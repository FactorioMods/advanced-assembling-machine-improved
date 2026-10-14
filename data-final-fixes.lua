if mods["space-age"] or mods["um-standalone-space-age-lib"] then
  local categories = {}
  for _,name in ipairs({
    "basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid",
    "electromagnetics", "electronics", "electronics-with-fluid", "pressing",
    "metallurgy-or-assembling", "organic-or-hand-crafting", "organic-or-assembling",
    "electronics-or-assembling", "cryogenics-or-assembling", "crafting-with-fluid-or-metallurgy"
  }) do
    if data.raw["recipe-category"][name] then
      categories[#categories+1] = name
    end
  end
  for _,name in ipairs({"advanced-assembling-machine-returns","advanced-assembling-machine-40","advanced-assembling-machine-80","advanced-assembling-machine-160","advanced-assembling-machine-320"}) do
    data.raw["assembling-machine"][name].crafting_categories = table.deepcopy(categories)
  end
end
