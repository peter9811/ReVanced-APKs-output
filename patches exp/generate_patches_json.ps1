$patchesDir = "d:\Documents\GitHub\ReVanced-APKs-output\patches exp"
$jarPath = "$patchesDir\patches-json-gen.jar"

# Get all subdirectories in patches folder
$subDirs = Get-ChildItem -Path $patchesDir -Directory

foreach ($dir in $subDirs) {
    # Find the newest .rvp file in the directory
    $latestRvp = Get-ChildItem -Path $dir.FullName -Filter "*.rvp" |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1

    if ($latestRvp) {
        # Extract version from filename (assuming format like "patches-2.123.4.rvp")
        $version = $latestRvp.Name -replace "^.*?(\d+\.\d+\.\d+).*$", '$1'

        # Create output filename (folderName-version.json) and place in same folder
        $outputName = "$($dir.Name)-$version.json"
        $outputPath = Join-Path $dir.FullName $outputName

        # Run the jar command
        Write-Host "Generating $outputName from $($latestRvp.Name)..."
        java -jar $jarPath $latestRvp.FullName $outputPath

        if (Test-Path $outputPath) {
            Write-Host "Successfully generated $outputName"
        }
        else {
            Write-Host "Failed to generate $outputName"
        }
    }
    else {
        Write-Host "No .rvp files found in $($dir.Name)"
    }
}

Write-Host "JSON generation completed for all folders"