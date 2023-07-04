# Changelog

## v2.3.2

- Improved PETG settings (by @Xelinor)
- Added Lukagra's filament change gcode (better than just M600)
- Slightly modified extrusion widths
- Removed extruder default color so chosen filament color is used in the preview thumbnail
- Removed duplicate filaments in the config bundle version

## v2.3.1

- fixed pattern match so fast profiles are available
- Added config bundle to allow import to AnkerMake Alpha Slicer
- Removed build workflow is it was not working
- fixed minor issue with brim settings behavior

## v2.3.0

- Removed classic mode printer and tuned profiles to match performance
- Added ooze reduction temps to start g-code (inspired by the Technical Ace's profiles)
- Removed any settings that matched PrusaSlicer's default or have been deprecated to simplify configuration
- Removed overhang speed reduction in fast mode.
- Set organic supports as the default. support method
- Tuning adjustments:
  - Enabled external_perimeters_first on fast mode for a SIGNIFICANT increase in surface quality
  - Modified gcode_resolution for finer slicing details
  - Modified the following to improve speeds
    - max_print_speed
    - solid_infill_speed
    - travel_acceleration
  - Modified the following to get smoother perimeters:
    - perimeter_acceleration
    - small_perimeter_speed
  - Modified skirt_distance to bring it slightly closer to print
  - first_layer_height now matches other layer heights
  - slight adjustments to better tune filaments
  - cleaned up windows install script

## v2.2.0

- Time estimates are much more accurate than previous versions
- Added scripted install (thank you, @spuder)
- Renamed old printer setup to "CLASSIC" and removed FAST from printer options  [more details are available in the readme.md](/readme.md#220-update-notice)
- Allow higher quality profiles to be used in "FAST MODE."
- Removed many unneeded settings that made no real difference
- Tuned bridges (may still need some optimization)
- Modified accelerations where they did not match firmware or provide better print quality.
- Tuned printing speeds
- Made default profiles have 3 perimeters
- Fixed PETG temp bug

## v2.1.1

- No changes to settings, fixing a version mismatch to avoid confusion.
- removed version number from published zip file.

## v2.1.0

- This version enables a fast mode consistently. See the [readme.md](https://github.com/Ankermgmt/prusaslicer-ankermake-ce-profiles/blob/master/readme.md) for more details.
- New community edition M5 icon for the configuration wizard
- Optimized bottom and top surface patterns for regular profiles. (monotonic lines)
- Tuned some speed settings and moved to percentages where possible.
- Increased default fill density by 5% and reduced default perimeter to 2.
- Increased infill overlap to close up some holes on surfaces
- Minor adjuments to volumetric configurations to improve print quality and speeds
- Implemented minimum print layer time on regular speed prints to increase quality.

## v2.0.0-beta-1

- This is a rewrite of the entire configuration to leverage the new speed setting provided by AnkerMake. Additional changes have been made that are not listed. For a full diff of the main configuration, please look here: <https://www.diffnow.com/compare-urls?url1=https://raw.githubusercontent.com/just-trey/ankermake-m5-profile/d195005c51015fb9b1d4d9afdea68b1a546ae1c4/PrusaSlicer-2.5-M5-Profile/vendor/AnkerMake.ini&url2=https://raw.githubusercontent.com/Ankermgmt/prusaslicer-ankermake-ce-profiles/6cdfd5c1445e05448e6bf88d7a6f7dc217adc2a2/vendor/AnkerMakeCE.ini&demo=1>
- Moved to Ankermgmt organization (NOT AFFILIATED WITH ANKER)
- Moved Cura and PrusaSlicer configurations into separate repositories
  - **NOTE:** Moving forward, this repository will contain PrusaSlicer Configurations only
- Moved the majority of configurations to an AnkerMake CE base profile.
- Moved the remaining configurations to an AnkerMake CE M5 profile.
- Added CE (Community Edition) to allow the profile to be installed separately from the built-in AnkerMake profile.
- Modified layer heights to be .5 in difference (0.5, 1.0, 1.5, 2.0, 2.5, 3.0)
- added three new SPEED profiles (1.5, 2.0, 2.5)
- Complete rework of speeds for all profiles
- update gcode flavor to marlin 2 to improve time estimates. (special thanks to discord member @dmbaio)
- modified extrusion widths to be similar to other profiles
- added max_volumetric_speed to base profile and also max_volumetric_speeds to filament types
- enabled new overhang speeds
- changed top layer infill to new "monotonic lines" option
- added ironing settings provided by @TheMasterOfTech

## 1.10

- Cura Profile Changes
  - Apply transparency to the bed plate to be able to work underneath
  - Add M420 S1 to start gcode for bed leveling (via contribution from @imadcat)
  - Fixed start gcode typo (via contribution from @JaredTamana)
- Prusa Slicer Profile Changes
  - Apply transparency to bed plate to be able to work underneath
  - Add M420 S1 to start gcode for bed leveling (via contribution from @imadcat)
  - Fixed start gcode typo (via contribution from @JaredTamana)
  - Update file name format and remove commas to prevent export name issues on Mac
- Other changes
  - Renamed primary branch to Main

## 1.9

- Cura Profile Changes
  - Reset xy_offset_layer_0 to default to fix issue when using a brim
  - Added max acceleration speed logic
- Prusa Slicer Profile Changes
  - Add a 0.6 nozzle profile
- Other changes
  - Fix typo in Cura readme.md

## 1.8 - 12/7/2022

- Cura Profile Changes
  - none
- Prusa Slicer Profile Changes
  - Disabled "Thick bridges" to improve the quality on shorter bridges
- Other changes
  - Migration from Google doc to GitHub repo for Prusa Slicer documentation and simplified install instructions and fixed nested directories in zip
  - Added required licenses
  - Added Repo Base Readme to point to both profile instructions
  - moved the changelog to its dedicated file
  - merged Prusa Slicer and Cura changelogs into one for ease of tracking

## 1.7 - 12/4/2022

- Cura Profile Changes
  - Significant quality updates based on feedback from @Tenson_UK
    - For the normal profile, set the first layer height to match the rest of the print. (0.2)
    - Set "Initial Layer Horizontal Expansion" and "Hole Horizontal Expansion" to improve quality
    - Set "Top/Bottom Thickness" to improve quality
    - Changed infill logic to increase infill speeds.
      - NOTE: Part strength is slightly weaker, so adjust as needed.
    - Changed print temperature logic for more consistency
    - Changed "Top/Bottom Flow" and "Initial Layer Flow" to improve print quality
    - Set "Combing Mode" to "Within Infill" to reduce the number of retractions.
    - Complete rework of support settings that provides easy removal and good part support.
      - NOTE: Tree supports have no optimization at this time.
    - Adjusted the following experimental settings to improve print quality.
      - "Overhanging Wall Angle"
      - "Overhanging Wall Speed
      - "Small Hole Max Size"
      - "Small Feature Initial Layer Speed"
  - Regrouping/ordering of overrides to match base setting order
- Prusa Slicer Profile Changes
  - none

## 1.6 - 12/4/2022

- Cura Profile Changes
  - set retraciton speed to 60 to match AnkerMake defaults
- Prusa Slicer Profile Changes
  - none

## 1.5 - 12/1/2022

- Cura Profile Changes
  - add back in "extruder_nr": { "default_value": 0 }, to pass unit test and fix bug.
  - fix typos in readme.md
- Prusa Slicer Profile Changes
  - none

## 1.4 - 12/1/2022

- Cura Profile Changes
  - Complete refactor based on feedback from the Cura team to simplify the profile
    - Updated to follow new linting rules and suggestions
    - Significant reduction of base configuration overrides
    - Tested to ensure high-speed printing is functioning
    - Updated printing temperature logic to work correctly.
    - Added slight extrusion to start gcode to compensate for over-retraction after prime
  - Clarified instructions to locate folders
  - Migrated instructions From Google Docs to GitHub
  - Reversed the order of the changelog to show the newest first
- Prusa Slicer Profile Changes
  - none

## 1.3 - 11/16/2022

- Cura Profile Changes
  - Added “machine_head_with_fans_polygon” for one-at-a-time printing
  - Renamed image and platform object to match with GitHub submission. (<https://github.com/Ultimaker/Cura/pull/13628/>)
  - Slight modification to the file structure
  - Updated directions.
- Prusa Slicer Profile Changes
  - none

## 1.2 - 10/22/2022

- Cura Profile Changes
  - Fixed retraction amount defaults.
  - Adjusted acceleration to AnkerMake recommended settings.
  - Completely rebuilt settings from Anker profiles, so the values are consistent.
  - Update start and end gcode to Anker defaults
  - Added custom bed png image
  - Added more detailed settings provided by others
- Prusa Slicer Profile Changes
  - Set default filament to PLA+
  - Enabled detect bridging perimeters
  - Increase skirt count from 1-3
  - Disabled filament override for max volumetric speed.
  - Change fan to be disabled from 1 to 2 layers
  - Turned off enabled auto cooling to prevent speed reduction
  - Adjusted first_layer_temperature for all filaments to match Anker slicer
  - Adjusted bed temperatures for ABS
  - Fix PLA+ inheriting values from PLA

## 1.1 - Bug Fixes

## 1.0 - Initial Release
