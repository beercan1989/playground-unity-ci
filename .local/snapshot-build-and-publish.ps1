
# Where this script is
$Script = (Get-Item $PSScriptRoot)

# Where the project root is
$Source = $Script.Parent.FullName

# Where the snapshot project will be
$Destination = "$($Script.Parent.Parent.FullName)\$($Script.Parent.Name)-snapshot"

# Check if the destination already exists
if(Test-Path $Destination) {

  Write-Host "[INFO]" -ForegroundColor Green
  Write-Host "[INFO] Using an existing clone..." -ForegroundColor Green
  Write-Host "[INFO]" -ForegroundColor Green

} else {

  Write-Host "[INFO]" -ForegroundColor Green
  Write-Host "[INFO] Creating new clone..." -ForegroundColor Green
  Write-Host "[INFO]" -ForegroundColor Green

  mkdir $Destination

}

# Move the working directory to be the destination project
Push-Location $Destination

Write-Host "[INFO]" -ForegroundColor Green
Write-Host "[INFO] Cloning the game state to: $PWD" -ForegroundColor Green
Write-Host "[INFO]" -ForegroundColor Green

##
# Take a snapshot of the current project and mirror it into the destination.DESCRIPTION
# Future runs of this will be quicker as it only needs to copy/update files that do not exist in the destination.
# https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy
##
robocopy $Source $Destination /mir /copy:DATSO /nfl /ndl /np /xd "Temp" "Build" "Logs" "obj"

Write-Host "[INFO]" -ForegroundColor Green
Write-Host "[INFO] Building the game in: $PWD" -ForegroundColor Green
Write-Host "[INFO]" -ForegroundColor Green

. "$PWD/.local/build.ps1"

Write-Host "[INFO]" -ForegroundColor Green
Write-Host "[INFO] Publishing the game in: $PWD" -ForegroundColor Green
Write-Host "[INFO]" -ForegroundColor Green

. "$PWD/.local/publish.ps1"

Write-Host "[INFO]" -ForegroundColor Green
Write-Host "[INFO] Success" -ForegroundColor Green
Write-Host "[INFO]" -ForegroundColor Green

Pop-Location
