# Advanced Assembly Machines: Improved

A Factorio 2.0 fork of Advanced Assembly Machines Returns and Altarin's Space Age port. Compact 3x3 machines with distinct animated graphics and five crafting-speed tiers.

| Crafting speed | Color | Design | Active power (normal quality, no modules) |
|---|---|---|---|
| 20 | Green | Refined vanilla mechanical assembly | 375 kW |
| 40 | Orange | Vulcanus metalworking press | 750 kW |
| 80 | Purple | Fulgora electronics assembly | 1.5 MW |
| 160 | Blue | Aquilo cryogenic precision work | 3 MW |
| 320 | White | Final advanced processing chamber | 6 MW |

Colors follow Matt's Logistics belts. Each tier has its own internal machinery; only the white tier shows the fictional dark-matter effect. These visuals do not add a dark-matter resource or change the selected recipe.

Version 1.1.0 includes all five machines with Blender-rendered models and 48-frame native animation loops. The green machine has a connected gear train and articulated linkages; orange has a guided press; purple has placement heads and tape feeders; blue has reciprocating rotary tooling; white has radial tools around a contained process chamber. Fixed casings, pipework and cables stay stationary. Recolored vanilla-inspired casings have subtle dust and service grime, with more wear on the lower tiers.

Animation uses the engine's activity-based playback and separate shadow sprites, without a runtime Lua animation script. These are visual changes, not a measured FPS or UPS optimization.

## Starter recipes

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

All five remain multipurpose assembling machines, with the port's crafting categories and two fluid inputs/two outputs. The art themes do not restrict them to their pictured manufacturing task. Actual recipe surface requirements still apply.

## Installation and existing saves

Download the ZIP from [Releases](https://github.com/FactorioMods/advanced-assembling-machine-improved/releases) into your Factorio mods directory. Disable Advanced Assembly Machines Returns and its Space Age port before enabling this mod. They define the same original prototypes and cannot be enabled together.

Existing speed-20 machines, items, recipes and research keep their prototype names. The footprint changes from 5x5 to 3x3: previously adjacent inserters, loaders and pipes need to be moved one tile closer. Existing machine positions are retained; old blueprints need the same layout adjustment. Back up your save before switching mods. Multiplayer players need the same mod version and startup settings.

## Validation

The redesign was checked with Factorio 2.0.77 in an isolated copy of New_clean, retaining all 40 existing advanced machines. All five tiers passed input and output tests with nine Miniloaders Redux variants, including Matt's Logistics: 45 combinations. Two-input/two-output fluid production passed at all four rotations for every tier. Ordinary inserters supplied the green machine from all four sides, and four separate forces unlocked the planetary tiers through production milestones.

Consecutive native screenshots confirmed animation on all five tiers with continuous supply, less frequent motion with one craft per second, and no motion during the idle capture. Day and night rendering and sprite placement beside a vanilla assembler were inspected. A separate base-game-only save creation also passed. These checks are functional and visual tests, not a performance benchmark.

This is a graphics, footprint and progression fork. Code cleanup removes a redundant vanilla recipe-category definition, an obsolete mining field, hardcoded references to absent categories, and malformed locale data. The upstream already uses native crafting rather than per-tick Lua; no measured UPS gain is attributed to these changes.

## Credits

- [Advanced assembly machines](https://mods.factorio.com/mod/assembling-machine-up) by badway.
- [Advanced Assembly Machines Returns](https://mods.factorio.com/mod/advanced-assembling-machine-returns) by ElizTriad.
- [Space Age port](https://mods.factorio.com/mod/advanced-assembling-machine-returns-to-Space-Age) by Altarin; Chinese locale by Houraiji_Kyuusyou.
- Fork maintained by johnmart19. New machine artwork and native animation assets included under the Unlicense.

Matt's Logistics is a palette reference and tested companion mod; it is not required. This repository is independently created because no upstream source repository is listed.

## Latest graphics update (1.1.0)

Matte planetary dust and oily seams reduce the polished appearance. Vulcanus has a cycling hot billet, Fulgora has contained coil discharges, and Aquilo has a subtle cryogenic bed pulse. Clean idle frames prevent frozen transient effects. Smaller sprites and repositioned Alt icons improve three-tile layouts; loaders remain separate entities. All five tiers have 48 distinct production frames, with working motion and static idle states verified in Factorio 2.0.77. Real robot-built loader connections also passed 48 assembler direction/input-output cases.
