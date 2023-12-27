# PrusaSlicer 2.7 AnkerMake Community Profiles

[![GitHub release](https://img.shields.io/github/v/release/Ankermgmt/prusaslicer-ankermake-ce-profiles?display_name=tag&sort=semver&style=for-the-badge)](https://github.com/Ankermgmt/prusaslicer-ankermake-ce-profiles/releases/latest)

![image](https://github.com/Ankermgmt/prusaslicer-ankermake-ce-profiles/assets/10281380/77beb5cb-c6cb-4385-a266-0ff0e30ac9c2)

## Overview

This repository holds the latest version and updates to AnkerMake M5 andAnkerMake M5C community profiles for the [initially developed and maintained by @just-trey](https://github.com/just-trey/ankermake-m5-profile). We have decided to continue to support these profiles to allow users an alternative to the official profiles provided by AnkerMake. You can install these profiles alongside the built-in AnkerMake profiles. Why not install both and see which one you prefer?

### "FAST" modes

Please note that the FAST profile included is NOT the max acceleration and speed the printer can perform. Higher speed can be achieved by adjusting the speed and acceleration. We found the setting (thanks @Xelinor) provided to be the best compromise for quality vs. speed.

### A note about z-lift

We have z-lift disabled by default as it impacts print times. If you find your nozzle scraping surfaces, plan on manual filament changes mid-print, or are using ironing, enabling z-lift is highly recommended. We recommend at least a .25 z-lift height.

## Known Issues

- The speed multiplier (ex x1.8) is not correct.
- Changing speeds via the touch screen or app after printing starts is not working

## Note

The configuration authors strongly believe there is no "one size fits all" profile. These profiles provide an excellent base to get started, but we highly encourage users to learn and adjust their slicer settings to suit their use case.

## Installing the profile

Due to recent changes in Prusa Slicer you can only import profiles.

### Importing Profiles

1. Download the [AMCE_config_bundle.ini](https://github.com/Ankermgmt/prusaslicer-ankermake-ce-profiles/releases/latest/download/AMCE_config_bundle.ini)
1. Open Prusa Slicer,  AnkerMake Studio, or Super Slicer
1. Go to File -> Import -> Import Config Bundle
2. Locate 'AMCE_config_bundle.ini'  click open.
3. On the printer setting panel, select 'AnkerMake M5 (0.4 nozzle) @AMCE' or 'AnkerMake M5C (0.4 nozzle) @AMCE', then choose the filament and Print settings you would like to use.

## How to print via wifi after slicing

Printing files via wifi is supported but not directly from PrusaSlicer. You may print via wifi using the AnkerMake Studio.

## Licences

- Prusa profiles are under-released under the [GNU AFFERO GENERAL PUBLIC LICENSE](LICENSE).

## Changelog

[View Changelog](/changelog.md)
