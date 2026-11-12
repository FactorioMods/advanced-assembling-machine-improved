-- Keep placed entities and their unit numbers stable for other mods.
local function unlock_families()
  -- Native technology progress and queued research are intentionally untouched.
  -- Newly added recipes follow the already researched tier technology.
  local tiers={"automation-returns","advanced-automation-orange","advanced-automation-purple",
    "advanced-automation-blue","advanced-automation-white"}
  for _,force in pairs(game.forces) do
    for i,speed in ipairs({20,40,80,160,320}) do
      if force.technologies[tiers[i]].researched then
        for _,family in ipairs({"small","large"}) do
          force.recipes["advanced-assembling-machine-"..family.."-"..speed].enabled=true
        end
      end
    end
  end
end
script.on_init(unlock_families)
script.on_configuration_changed(unlock_families)
