# Look for PrusaSlicer config directory
$prusaSlicerDir = Join-Path -Path $env:APPDATA -ChildPath 'PrusaSlicer'

# Check if PrusaSlicer config directory exists
if (!(Test-Path -Path $prusaSlicerDir -PathType Container)) {
    Write-Host "PrusaSlicer config directory not found."
    exit 1
}

# Set the destination directory
$prusaVendorDir = Join-Path -Path $prusaSlicerDir -ChildPath 'vendor'

# Open in windows explorer $prusaSlicerDir
Invoke-Item -Path "$prusaVendorDir"

# Check if destination directory or files exist
$folders = @('AnkerMakeCE')
$files = @('AnkerMakeCE.idx', 'AnkerMakeCE.ini')

# Copy all folders from ./vendor to $prusaSlicerDir/vendor
foreach ($folder in $folders) {
    $srcDir = Join-Path -Path $PSScriptRoot/vendor -ChildPath $folder
    $destDir = Join-Path -Path $prusaVendorDir -ChildPath $folder

    Write-Host "Copying $srcDir to $destDir/$folder"
    Copy-Item -Path $srcDir -Destination $destDir/$folder -Recurse -Force
}

# Copy all files from ./vendor to $prusaSlicerDir/vendor
foreach ($file in $files) {
    $srcFile = Join-Path -Path $PSScriptRoot/vendor -ChildPath $file
    $destFile = Join-Path -Path $prusaVendorDir -ChildPath $file

    Write-Host "Copying $srcFile to $destFile"
    Copy-Item -Path $srcFile -Destination $destFile -Force
}
