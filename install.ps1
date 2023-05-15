# Look for PrusaSlicer config directory
$selection
$availablePrusaSlicerDirs = @()

$prusaSlicerDirs = @(
    $HOME + '\AppData\Roaming\PrusaSlicer'
    $HOME + '\AppData\Roaming\PrusaSlicer-alpha'
    $HOME + '\AppData\Roaming\PrusaSlicer-beta'
    $HOME + '\AppData\Roaming\AnkerMake_alpha-alpha'
    $HOME + '\AppData\Roaming\SuperSlicer'
    $HOME + '\AppData\Roaming\SuperSlicer-alpha'
    $HOME + '\AppData\Roaming\SuperSlicer-beta'
)

foreach ($dir in $prusaSlicerDirs) {
    if (Test-Path -Path $dir) {
        $availablePrusaSlicerDirs += $dir
    }
}

# Check if any PrusaSlicer config directory exists
if ($availablePrusaSlicerDirs.Length -eq 0) {
    Write-Host "PrusaSlicer config directory not found."
    exit 1
}

If ($availablePrusaSlicerDirs.Length -gt 1) {
    Write-Host "Multiple PrusaSlicer directories found."
    Write-Host "Please choose which one you want to install the profiles to:"

    # Build the choices menu
    $choices = @()
    For ($index = 0; $index -lt $availablePrusaSlicerDirs.Count; $index++) {
        Write-Host "[$index] $($availablePrusaSlicerDirs[$index])"
        # $choices += New-Object System.Management.Automation.Host.ChoiceDescription [$index], ($availablePrusaSlicerDirs[$index])
    }
    $chosen = Read-host [Your selection]
    $selection = $availablePrusaSlicerDirs[$chosen]
}
else { $selection = $availablePrusaSlicerDirs[0] }

Write-Host $selection

$title = "Installing Profiles to $selection" 
$question = 'Are you sure you want to proceed?'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
if ($decision -eq 0) {
 
    # Copy all folders from ./vendor to $prusaSlicerDir
    $srcDir = Join-Path -Path $PSScriptRoot -ChildPath 'vendor'
 
    # $destDir = Join-Path -Path $selection -ChildPath 'vendor'
    $destDir = $selection
 
    Write-Host "Copying $srcDir to $destDir"
    Copy-Item -Path $srcDir -Destination $destDir -Recurse -Force
    Write-Host 'Installation completed'
    
    # Set the destination directory
    $prusaVendorDir = Join-Path -Path $destDir -ChildPath 'vendor'
    Invoke-Item -Path "$prusaVendorDir"
}
else {
    Write-Host 'Installation cancelled'
}
