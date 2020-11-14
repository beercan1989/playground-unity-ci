##
# Import functions
##
. "$PSScriptRoot/functions.ps1"

##
# Build
##
UnityBuild -BuildTarget StandaloneWindows64 -BuildName playground-unity-ci.exe
UnityBuild -BuildTarget StandaloneLinux64 -BuildName playground-unity-ci
UnityBuild -BuildTarget StandaloneOSX -BuildName playground-unity-ci
UnityBuild -BuildTarget Android -BuildName playground-unity-ci.apk
UnityBuild -BuildTarget WebGL -BuildName playground-unity-ci
