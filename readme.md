# PrusaSlicer 2.6 AnkerMake Community Profiles

[![GitHub release](https://img.shields.io/github/v/release/Ankermgmt/prusaslicer-ankermake-ce-profiles?display_name=tag&sort=semver&style=for-the-badge)](https://github.com/Ankermgmt/prusaslicer-ankermake-ce-profiles/releases/latest)

![image](https://github.com/Ankermgmt/prusaslicer-ankermake-ce-profiles/assets/10281380/77beb5cb-c6cb-4385-a266-0ff0e30ac9c2)

![image](https://github.com/Ankermgmt/prusaslicer-ankermake-ce-profiles/assets/10281380/74403731-ea59-402a-aa6c-be65c6b27891)

[WE NOW HAVE AN INSTALL SCRIPT (YAY!)...](/readme.md#scripted-install)

## Overview

This repository holds the latest version and updates to AnkerMake community profiles [initially developed and maintained by @just-trey](https://github.com/just-trey/ankermake-m5-profile). We have decided to continue to support these profiles to allow users an alternative to the official profiles provided by AnkerMake. You can install these profiles alongside the built-in AnkerMake profiles. Why not install both and see which one you prefer?

### "FAST" modes

Please note that the FAST included is not the max acceleration and speed the M% can perform. Higher speed can be achieved by adjusting the speed and acceleration. We found the setting (thanks @Xelinor) provided to be the best compromise for quality vs. speed.

### A note about z-lift

We have z-lift disabled by default as it impacts print times. If you find your nozzle scraping surfaces or plan on using ironing, enabling z-lift is highly recommended. We recommend a .25 z-lift height.

### Tuning (A.K.A. HELP WANTED)

I have spent about two weeks tuning these profiles (while working a regular full-time job as well), and there is not enough time to ensure everything is perfect. Most of my tests have been run using PLA+ AnkerMake Gray filamentt. Please let me know if you find or dial in any setting that produces a higher quality or better result for any setting. You can fork the repo and make a PR, or if you are not comfortable with that, find me on the [AnkerMake community discord](https://discord.gg/ankermake) and share your config with me. I am @just-trey.

## Known Issues

- The speed multiplier (ex x1.8) is not correct.
- Changing speeds via the touch screen or app after printing starts is not working

## Note

The configuration authors strongly believe there is no "one size fits all" profile. These profiles provide an excellent base to get started, but we highly encourage users to learn and adjust their slicer settings to suit their use case.

## Installing the profile

For Either option be sure to download [PrusaSlicer-AMCE-Profile.zip](https://github.com/Ankermgmt/prusaslicer-ankermake-ce-profiles/releases/latest/download/PrusaSlicer-AMCE-Profile.zip)

### Scripted Install

We now provide Bash and Powershell scripts to make installing/updating these profiles easier.

Run `./install.sh` or `./install.ps1` to install/update the profiles.

1. Extract the zip files (Our example uses the download directory)
2. Open the terminal/PowerShell window
3. `cd ~/Downloads/PrusaSlicer-AMCE-Profile`
4. run `./install.sh` (mac/Linux) or `.\install.ps1` (windows)

### Manual Install

1. Open PrusaSlicer
1. Under the Help Menu, choose "Show Configuration Folder" (keep this folder open for the next several steps).
1. Close out of PrusaSlicer
1. Extract the zip file to a location of your choice and open the folder.
1. Copy the *"vendor"* folder to the Configuration folder you opened in step two.![image](https://user-images.githubusercontent.com/10281380/209450820-d98c5f82-07d5-453b-b5e1-11b294b257ac.png)

## Installing the printer

1. Open PrusaSlicer and you should now be able to add a new AnkerMake M5 CE Printer. (printer Settings tab → Printer drop-down → Add/remove printers
1. In the Configuration Wizard, choose Other Vendors:
1. Select the AnkerMake CE Checkbox
1. Select AnkerMake CE FFF under the left menu
1. Ensure the check mark next to the 0.4 mm nozzle is enabled.
1. In the left Navigation, select Filaments and then select all available filaments.  
1. Once you have added any other printers or made changes, click Finish on the Configuration wizard.

## How to print via wifi after slicing

Printing files via wifi is supported but not directly from PrusaSlicer. You may print via wifi using the AnkerMake Slicer.

### Steps

1. Slice and save your gcode to a location of your choice
1. Make sure your AnkerMake M5 printer is on and connected to wifi
1. Open the AnkerMake Slicer
1. Click on the Device tab
1. Click on the My Computer icon and select your sliced file. ![image](https://user-images.githubusercontent.com/10281380/206552887-486043c2-3329-4105-ad99-438bf1f64516.png)
1. Click print underneath the device details. ![image](https://user-images.githubusercontent.com/10281380/206553190-b5b8a1b8-454d-46a1-8b97-368d6a0632d6.png)

## Special Thanks

I want to give special thanks to [@dmbaio](https://github.com/dmbaio) and [@TheMasterOfTech](https://github.com/TheMasterOfTech) for ideas, input, and inspiration and [@spuder](https://github.com/spuder) for some PRs that make all our lives easier.

## Licences

- Prusa profiles are under-released under the [GNU AFFERO GENERAL PUBLIC LICENSE](LICENSE).

## Changelog

[View Changelog](/changelog.md)
