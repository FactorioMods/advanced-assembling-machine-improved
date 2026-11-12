# Advanced Assembly Machines: Improved

Five tiers of fast assemblers, redesigned for compact factories.

**Factorio 2.1 · Version 1.1.5**

## Fork changes

- Compact 3×3 machines with five planetary art styles, weathering and working effects. An optional legacy 5×5 layout retains original factory connections.
- Native 48-frame production animations with a static idle state and improved recipe-icon placement.
- Accessible starter recipes and lower power requirements across the five tiers. Crafting speeds remain 20, 40, 80, 160 and 320.
- Independent planetary production milestones for higher tiers with Space Age, plus normal science progression without it.
- Updated Factorio 2.1 prototypes and loading support with or without Space Age, including Quality and Recycler without Space Age.

Module slots remain configurable from three to six, with four by default. The optional Space Age productivity bonus is 50% and is disabled by default. Planetary artwork does not limit which supported recipes a machine can craft.

## Installation

Requires Factorio 2.1.23+. Disable `advanced-assembling-machine-returns` and `advanced-assembling-machine-returns-to-Space-Age` before enabling this fork. Existing machines retain their names and positions. Before loading a factory built with the original 5×5 machines, select **Legacy 5×5 with original balance** in the startup **Assembler layout** setting. It restores the original footprint and fluid ports without moving entities or surrounding equipment. All five tiers use the selected footprint. The original speed-20 tier uses its original crafting recipe, research requirements and 3.75 MW power budget in legacy mode; the four added tiers retain their published power requirements. Compact 3×3 remains the default for existing fork factories. Switching footprint in a built factory can disconnect adjacent equipment.

See [recipes and progression](docs/RECIPES.md) for costs, unlocks and layout details.

[Mod Portal](https://mods.factorio.com/mod/advanced-assembling-machine-improved) · [Source](https://github.com/FactorioMods/advanced-assembling-machine-improved) · [Downloads](https://github.com/FactorioMods/advanced-assembling-machine-improved/releases) · [Validation](FACTORIO-2.1.md)

## Credits

Based on work by badway, ElizTriad and Altarin; Chinese locale by Houraiji_Kyuusyou. Maintained by johnmart19 under the [Unlicense](LICENSE).
