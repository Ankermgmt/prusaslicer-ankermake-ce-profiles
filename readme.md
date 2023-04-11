# PrusaSlicer 2.6-alpha AnkerMake Community Profiles

[![GitHub release](https://img.shields.io/github/v/release/Ankermgmt/prusaslicer-ankermake-ce-profiles?display_name=tag&sort=semver&style=for-the-badge)](https://github.com/Ankermgmt/prusaslicer-ankermake-ce-profiles/releases/latest)

![image](https://user-images.githubusercontent.com/10281380/231049563-ffde8326-08e2-4b79-9bfe-a261e1a01ed7.png)

## Overview

This repository holds the latest version and updates to AnkerMake community profiles [initially developed and maintained by @just-trey](https://github.com/just-trey/ankermake-m5-profile). We have decided to continue to support these profiles to allow users an alternative to the official profiles provided by AnkerMake. You can install these profiles alongside the built-in AnkerMake profiles. Why not install both and see which one you prefer?

## Known Issues

- The speed multiplier (ex x1.8) is not correct.

## Note

The configuration authors strongly believe there is no "one size fits all" profile. These profiles provide an excellent base to get started, but we highly encourage users to learn and adjust their slicer settings to suit their use case.

## Installing the profile

1. Open PrusaSlicer
1. Under the Help Menu, choose "Show Configuration Folder" (keep this folder open for the next several steps).
1. Close out of PrusaSlicer
1. Download [PrusaSlicer-2.6-AMCE-Profile.zip](https://github.com/Ankermgmt/prusaslicer-ankermake-ce-profiles/releases/latest/download/PrusaSlicer-5.x-AMCE-Profile.zip)
1. Extract the zip file to a location of your choice and open the folder.
1. Copy the *"vendor"* folder to the Configuration folder you opened in step two.![image](https://user-images.githubusercontent.com/10281380/209450820-d98c5f82-07d5-453b-b5e1-11b294b257ac.png)
1. Open PrusaSlicer, and you should now be able to add a new AnkerMake M5 CE Printer. (printer Settings tab → Printer drop-down → Add/remove printers
1. In the Configuration Wizard, choose Other Vendors:
1. Select the AnkerMake CE Checkbox
1. Select AnkerMake CE FFF under the left menu
1. Ensure the check mark next to the 0.4 mm nozzle is enabled.
1. In the left Navigation, select Filaments and then select all available filaments.  
1. Once you have added any other printers or made changes, click Finish on the Configuration wizard.

You now should have the AnkerMake M5 Community Edition Printer Profiles.

## How to print via wifi after slicing

Printing files via wifi is supported but not directly from PrusaSlicer. You may print via wifi using the AnkerMake Slicer.

### Steps

1. Slice and save your gcode to a location of your choice
1. Make sure your AnkerMake M5 printer is on and connected to wifi
1. Open the AnkerMake Slicer
1. Click on the Device tab
1. Click on the My Computer icon and select your sliced file. ![image](https://user-images.githubusercontent.com/10281380/206552887-486043c2-3329-4105-ad99-438bf1f64516.png)
1. Click print underneath the device details. ![image](https://user-images.githubusercontent.com/10281380/206553190-b5b8a1b8-454d-46a1-8b97-368d6a0632d6.png)

## Licences

  - - Prusa prfiles are under released under the [GNU AFFERO GENERAL PUBLIC LICENSE](LICENSE).

## Changelog

[View Changelog](/changelog.md)
