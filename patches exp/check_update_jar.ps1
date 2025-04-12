$jarUrl = "https://github.com/j-hc/rvmm-config-gen/raw/master/patches-json-gen.jar"
$apiUrl = "https://api.github.com/repos/j-hc/rvmm-config-gen/contents/patches-json-gen.jar"
$localPath = "d:\Documents\GitHub\ReVanced-APKs-output\patches exp\patches-json-gen.jar"

# GitHub API requires a user agent
$headers = @{
    "User-Agent" = "PowerShell Script"
}

try {
    # Get remote file info from GitHub API
    $fileInfo = Invoke-RestMethod -Uri $apiUrl -Headers $headers -UseBasicParsing
    $remoteSha = $fileInfo.sha
    $remoteSize = $fileInfo.size

    # Check if local file exists and compare
    if (Test-Path $localPath) {
        $localFile = Get-Item $localPath
        $localSize = $localFile.Length

        # First check size (quick comparison)
        if ($remoteSize -eq $localSize) {
            # Calculate Git-style SHA1 hash of local file
            $content = [System.IO.File]::ReadAllBytes($localPath)
            $header = "blob $($content.Length)`0"
            $headerBytes = [System.Text.Encoding]::UTF8.GetBytes($header)
            $gitObject = $headerBytes + $content
            $localSha = [System.BitConverter]::ToString(
                (New-Object System.Security.Cryptography.SHA1Managed).ComputeHash($gitObject)
            ).Replace("-","").ToLower()

            if ($remoteSha -eq $localSha) {
                Write-Host "patches-json-gen.jar is already up to date"
                exit 0
            }
        }
        Write-Host "New version available - downloading update..."
    }
    else {
        Write-Host "patches-json-gen.jar not found - downloading..."
    }

    # Download the file
    Invoke-WebRequest -Uri $jarUrl -OutFile $localPath -UseBasicParsing
    Write-Host "Successfully downloaded updated patches-json-gen.jar"
}
catch {
    Write-Host "Error checking or downloading patches-json-gen.jar: $_"
    exit 1
}