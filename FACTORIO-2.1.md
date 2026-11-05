# Factorio 2.1 notes

Current fork version: **1.1.4**.

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
