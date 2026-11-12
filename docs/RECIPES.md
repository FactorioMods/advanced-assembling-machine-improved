# Assembler recipes and progression

## Small starter recipes

Every recipe produces one machine and takes 5 seconds before crafting-speed modifiers. All four colored tiers can be crafted directly from an assembling machine 2; they do not consume previous advanced tiers or planetary production buildings.

| Tier | Ingredients with Space Age | Unlock |
|---|---|---|
| 20 | 1 assembling machine 2, 10 iron gears, 5 steel plates, 5 electronic circuits | Automation 2, then 50 red/green research cycles |
| 40 | 1 assembling machine 2, 20 iron gears, 10 steel plates, 10 electronic circuits, 5 tungsten carbide | Foundry technology, then produce 5 tungsten carbide |
| 80 | 1 assembling machine 2, 20 iron gears, 10 steel plates, 10 electronic circuits, 5 advanced circuits, 5 holmium plates | Holmium processing, then produce 5 holmium plates |
| 160 | 1 assembling machine 2, 20 iron gears, 10 steel plates, 10 processing units, 5 lithium plates | Lithium processing, then produce 5 lithium plates |
| 320 | 1 assembling machine 2, 20 iron gears, 20 steel plates, 20 processing units, 10 lithium plates, 10 superconductors | Cryogenic plant technology, then produce 1 cryogenic plant |

The planet tiers use production milestones instead of additional planetary science research. Vulcanus, Fulgora and Aquilo access is independent: unlocking an assembler on one planet does not require the assembler from another. The white tier becomes available with the first cryogenic plant, without quantum processors.

Without Space Age, colored machines use an assembling machine 2, 20 iron gears, 10 steel plates (20 for white), and 10 advanced circuits for orange/purple or 10 processing units for blue (20 for white). Research costs 75/100/125/150 cycles, adding blue, purple and yellow science through normal base-game progression.

Crafting speeds and startup options are retained. Module slots remain configurable from 3 to 6 (default 4); the optional Space Age productivity bonus remains 50% and is off by default. Active power is reduced to 375 kW / 750 kW / 1.5 MW / 3 MW / 6 MW to reduce the power barrier for starter factories.

Both families remain multipurpose assembling machines with the same crafting categories. Small supports 12 item ingredients and two fluid inputs/two outputs. Large supports 24 item ingredients and four fluid inputs/four outputs. The art themes do not restrict them to their pictured manufacturing task. Actual recipe surface requirements still apply.

## Large starter recipe and shared research

The original speed-20 recipe requires 10 assembling machines 3, five speed modules and five bulk inserters, with a 0.5-second crafting time. For saves retaining the legacy layout setting, shared tier-20 research retains the original 300 cycles of two automation, two logistic and one chemical science packs, at 30 seconds per cycle. Its prerequisites are Speed module, Logistics 2, Advanced electronics and Automation 3. The additional four tiers keep the recipes and research described above.

## Installation and existing saves

Download the ZIP from [Releases](https://github.com/FactorioMods/advanced-assembling-machine-improved/releases) into your Factorio mods directory. Disable Advanced Assembly Machines Returns and its Space Age port before enabling this mod. They define the same original prototypes and cannot be enabled together.

Existing machines saved with the compact layout remain Small Legacy. Machines saved with the legacy 5×5 layout remain Large Legacy, preserving the original four fluid ports and 12-ingredient capacity. Existing entity references, unit numbers, positions, direction, quality, inventories, modules, fluids, crafting progress and circuit settings remain untouched. Old items, recipes and entities remain available to existing blueprints, logistics and already-paid crafting jobs.

Small and Large are available simultaneously and share each tier technology. Their upgrade targets stay within the selected family. Legacy aliases have no automatic upgrade target; replacing one with a new Small or Large is a deliberate layout change. The startup **Saved assembler layout (before 1.1.6)** selector controls old aliases only. Choose **Original 5x5 (Returns factories)** before loading a factory from Returns or its Space Age port; choose **Compact 3x3** for earlier Improved factories. Both new size families remain available with either choice. Multiplayer players need the same mod version and startup settings.
