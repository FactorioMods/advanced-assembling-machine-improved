# Factorio 2.1 notes

Tested with **Factorio 2.1.23**. Current fork version: **1.1.3**.

## Changes

- Updated pipe graphics and module-inventory references for 2.1.
- Removed ignored prototype fields.

## Tests

- All five tiers produced 75 gears from 100 iron plates with the tested productivity settings.
- Outputs survived save, server restart and client rejoin.
- Earlier tests covered loader transfer, two-input/two-output fluids, rotations, progression and native animation.

The production result depends on the tested productivity settings. Optional overhauls were not all tested.

Tests used private copies of saves and local host/client sessions. Raw player data and test hooks are not shipped.
