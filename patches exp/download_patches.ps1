# Create subfolders if they don't exist
$patchesDir = "d:\Documents\GitHub\ReVanced-APKs-output\patches exp"
$revancedDir = Join-Path $patchesDir "revanced"
$inotiaDir = Join-Path $patchesDir "inotia00"
$anddeaDir = Join-Path $patchesDir "anddea"

@($revancedDir, $inotiaDir, $anddeaDir) | ForEach-Object {
    if (!(Test-Path $_)) {
        New-Item -ItemType Directory -Path $_ | Out-Null
    }
}

# Function to download latest .rvp files from a GitHub repository
function Download-LatestRvpFiles {
    param (
        [string]$repoUrl,
        [string]$outputDir
    )

    try {
        # Get latest release info using GitHub API
        $apiUrl = $repoUrl -replace "https://github.com/", "https://api.github.com/repos/"
        $releaseInfo = Invoke-RestMethod -Uri "$apiUrl/releases/latest" -UseBasicParsing

        # Get download URLs for .rvp files
        $downloadUrls = $releaseInfo.assets |
        Where-Object { $_.name -like "*.rvp" } |
        Select-Object -ExpandProperty browser_download_url

        if (!$downloadUrls) {
            Write-Host "No .rvp files found in latest release of $repoUrl"
            return
        }

        # Download each .rvp file
        foreach ($url in $downloadUrls) {
            $fileName = [System.IO.Path]::GetFileName($url)
            $outputPath = Join-Path $outputDir $fileName
            Invoke-WebRequest -Uri $url -OutFile $outputPath -UseBasicParsing
            Write-Host "Downloaded: $fileName to $outputDir"
        }
    }
    catch {
        Write-Host "Error downloading from $repoUrl : $_"
    }
}

# Download from each repository
Download-LatestRvpFiles -repoUrl "https://github.com/ReVanced/revanced-patches" -outputDir $revancedDir
Download-LatestRvpFiles -repoUrl "https://github.com/inotia00/revanced-patches" -outputDir $inotiaDir
Download-LatestRvpFiles -repoUrl "https://github.com/anddea/revanced-patches" -outputDir $anddeaDir

Write-Host "All downloads completed!"