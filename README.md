# Advanced Assembly Machines: Improved

A Factorio 2.0 fork of Advanced Assembly Machines Returns and Altarin's Space Age port. Compact 3x3 machines with distinct animated graphics and five crafting-speed tiers.

| Crafting speed | Color | Design | Active power (normal quality, no modules) |
|---|---|---|---|
| 20 | Green | Refined vanilla mechanical assembly | 3.75 MW |
| 40 | Orange | Vulcanus metalworking press | 7.5 MW |
| 80 | Purple | Fulgora electronics assembly | 15 MW |
| 160 | Blue | Aquilo cryogenic precision work | 30 MW |
| 320 | White | Final advanced processing chamber | 60 MW |

Colors follow Matt's Logistics belts. Each tier has its own internal machinery; only the white tier shows the fictional dark-matter effect. These visuals do not add a dark-matter resource or change the selected recipe. Tooling and the final chamber animate through Factorio's native renderer while crafting. There is no runtime Lua script.

The original speed-20 recipe, technology, power use and startup options are retained. Module slots remain configurable from 3 to 6 (default 4); the optional Space Age productivity bonus remains 50% and is off by default. Higher tiers require two previous-tier machines, more modules and advanced materials, and progressively more research and power. With Space Age, their recipes and research use Vulcanus, Fulgora and Aquilo materials and technology; the final tier requires quantum processors. Without the DLC, they use base-game materials and science.

All five remain multipurpose assembling machines, with the port's crafting categories and two fluid inputs/two outputs. The art themes do not restrict them to their pictured manufacturing task. Actual recipe surface requirements still apply.

## Installation and existing saves

Download the ZIP from [Releases](https://github.com/FactorioMods/advanced-assembling-machine-improved/releases) into your Factorio mods directory. Disable Advanced Assembly Machines Returns and its Space Age port before enabling this mod. They define the same original prototypes and cannot be enabled together.

Existing speed-20 machines, items, recipes and research keep their prototype names. The footprint changes from 5x5 to 3x3: previously adjacent inserters, loaders and pipes need to be moved one tile closer. Existing machine positions are retained; old blueprints need the same layout adjustment. Back up your save before switching mods. Multiplayer players need the same mod version and startup settings.

## Validation

Tested with Factorio 2.0.77 in isolated game data directories. Loading a copy of New_clean retained all 40 existing advanced machines. The functional fixture exercised all five machines with all nine installed Miniloaders Redux tiers, including Matt's Logistics variants: 45 input/output combinations. Two-input/two-output fluid production passed at all four rotations for every machine. Ordinary inserters supplied the three-tile machine from all four sides. Native rendering and a base-game-only load were also checked.

This is a graphics, footprint and progression fork. Code cleanup removes a redundant vanilla recipe-category definition, an obsolete mining field, hardcoded references to absent categories, and malformed locale data. The upstream already uses native crafting rather than per-tick Lua; no measured UPS gain is attributed to these changes.

## Credits

- [Advanced assembly machines](https://mods.factorio.com/mod/assembling-machine-up) by badway.
- [Advanced Assembly Machines Returns](https://mods.factorio.com/mod/advanced-assembling-machine-returns) by ElizTriad.
- [Space Age port](https://mods.factorio.com/mod/advanced-assembling-machine-returns-to-Space-Age) by Altarin; Chinese locale by Houraiji_Kyuusyou.
- Fork maintained by johnmart19. New machine artwork and native animation assets included under the Unlicense.

Matt's Logistics is a palette reference and tested companion mod; it is not required. This repository is independently created because no upstream source repository is listed.
