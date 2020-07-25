# Playground Unity 2D
![Build Unity](https://github.com/beercan1989/playground-unity-2d/workflows/Build%20Unity/badge.svg)
![Publish Unity](https://github.com/beercan1989/playground-unity-2d/workflows/Publish%20Unity/badge.svg)

Playing with Unity and 2D, along with other stuff.

## CI Github Action

[.github/workflows/build.yml](.github/workflows/build.yml) runs to build against the target platforms (windows, linux, osx and webgl) on every new pull request.

## CD Github Action

[.github/workflows/publish.yml](.github/workflows/publish.yml) runs to publish the target platform builds to https://beercan.itch.io/playground-unity-2d

## Sources of information

### Nuget dependencies
* https://github.com/GlitchEnzo/NuGetForUnity
* https://medium.com/@jonfoust/using-gcp-nuget-packages-with-unity-8dbd29c42cc4
* https://docs.microsoft.com/en-us/visualstudio/cross-platform/unity-scripting-upgrade?view=vs-2019

### Pixel perfect
* https://blogs.unity3d.com/2019/03/13/2d-pixel-perfect-how-to-set-up-your-unity-project-for-retro-8-bits-games/

### CI with Unity

#### Github
* https://github.com/marketplace/actions/unity-builder
* https://unity-ci.com/docs/github
* https://github.com/webbertakken/unity-actions
* https://github.com/marketplace/actions/butler-push
* https://github.community/t/syntax-for-replacing-characters-in-string/17240/2

#### Travis
* https://stablekernel.com/article/continuous-integration-for-unity-5-using-travisci/

#### Azure DevOps
* https://github.com/microsoft/Azure-DevOps-YAML-for-Unity
* https://medium.com/medialesson/continuous-integration-for-unity-3d-projects-using-azure-pipelines-e61ddf64ad79
