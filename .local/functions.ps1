##
# Build in unity
##
function UnityBuild($BuildTarget, $BuildName, $UnityVersion = "2019.4.12f1") {

  Write-Host "[INFO]" -ForegroundColor Green
  Write-Host "[INFO] Starting build for: $BuildTarget" -ForegroundColor Green
  Write-Host "[INFO]" -ForegroundColor Green

  & "C:\Program Files\Unity\Hub\Editor\$UnityVersion\Editor\Unity.exe" -batchmode -quit -nographics -projectPath "$PWD" -buildName "$BuildName" -buildTarget "$BuildTarget" -executeMethod Editor.Builder.Build | Write-Output

  if ($? -eq $false) {
    Write-Host "[ERROR]" -ForegroundColor Red
    Write-Host "[ERROR] Failed $BuildName - $BuildTarget " -ForegroundColor Red
    Write-Host "[ERROR]" -ForegroundColor Red
    exit 1
  }

  Write-Host "[INFO]" -ForegroundColor Green
  Write-Host "[INFO] Finished build for: $BuildTarget" -ForegroundColor Green
  Write-Host "[INFO]" -ForegroundColor Green
}

##
# Publish to Itch.io
##
function ItchIoPublish($BuildTarget, $Project, $Channel) {

  Write-Host "[INFO]" -ForegroundColor Green
  Write-Host "[INFO] Publishing ${BuildTarget} to ${Project}:${Channel}" -ForegroundColor Green
  Write-Host "[INFO]" -ForegroundColor Green

  butler push ./Build/${BuildTarget} ${Project}:${Channel}

  if ($? -eq $false) {
    Write-Host "[ERROR]" -ForegroundColor Red
    Write-Host "[ERROR] Failed to publish ${BuildTarget} to ${Project}:${Channel} " -ForegroundColor Red
    Write-Host "[ERROR]" -ForegroundColor Red
    exit 1
  }

  Write-Host "[INFO]" -ForegroundColor Green
  Write-Host "[INFO] Published ${BuildTarget} to ${Project}:${Channel}" -ForegroundColor Green
  Write-Host "[INFO]" -ForegroundColor Green
}
