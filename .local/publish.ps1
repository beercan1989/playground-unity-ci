##
# Import functions
##
. "$PSScriptRoot/functions.ps1"

##
# Publish
##
ItchIoPublish -BuildTarget StandaloneWindows64 -Project beercan/playground-unity-ci -Channel windows
ItchIoPublish -BuildTarget StandaloneLinux64 -Project beercan/playground-unity-ci -Channel linux
ItchIoPublish -BuildTarget StandaloneOSX -Project beercan/playground-unity-ci -Channel osx
ItchIoPublish -BuildTarget Android -Project beercan/playground-unity-ci -Channel android
ItchIoPublish -BuildTarget WebGL -Project beercan/playground-unity-ci -Channel webgl
