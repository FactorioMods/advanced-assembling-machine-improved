# Factorio 2.1 notes

Current fork version: **1.1.5**.

## Legacy factory compatibility

The startup **Assembler layout** setting defaults to compact 3x3. Select legacy 5x5 before replacing the original mod in an existing factory. Every tier then uses the original collision box (+/-2.4 tiles), selection box (+/-2.5 tiles), and two input/two output port positions at x=-1/+1, y=+2/-2. Machine IDs, positions, recipes and inventories are retained. Native animation, shadow, glow and overlay placement scale with the larger footprint.

Legacy mode also restores the original speed-20 machine's 3.75 MW active power budget, original crafting recipe and research requirements. The four additional tiers retain their existing 750 kW / 1.5 MW / 3 MW / 6 MW requirements. Crafting speeds, module-slot settings, productivity settings, fluid capacities and pollution are unchanged by the layout option.

## Version 1.1.5 native checks

Factorio 2.1.24 headless checks covered:

- All five tiers crafted a fluid recipe through adjacent pipes at four cardinal rotations in both layouts (40 cases).
- An existing original-mod machine crafted its saved fluid recipe through its retained factory pipe after the switch. No machine or surrounding equipment was moved.
- A representative original factory retained all 37 machines and 15 native fluid connections in legacy mode. The compact layout had disconnected those 15 connections; selecting the compatibility mode restored them. Existing native inserter targets were retained.
- The original machine recipe was crafted from its original ingredients. Native recipe and research assertions checked the original ingredient amounts, crafting time, science-pack amounts, research count, duration and prerequisites.
- Native prototype assertions checked footprint dimensions and the original/default speed-20 power budgets. The additional tiers retained their published power requirements.
- A private startup-setting receipt verified that adding the new legacy choice changed no other saved startup values.

The enlarged artwork uses native sprite scaling. This update did not include graphical rendering or real multiplayer join/rejoin checks. Test hooks and private player data are not included in releases.

## Earlier version 1.1.4 evidence

## Changes

- Updated pipe graphics and module-inventory references for 2.1.
- Removed ignored prototype fields.

## Earlier 2.1.23 tests

- All five tiers produced 75 gears from 100 iron plates with the tested productivity settings.
- Outputs survived save, server restart and client rejoin.
- Earlier tests covered loader transfer, two-input/two-output fluids, rotations, progression and native animation.

The production result depends on the tested productivity settings. Optional overhauls were not all tested.

Tests used private copies of saves and local host/client sessions. Raw player data and test hooks are not shipped.

## 1.1.4 checks on Factorio 2.1.24

Loading without Space Age now includes the optional basic-crafting category only when that category exists. The five tier names, crafting speeds, balance and artwork are unchanged.

Separate headless checks covered the base game, Quality with Recycler without Space Age, and the installed Space Age profile. All five tiers produced 50 gears from 100 iron plates with default startup settings in each profile. In the Space Age profile, every tier passed physical inserter input/output and fluid-port tests at all four cardinal rotations: each solid case produced five gears from ten plates, and each fluid case transferred 100 water through a private test recipe into 100 steam in the destination pipe. The test recipe was not added to the release. Existing-world checks used a private copied save.
