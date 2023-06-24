# Look for PrusaSlicer config directory
$selection
$availableApps = @()

$compatibleApps = @(
    [pscustomobject]@{appName = 'PrusaSlicer'; directory = $HOME + '\AppData\Roaming\PrusaSlicer' }
    [pscustomobject]@{appName = 'PrusaSlicer Alpha'; directory = $HOME + '\AppData\Roaming\PrusaSlicer-alpha' }
    [pscustomobject]@{appName = 'PrusaSlicer Beta'; directory = $HOME + '\AppData\Roaming\PrusaSlicer-beta' }
    # [pscustomobject]@{appName = 'AnkerMake Alpha'; directory = $HOME + '\AppData\Roaming\AnkerMake_alpha-alpha' }
)

foreach ($app in $compatibleApps) {
    if (Test-Path -Path $app.directory) {
        Write-Host 'dir: '+ $app.directory + ' app: ' + $app.appName
        $availableApps += $app
    }
}

# Check if any PrusaSlicer config directory exists
if ($availableApps.Length -eq 0) {
    Write-Host "No compatible applications found."
    exit 1
}

If ($availableApps.Length -gt 1) {
    Write-Host "Multiple compatible applications found."
    Write-Host "Please choose which one you want to install the profiles to:"

    # Build the choices menu
    $choices = @()
    For ($index = 0; $index -lt $availableApps.Count; $index++) {
        Write-Host "[$index] $($availableApps[$index].appName)"
        # $choices += New-Object System.Management.Automation.Host.ChoiceDescription [$index], ($availablePrusaSlicerDirs[$index])
    }
    $chosen = Read-host [Your selection]
    $selection = $availableApps[$chosen].directory
}
else { $selection = $availableApps[0].directory }

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
