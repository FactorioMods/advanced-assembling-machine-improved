# Advanced Assembly Machines: Improved

Five tiers of fast assemblers, each available as Small 3×3 and Large 5×5.

**Factorio 2.1 · Version 1.1.7**

## Fork changes

- Small 3×3 and Large 5×5 machines are available together at every tier, with shared research and separate upgrade chains.
- Small supports 12 item ingredients and two fluid inputs/two outputs; Large supports 24 item ingredients and four fluid inputs/four outputs.
- Five planetary art styles, weathering and working effects.
- Native 48-frame production animations with a static idle state and improved recipe-icon placement.
- Accessible starter recipes and lower power requirements across the five tiers. Crafting speeds remain 20, 40, 80, 160 and 320.
- Independent planetary production milestones for higher tiers with Space Age, plus normal science progression without it.
- Updated Factorio 2.1 prototypes and loading support with or without Space Age, including Quality and Recycler without Space Age.

Module slots remain configurable from three to six, with four by default. The optional Space Age productivity bonus is 50% and is disabled by default. Planetary artwork does not limit which supported recipes a machine can craft.

## Installation

Requires Factorio 2.1.23+. Disable `advanced-assembling-machine-returns` and `advanced-assembling-machine-returns-to-Space-Age` before enabling this fork. Existing compact machines remain Small Legacy with the same entity identity. Existing machines saved with the legacy 5×5 layout remain **Large Legacy**, retaining their original four ports and pipe connections. Newly crafted Large machines have eight ports. Check nearby pipes before deliberately replacing a Large Legacy machine with Large.

Old machine items, recipes and entity names remain available for existing blueprints, logistics and crafting jobs. Before opening a factory from the original Returns mod or its Space Age port, select **Original 5x5 (Returns factories)** in the startup **Saved assembler layout (before 1.1.6)** setting. Earlier Improved factories use **Compact 3x3**. This visible compatibility selector retains old alias geometry and balance; newly crafted Small and Large machines always retain their fixed sizes. Small and Large share each tier's technology. The Large speed-20 recipe retains the original ingredients and 3.75 MW power budget; Small retains the compact starter recipe and 375 kW. Higher tiers retain their published recipes and power requirements.

See [recipes and progression](docs/RECIPES.md) for costs, unlocks and layout details.

[Mod Portal](https://mods.factorio.com/mod/advanced-assembling-machine-improved) · [Source](https://github.com/FactorioMods/advanced-assembling-machine-improved) · [Downloads](https://github.com/FactorioMods/advanced-assembling-machine-improved/releases) · [Validation](FACTORIO-2.1.md)

## Credits

Based on work by badway, ElizTriad and Altarin; Chinese locale by Houraiji_Kyuusyou. Maintained by johnmart19 under the [Unlicense](LICENSE).
